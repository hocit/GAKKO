import sass from "sass";
import sassGraph from "sass-graph";
import { basename, dirname, resolve as pathResolve } from "path";
import * as fs from "fs-extra";
import * as util from "util";
import chalk from "chalk";
import notifier from "node-notifier";
import stylelint from "stylelint";

import { getFileList } from "./lib/util";

export default class SassTask {
    private dirname: string;
    private graph: sassGraph.Graph;

    /**
     * Prepare Sass Graph
     */
    public constructor(dirname: string) {
        this.dirname = dirname;
        this.graph = sassGraph.parseDir(dirname);
    }

    /**
     * Update Sass Graph
     */
    public updateGraph(): void {
        this.graph = sassGraph.parseDir(this.dirname);
    }

    /**
     * Get parent scss files
     *
     * @param childPath
     * @param parents
     */
    private getParentPath(childPath: string, parents: string[] = []): string[] {
        if (this.graph === null) {
            return [];
        }

        this.graph.visitAncestors(childPath, (parent, _) => {
            const fileName = basename(parent);

            if (fileName.match(/^_/)) {
                this.getParentPath(parent, parents);
            } else {
                parents.push(parent.replace(/\\/gi, "/"));
            }
        });

        return parents;
    }

    /**
     * Get child scss files
     *
     * @param parentPath
     * @param children
     */
    private getChildrenPath(
        parentPath: string,
        children: string[] = []
    ): string[] {
        if (this.graph === null) {
            return [];
        }

        this.graph.visitDescendents(parentPath, (child, _) => {
            if (child) {
                children.push(child.replace(/\\/gi, "/"));
            }
        });

        return children;
    }

