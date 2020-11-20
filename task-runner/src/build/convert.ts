import path from "path";
import sharp from "sharp";
import { getFileList } from "../lib/util";
const mode = process.argv[2];
const pathPattern = process.argv[3];

(async () => {
    const files = await getFileList(pathPattern);

    const convertWebp = (file: string) => {
        return sharp(file).webp({ quality: 80 });
    };
    const convertJpeg = (file: string) => {
        return sharp(file).jpeg({ quality: 80 });
    };

    Promise.all(
        files.map((file) => {
            return new Promise((resolve, reject) => {
                const outputDir = path.dirname(file);
                const targetFile = path.basename(file);
                const targetExt = path.extname(targetFile);
                const imageName = targetFile.replace(targetExt, "");
                let outputFile: string;

                let convertHelper: sharp.Sharp;
                switch (mode) {
                    case "webp":
                        convertHelper = convertWebp(file);
                        outputFile = `${outputDir}/${imageName}.webp`;
                        break;
                    case "jpg":
                    case "jpeg":
                        convertHelper = convertJpeg(file);
                        outputFile = `${outputDir}/${imageName}.jpg`;
                        break;
                    default:
                        console.error("Missing mode", mode);
                        reject("Error");
                        return;
                }

                convertHelper
                    .toFile(outputFile)
                    .then(() => {
                        console.log("Finished", outputFile);
                        resolve("Finish");
                    })
                    .catch((e) => {
                        console.error("Error", e);
                        reject("Error");
                    });
            });
        })
    );
})();
