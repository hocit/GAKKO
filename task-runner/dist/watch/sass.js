"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var tslib_1 = require("tslib");
var client_1 = tslib_1.__importDefault(require("./client"));
var path_1 = require("path");
var sass_1 = tslib_1.__importDefault(require("../sass"));
(function () { return tslib_1.__awaiter(void 0, void 0, void 0, function () {
    var client, targets, task;
    return tslib_1.__generator(this, function (_a) {
        switch (_a.label) {
            case 0:
                client = new client_1.default("sass");
                return [4 /*yield*/, client.init(path_1.resolve(process.cwd() + "/" + process.env.npm_package_config_base))];
            case 1:
                _a.sent();
                if (!client.project) {
                    return [2 /*return*/];
                }
                targets = (process.env.npm_package_config_sass || "").split(",");
                if (!targets.length) {
                    return [2 /*return*/];
                }
                console.log(targets);
                task = new sass_1.default(client.rootDir);
                return [4 /*yield*/, Promise.all(targets.map(function (relative_root, index) { return tslib_1.__awaiter(void 0, void 0, void 0, function () {
                        var sub;
                        return tslib_1.__generator(this, function (_a) {
                            switch (_a.label) {
                                case 0:
                                    if (!client.project) {
                                        return [2 /*return*/];
                                    }
                                    if (!client.project.relative_path) {
                                        relative_root = relative_root.split(path_1.sep).slice(1).join(path_1.sep);
                                        targets[index] = relative_root;
                                    }
                                    console.log(relative_root);
                                    sub = {
                                        expression: ["allof", ["match", "*.scss"]],
                                        fields: ["name", "size", "mtime_ms", "exists", "type"],
                                        relative_root: relative_root,
                                    };
                                    return [4 /*yield*/, client.subscribe(client.getSubscribeKey(index), sub)];
                                case 1:
                                    _a.sent();
                                    return [2 /*return*/];
                            }
                        });
                    }); }))];
            case 2:
                _a.sent();
                client.subscription(function (resp) {
                    var index = client.getAnalyzeKey(resp.subscription);
                    if (index < 0) {
                        return;
                    }
                    if (!resp.files.length) {
                        return;
                    }
                    var file = resp.files[0];
                    var filePath = resp.root + "/" + targets[index] + "/" + file.name;
                    console.log("============================================================");
                    if (file.exists) {
                        if (!file.size) {
                            console.log("file added or empty: " + filePath);
                        }
                        else {
                            console.log("file changed: " + filePath);
                            task.buildOne(filePath);
                        }
                    }
                    else {
                        console.log("file deleted: " + filePath);
                    }
                });
                return [2 /*return*/];
        }
    });
}); })();
//# sourceMappingURL=sass.js.map