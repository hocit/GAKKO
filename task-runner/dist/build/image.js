"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var tslib_1 = require("tslib");
var fs_extra_1 = tslib_1.__importDefault(require("fs-extra"));
var imagemin_1 = tslib_1.__importDefault(require("imagemin"));
var imagemin_mozjpeg_1 = tslib_1.__importDefault(require("imagemin-mozjpeg"));
var imagemin_optipng_1 = tslib_1.__importDefault(require("imagemin-optipng"));
var imagemin_svgo_1 = tslib_1.__importDefault(require("imagemin-svgo"));
var glob_1 = tslib_1.__importDefault(require("glob"));
var util_1 = require("../lib/util");
var util = tslib_1.__importStar(require("util"));
var chalk_1 = tslib_1.__importDefault(require("chalk"));
var targetPattern = process.argv[2];
(function () { return tslib_1.__awaiter(void 0, void 0, void 0, function () {
    var files;
    return tslib_1.__generator(this, function (_a) {
        switch (_a.label) {
            case 0:
                files = glob_1.default.sync(targetPattern);
                return [4 /*yield*/, Promise.all(files.map(function (file) { return tslib_1.__awaiter(void 0, void 0, void 0, function () {
                        var tmpFileName, beforeSize, r, result, afterSize, e_1;
                        return tslib_1.__generator(this, function (_a) {
                            switch (_a.label) {
                                case 0:
                                    _a.trys.push([0, 9, , 10]);
                                    tmpFileName = "./__tmp__" + file.replace(/\\/gi, "/").replace(/\//g, "_");
                                    return [4 /*yield*/, fs_extra_1.default.stat(file)];
                                case 1:
                                    beforeSize = _a.sent();
                                    return [4 /*yield*/, imagemin_1.default([file], {
                                            // destination,
                                            glob: false,
                                            plugins: [
                                                imagemin_mozjpeg_1.default({ quality: 80 }),
                                                imagemin_optipng_1.default(),
                                                imagemin_svgo_1.default(),
                                            ],
                                        })];
                                case 2:
                                    r = _a.sent();
                                    if (!r.length) {
                                        throw new Error("No result");
                                    }
                                    result = r[0];
                                    return [4 /*yield*/, fs_extra_1.default.writeFile(tmpFileName, result.data)];
                                case 3:
                                    _a.sent();
                                    return [4 /*yield*/, fs_extra_1.default.stat(tmpFileName)];
                                case 4:
                                    afterSize = _a.sent();
                                    util_1.getDiff(beforeSize, afterSize);
                                    if (!(afterSize.size < beforeSize.size)) return [3 /*break*/, 6];
                                    return [4 /*yield*/, fs_extra_1.default.writeFile(file, result.data)];
                                case 5:
                                    _a.sent();
                                    util.log(chalk_1.default.bgGreenBright(chalk_1.default.black("Finished compress FILE")) + (" : " + file + " : " + util_1.getDiff(beforeSize, afterSize)));
                                    return [3 /*break*/, 7];
                                case 6:
                                    util.log(chalk_1.default.bgYellowBright(chalk_1.default.black("Skip compress FILE")) +
                                        (" : " + file + " : bigger than before " + util_1.getDiff(beforeSize, afterSize)));
                                    _a.label = 7;
                                case 7: return [4 /*yield*/, fs_extra_1.default.unlink(tmpFileName)];
                                case 8:
                                    _a.sent();
                                    return [3 /*break*/, 10];
                                case 9:
                                    e_1 = _a.sent();
                                    console.log("ERROR : " + file);
                                    throw e_1;
                                case 10: return [2 /*return*/];
                            }
                        });
                    }); }))];
            case 1:
                _a.sent();
                return [2 /*return*/];
        }
    });
}); })();
//# sourceMappingURL=image.js.map