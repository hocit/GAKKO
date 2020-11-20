"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.getDiff = exports.getFileData = exports.getFileList = void 0;
var tslib_1 = require("tslib");
var glob_1 = tslib_1.__importDefault(require("glob"));
var fs_extra_1 = tslib_1.__importDefault(require("fs-extra"));
exports.getFileList = function (pattern, options) {
    if (options === void 0) { options = {}; }
    return tslib_1.__awaiter(void 0, void 0, void 0, function () {
        return tslib_1.__generator(this, function (_a) {
            return [2 /*return*/, new Promise(function (resolve, reject) {
                    glob_1.default(pattern, options, function (err, files) {
                        if (err) {
                            reject(err);
                        }
                        else {
                            resolve(files);
                        }
                    });
                })];
        });
    });
};
exports.getFileData = function (path) { return tslib_1.__awaiter(void 0, void 0, void 0, function () {
    return tslib_1.__generator(this, function (_a) {
        return [2 /*return*/, new Promise(function (resolve, reject) {
                fs_extra_1.default.readFile(path, function (err, data) {
                    if (err) {
                        reject(err);
                    }
                    else {
                        resolve(data);
                    }
                });
            })];
    });
}); };
exports.getDiff = function (beforeSize, afterSize) {
    var beforeSizeM = Math.floor(beforeSize.size / 10000) / 100;
    var afterSizeM = Math.floor(afterSize.size / 10000) / 100;
    var ratio = Math.floor((afterSize.size / beforeSize.size) * 10000) / 100;
    var displayBeforeSize = beforeSizeM > 0 ? beforeSizeM + "MB" : beforeSize.size / 1000 + "KB";
    var displayAfterSize = afterSizeM > 0 ? afterSizeM + "MB" : afterSize.size / 1000 + "KB";
    return displayBeforeSize + " -> " + displayAfterSize + " (" + ratio + "%)";
};
//# sourceMappingURL=util.js.map