    /**
     * Build SCSS file (sass render and scss lint)
     *
     * @param file
     */
    private async build(file: string): Promise<string> {
        this.updateGraph();

        const outDir = (dirname(file) + "/").replace(/\/scss\//, "/css/");
        const outFile = outDir + basename(file, "scss") + "css";

        const result = await this.render(file, outDir, outFile).catch((e) => {
            util.log(
                chalk.bgRedBright(chalk.black("Failed building")) + ` : ${file}`
            );
            util.log(util.inspect(e, { colors: true }));
            notifier.notify({
                message: e.message,
                title: "[SCSS] Failed building",
                sound: "Glass",
            });
        });

        if (!result) {
            return "";
        }
        await fs.writeFile(outFile, result.css);
        await fs.writeFile(outFile + ".map", result.map);

        util.log(
            chalk.bgGreenBright(chalk.black("Finished building")) + ` : ${file}`
        );

        return outFile;
    }

    /**
     * Lint scss file
     *
     * @param file
     */
    private async lint(file: string, isIncludeChild = false): Promise<boolean> {
        let hasLintError = false;

        await this.lintRun(file).catch(() => {
            hasLintError = true;
        });

        if (isIncludeChild) {
            const children = this.getChildrenPath(file);

            // Check children files
            for (let i = 0; i < children.length; i += 1) {
                await this.lintRun(children[i]).catch(() => {
                    hasLintError = true;
                });
            }
        }

        if (hasLintError) {
            util.log(
                chalk.bgRedBright(chalk.black("Lint Error(s) is occureed")) +
                    " : See lint error log"
            );
        }

        return hasLintError;
    }

    private async lintRun(file: string): Promise<void> {
        util.log(`Start lint : ${file}`);
        const lintResult = await stylelint
            .lint({
                files: file,
            })
            .catch((e) => {
                util.log(e);
            });

        if (!lintResult) {
            return;
        }

        if (lintResult.errored) {
            util.log(
                chalk.bgRedBright(chalk.black("Lint error")) + ` : ${file}`
            );
            lintResult.results.forEach((row) => {
                // // parseErrors
                // if (row.parseErrors.length) {
                //     console.log(chalk.bgRedBright(chalk.black('[ParseErrors]')) + ' ------------------------------')
                //     row.parseErrors.forEach((err: any) => {
                //         console.log('[Line:%d] %s', err.line, err.text)
                //     })
                //     console.log('-----------------------------------------')
                // }
                // Warning
                if (row.warnings.length) {
                    console.log(
                        chalk.bgRedBright(chalk.black("[Warnings]")) +
                            " ------------------------------"
                    );
                    row.warnings.forEach((err) => {
                        console.log("[Line:%d] %s", err.line, err.text);
                    });
                    console.log("-----------------------------------------");
                }
                // Deprecations
                if (row.deprecations.length) {
                    console.log(
                        chalk.bgRedBright(chalk.black("[Deprecations]")) +
                            " ------------------------------"
                    );
                    row.deprecations.forEach((deprecation) => {
                        console.log(deprecation);
                    });
                    console.log("-----------------------------------------");
                }
                // InvalidOptionWarnings
                if (row.invalidOptionWarnings.length) {
                    console.log(
                        chalk.bgRedBright(
                            chalk.black("[InvalidOptionWarnings]")
                        ) + " ------------------------------"
                    );
                    row.invalidOptionWarnings.forEach((err) => {
                        console.log("[Line:%d] %s", err.line, err.text);
                    });
                    console.log("-----------------------------------------");
                }
            });

            notifier.notify({
                message: lintResult.output,
                title: "[SCSS] Lint Error",
                sound: "Glass",
            });

            throw new Error(lintResult.output);
        }
    }

    /**
     * SCSS render file
     *
     * @param file
     * @param outDir
     * @param outFile
     */
    private async render(
        file: string,
        outDir: string,
        outFile: string
    ): Promise<sass.Result> {
        return new Promise((resolve, reject) => {
            const sourceMap = outFile + ".map";

            sass.render(
                {
                    file,
                    outFile,
                    sourceMap,
                    importer: (url, _, done) => {
                        const file = pathResolve(
                            `${process.cwd()}/node_modules/${url}`
                        );
                        done({ file });
                    },
                },
                (err, result) => {
                    if (err !== null) {
                        return reject(err);
                    }

                    try {
                        fs.accessSync(outDir, fs.constants.F_OK);
                    } catch (err) {
                        fs.mkdirsSync(outDir);
                    }

                    resolve(result);
                }
            );
        });
    }

    /**
     * Build handler (one file)
     *
     * @param path
     */
    public async buildOne(path: string, ignoreLint = false): Promise<string[]> {
        const formattedPath = path.replace(/\\/gi, "/");
        let targetPaths = [formattedPath];
        const fileName = basename(formattedPath);
        const result: string[] = [];

        if (!ignoreLint) {
            if (await this.lint(formattedPath)) {
                return [];
            }
        }

        if (fileName.match(/^_/)) {
            targetPaths = Array.from(
                new Set(this.getParentPath(formattedPath))
            );
        }

        for (let i = 0; i < targetPaths.length; i += 1) {
            const file = targetPaths[i];

            const sassResult = await this.build(file);
            if (sassResult) {
                result.push(sassResult);
            }
        }

        return result;
    }

    /**
     * Build handler (all file)
     *
     * @param paths
     */
    public async buildAll(
        paths: string,
        ignoreLint = false
    ): Promise<string[]> {
        const result: string[] = [];

        const fileList = await getFileList(paths).catch((e) => {
            util.log(e);
        });

        if (!fileList) {
            return result;
        }

        const filteredList = fileList.filter((path) => {
            const fileName = basename(path);
            return !fileName.match(/^_/);
        });

        for (let i = 0; i < filteredList.length; i += 1) {
            const file = filteredList[i].replace(/\\/gi, "/");

            if (!ignoreLint) {
                if (await this.lint(file, true)) {
                    continue;
                }
            }

            const sassResult = await this.build(file);
            if (sassResult) {
                result.push(sassResult);
            }
        }

        return result;
    }
}
