import fs from "fs-extra";
import imagemin from "imagemin";
import imageminMozjpeg from "imagemin-mozjpeg";
import imageminOptipng from "imagemin-optipng";
import imageminSvgo from "imagemin-svgo";
import glob from "glob";
import { getDiff } from "../lib/util";
import * as util from "util";
import chalk from "chalk";

const targetPattern = process.argv[2];
(async () => {
    const files = glob.sync(targetPattern);

    await Promise.all(
        files.map(async (file) => {
            try {
                const tmpFileName =
                    "./__tmp__" + file.replace(/\\/gi, "/").replace(/\//g, "_");
                const beforeSize = await fs.stat(file);

                const r = await imagemin([file], {
                    // destination,
                    glob: false,
                    plugins: [
                        imageminMozjpeg({ quality: 80 }),
                        imageminOptipng(),
                        imageminSvgo(),
                    ],
                });

                if (!r.length) {
                    throw new Error("No result");
                }
                const result = r[0];
                await fs.writeFile(tmpFileName, result.data);

                const afterSize = await fs.stat(tmpFileName);
                getDiff(beforeSize, afterSize);

                if (afterSize.size < beforeSize.size) {
                    await fs.writeFile(file, result.data);
                    util.log(
                        chalk.bgGreenBright(
                            chalk.black("Finished compress FILE")
                        ) + ` : ${file} : ${getDiff(beforeSize, afterSize)}`
                    );
                } else {
                    util.log(
                        chalk.bgYellowBright(
                            chalk.black("Skip compress FILE")
                        ) +
                            ` : ${file} : bigger than before ${getDiff(
                                beforeSize,
                                afterSize
                            )}`
                    );
                }

                await fs.unlink(tmpFileName);
            } catch (e) {
                console.log(`ERROR : ${file}`);
                throw e;
            }
        })
    );
})();
