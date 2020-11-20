"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var tslib_1 = require("tslib");
var sass_1 = tslib_1.__importDefault(require("sass"));
var sass_graph_1 = tslib_1.__importDefault(require("sass-graph"));
var path_1 = require("path");
var fs = tslib_1.__importStar(require("fs-extra"));
var util = tslib_1.__importStar(require("util"));
var chalk_1 = tslib_1.__importDefault(require("chalk"));
var node_notifier_1 = tslib_1.__importDefault(require("node-notifier"));
var stylelint_1 = tslib_1.__importDefault(require("stylelint"));
var util_1 = require("./lib/util");
var SassTask = /** @class */ (function () {
    /**
     * Prepare Sass Graph
     */
    function SassTask(dirname) {
        this.dirname = dirname;
        this.graph = sass_graph_1.default.parseDir(dirname);
    }
    /**
     * Update Sass Graph
     */
    SassTask.prototype.updateGraph = function () {
        this.graph = sass_graph_1.default.parseDir(this.dirname);
    };
    /**
     * Get parent scss files
     *
     * @param childPath
     * @param parents
     */
    SassTask.prototype.getParentPath = function (childPath, parents) {
        var _this = this;
        if (parents === void 0) { parents = []; }
        if (this.graph === null) {
            return [];
        }
        this.graph.visitAncestors(childPath, function (parent, _) {
            var fileName = path_1.basename(parent);
            if (fileName.match(/^_/)) {
                _this.getParentPath(parent, parents);
            }
            else {
                parents.push(parent.replace(/\\/gi, "/"));
            }
        });
        return parents;
    };
    /**
     * Get child scss files
     *
     * @param parentPath
     * @param children
     */
    SassTask.prototype.getChildrenPath = function (parentPath, children) {
        if (children === void 0) { children = []; }
        if (this.graph === null) {
            return [];
        }
        this.graph.visitDescendents(parentPath, function (child, _) {
            if (child) {
                children.push(child.replace(/\\/gi, "/"));
            }
        });
        return children;
    };
    /**
     * Build SCSS file (sass render and scss lint)
     *
     * @param file
     */
    SassTask.prototype.build = function (file) {
        return tslib_1.__awaiter(this, void 0, void 0, function () {
            var outDir, outFile, result;
            return tslib_1.__generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        this.updateGraph();
                        outDir = (path_1.dirname(file) + "/").replace(/\/scss\//, "/css/");
                        outFile = outDir + path_1.basename(file, "scss") + "css";
                        return [4 /*yield*/, this.render(file, outDir, outFile).catch(function (e) {
                                util.log(chalk_1.default.bgRedBright(chalk_1.default.black("Failed building")) + (" : " + file));
                                util.log(util.inspect(e, { colors: true }));
                                node_notifier_1.default.notify({
                                    message: e.message,
                                    title: "[SCSS] Failed building",
                                    sound: "Glass",
                                });
                            })];
                    case 1:
                        result = _a.sent();
                        if (!result) {
                            return [2 /*return*/, ""];
                        }
                        return [4 /*yield*/, fs.writeFile(outFile, result.css)];
                    case 2:
                        _a.sent();
                        return [4 /*yield*/, fs.writeFile(outFile + ".map", result.map)];
                    case 3:
                        _a.sent();
                        util.log(chalk_1.default.bgGreenBright(chalk_1.default.black("Finished building")) + (" : " + file));
                        return [2 /*return*/, outFile];
                }
            });
        });
    };
    /**
     * Lint scss file
     *
     * @param file
     */
    SassTask.prototype.lint = function (file, isIncludeChild) {
        if (isIncludeChild === void 0) { isIncludeChild = false; }
        return tslib_1.__awaiter(this, void 0, void 0, function () {
            var hasLintError, children, i;
            return tslib_1.__generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        hasLintError = false;
                        return [4 /*yield*/, this.lintRun(file).catch(function () {
                                hasLintError = true;
                            })];
                    case 1:
                        _a.sent();
                        if (!isIncludeChild) return [3 /*break*/, 5];
                        children = this.getChildrenPath(file);
                        i = 0;
                        _a.label = 2;
                    case 2:
                        if (!(i < children.length)) return [3 /*break*/, 5];
                        return [4 /*yield*/, this.lintRun(children[i]).catch(function () {
                                hasLintError = true;
                            })];
                    case 3:
                        _a.sent();
                        _a.label = 4;
                    case 4:
                        i += 1;
                        return [3 /*break*/, 2];
                    case 5:
                        if (hasLintError) {
                            util.log(chalk_1.default.bgRedBright(chalk_1.default.black("Lint Error(s) is occureed")) +
                                " : See lint error log");
                        }
                        return [2 /*return*/, hasLintError];
                }
            });
        });
    };
    SassTask.prototype.lintRun = function (file) {
        return tslib_1.__awaiter(this, void 0, void 0, function () {
            var lintResult;
            return tslib_1.__generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        util.log("Start lint : " + file);
                        return [4 /*yield*/, stylelint_1.default
                                .lint({
                                files: file,
                            })
                                .catch(function (e) {
                                util.log(e);
                            })];
                    case 1:
                        lintResult = _a.sent();
                        if (!lintResult) {
                            return [2 /*return*/];
                        }
                        if (lintResult.errored) {
                            util.log(chalk_1.default.bgRedBright(chalk_1.default.black("Lint error")) + (" : " + file));
                            lintResult.results.forEach(function (row) {
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
                                    console.log(chalk_1.default.bgRedBright(chalk_1.default.black("[Warnings]")) +
                                        " ------------------------------");
                                    row.warnings.forEach(function (err) {
                                        console.log("[Line:%d] %s", err.line, err.text);
                                    });
                                    console.log("-----------------------------------------");
                                }
                                // Deprecations
                                if (row.deprecations.length) {
                                    console.log(chalk_1.default.bgRedBright(chalk_1.default.black("[Deprecations]")) +
                                        " ------------------------------");
                                    row.deprecations.forEach(function (deprecation) {
                                        console.log(deprecation);
                                    });
                                    console.log("-----------------------------------------");
                                }
                                // InvalidOptionWarnings
                                if (row.invalidOptionWarnings.length) {
                                    console.log(chalk_1.default.bgRedBright(chalk_1.default.black("[InvalidOptionWarnings]")) + " ------------------------------");
                                    row.invalidOptionWarnings.forEach(function (err) {
                                        console.log("[Line:%d] %s", err.line, err.text);
                                    });
                                    console.log("-----------------------------------------");
                                }
                            });
                            node_notifier_1.default.notify({
                                message: lintResult.output,
                                title: "[SCSS] Lint Error",
                                sound: "Glass",
                            });
                            throw new Error(lintResult.output);
                        }
                        return [2 /*return*/];
                }
            });
        });
    };
    /**
     * SCSS render file
     *
     * @param file
     * @param outDir
     * @param outFile
     */
    SassTask.prototype.render = function (file, outDir, outFile) {
        return tslib_1.__awaiter(this, void 0, void 0, function () {
            return tslib_1.__generator(this, function (_a) {
                return [2 /*return*/, new Promise(function (resolve, reject) {
                        var sourceMap = outFile + ".map";
                        sass_1.default.render({
                            file: file,
                            outFile: outFile,
                            sourceMap: sourceMap,
                            importer: function (url, _, done) {
                                var file = path_1.resolve(process.cwd() + "/node_modules/" + url);
                                done({ file: file });
                            },
                        }, function (err, result) {
                            if (err !== null) {
                                return reject(err);
                            }
                            try {
                                fs.accessSync(outDir, fs.constants.F_OK);
                            }
                            catch (err) {
                                fs.mkdirsSync(outDir);
                            }
                            resolve(result);
                        });
                    })];
            });
        });
    };
    /**
     * Build handler (one file)
     *
     * @param path
     */
    SassTask.prototype.buildOne = function (path, ignoreLint) {
        if (ignoreLint === void 0) { ignoreLint = false; }
        return tslib_1.__awaiter(this, void 0, void 0, function () {
            var formattedPath, targetPaths, fileName, result, i, file, sassResult;
            return tslib_1.__generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        formattedPath = path.replace(/\\/gi, "/");
                        targetPaths = [formattedPath];
                        fileName = path_1.basename(formattedPath);
                        result = [];
                        if (!!ignoreLint) return [3 /*break*/, 2];
                        return [4 /*yield*/, this.lint(formattedPath)];
                    case 1:
                        if (_a.sent()) {
                            return [2 /*return*/, []];
                        }
                        _a.label = 2;
                    case 2:
                        if (fileName.match(/^_/)) {
                            targetPaths = Array.from(new Set(this.getParentPath(formattedPath)));
                        }
                        i = 0;
                        _a.label = 3;
                    case 3:
                        if (!(i < targetPaths.length)) return [3 /*break*/, 6];
                        file = targetPaths[i];
                        return [4 /*yield*/, this.build(file)];
                    case 4:
                        sassResult = _a.sent();
                        if (sassResult) {
                            result.push(sassResult);
                        }
                        _a.label = 5;
                    case 5:
                        i += 1;
                        return [3 /*break*/, 3];
                    case 6: return [2 /*return*/, result];
                }
            });
        });
    };
    /**
     * Build handler (all file)
     *
     * @param paths
     */
    SassTask.prototype.buildAll = function (paths, ignoreLint) {
        if (ignoreLint === void 0) { ignoreLint = false; }
        return tslib_1.__awaiter(this, void 0, void 0, function () {
            var result, fileList, filteredList, i, file, sassResult;
            return tslib_1.__generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        result = [];
                        return [4 /*yield*/, util_1.getFileList(paths).catch(function (e) {
                                util.log(e);
                            })];
                    case 1:
                        fileList = _a.sent();
                        if (!fileList) {
                            return [2 /*return*/, result];
                        }
                        filteredList = fileList.filter(function (path) {
                            var fileName = path_1.basename(path);
                            return !fileName.match(/^_/);
                        });
                        i = 0;
                        _a.label = 2;
                    case 2:
                        if (!(i < filteredList.length)) return [3 /*break*/, 7];
                        file = filteredList[i].replace(/\\/gi, "/");
                        if (!!ignoreLint) return [3 /*break*/, 4];
                        return [4 /*yield*/, this.lint(file, true)];
                    case 3:
                        if (_a.sent()) {
                            return [3 /*break*/, 6];
                        }
                        _a.label = 4;
                    case 4: return [4 /*yield*/, this.build(file)];
                    case 5:
                        sassResult = _a.sent();
                        if (sassResult) {
                            result.push(sassResult);
                        }
                        _a.label = 6;
                    case 6:
                        i += 1;
                        return [3 /*break*/, 2];
                    case 7: return [2 /*return*/, result];
                }
            });
        });
    };
    return SassTask;
}());
exports.default = SassTask;
//# sourceMappingURL=sass.js.map