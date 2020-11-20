"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var tslib_1 = require("tslib");
var path_1 = tslib_1.__importDefault(require("path"));
var sharp_1 = tslib_1.__importDefault(require("sharp"));
var util_1 = require("../lib/util");
var mode = process.argv[2];
var pathPattern = process.argv[3];
(function () { return tslib_1.__awaiter(void 0, void 0, void 0, function () {
    var files, convertWebp, convertJpeg;
    return tslib_1.__generator(this, function (_a) {
        switch (_a.label) {
            case 0: return [4 /*yield*/, util_1.getFileList(pathPattern)];
            case 1:
                files = _a.sent();
                convertWebp = function (file) {
                    return sharp_1.default(file).webp({ quality: 80 });
                };
                convertJpeg = function (file) {
                    return sharp_1.default(file).jpeg({ quality: 80 });
                };
                Promise.all(files.map(function (file) {
                    return new Promise(function (resolve, reject) {
                        var outputDir = path_1.default.dirname(file);
                        var targetFile = path_1.default.basename(file);
                        var targetExt = path_1.default.extname(targetFile);
                        var imageName = targetFile.replace(targetExt, "");
                        var outputFile;
                        var convertHelper;
                        switch (mode) {
                            case "webp":
                                convertHelper = convertWebp(file);
                                outputFile = outputDir + "/" + imageName + ".webp";
                                break;
                            case "jpg":
                            case "jpeg":
                                convertHelper = convertJpeg(file);
                                outputFile = outputDir + "/" + imageName + ".jpg";
                                break;
                            default:
                                console.error("Missing mode", mode);
                                reject("Error");
                                return;
                        }
                        convertHelper
                            .toFile(outputFile)
                            .then(function () {
                            console.log("Finished", outputFile);
                            resolve("Finish");
                        })
                            .catch(function (e) {
                            console.error("Error", e);
                            reject("Error");
                        });
                    });
                }));
                return [2 /*return*/];
        }
    });
}); })();
//# sourceMappingURL=convert.js.map