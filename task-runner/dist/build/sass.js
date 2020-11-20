"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var tslib_1 = require("tslib");
var path_1 = require("path");
var sass_1 = tslib_1.__importDefault(require("../sass"));
(function () { return tslib_1.__awaiter(void 0, void 0, void 0, function () {
    var targets, task;
    return tslib_1.__generator(this, function (_a) {
        switch (_a.label) {
            case 0:
                targets = (process.env.npm_package_config_sass || "").split(",");
                if (!targets.length) {
                    return [2 /*return*/];
                }
                task = new sass_1.default(path_1.resolve(process.cwd() + "/" + process.env.npm_package_config_base));
                return [4 /*yield*/, Promise.all(targets.map(function (target) { return tslib_1.__awaiter(void 0, void 0, void 0, function () {
                        var filePath;
                        return tslib_1.__generator(this, function (_a) {
                            filePath = path_1.resolve(process.cwd() + "/" + target + "/**/*.scss");
                            task.buildAll(filePath);
                            return [2 /*return*/];
                        });
                    }); }))];
            case 1:
                _a.sent();
                return [2 /*return*/];
        }
    });
}); })();
//# sourceMappingURL=sass.js.map