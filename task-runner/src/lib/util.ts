import glob from "glob";
import fs, { Stats } from "fs-extra";

export const getFileList = async (
    pattern: string,
    options = {}
): Promise<string[]> => {
    return new Promise((resolve, reject) => {
        glob(pattern, options, (err, files) => {
            if (err) {
                reject(err);
            } else {
                resolve(files);
            }
        });
    });
};

export const getFileData = async (path: string): Promise<Buffer> => {
    return new Promise((resolve, reject) => {
        fs.readFile(path, (err, data) => {
            if (err) {
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
};

export const getDiff = (beforeSize: Stats, afterSize: Stats): string => {
    const beforeSizeM = Math.floor(beforeSize.size / 10000) / 100;
    const afterSizeM = Math.floor(afterSize.size / 10000) / 100;
    const ratio = Math.floor((afterSize.size / beforeSize.size) * 10000) / 100;

    const displayBeforeSize =
        beforeSizeM > 0 ? `${beforeSizeM}MB` : `${beforeSize.size / 1000}KB`;
    const displayAfterSize =
        afterSizeM > 0 ? `${afterSizeM}MB` : `${afterSize.size / 1000}KB`;

    return `${displayBeforeSize} -> ${displayAfterSize} (${ratio}%)`;
};
