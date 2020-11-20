"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var tslib_1 = require("tslib");
var fb_watchman_1 = tslib_1.__importDefault(require("fb-watchman"));
var ClientDetail = /** @class */ (function () {
    function ClientDetail(key) {
        this._rootDir = "";
        this._project = null;
        this._index = 0;
        this._key = key;
        this._client = new fb_watchman_1.default.Client();
    }
    Object.defineProperty(ClientDetail.prototype, "key", {
        get: function () {
            return this._key;
        },
        enumerable: false,
        configurable: true
    });
    Object.defineProperty(ClientDetail.prototype, "client", {
        get: function () {
            return this._client;
        },
        enumerable: false,
        configurable: true
    });
    Object.defineProperty(ClientDetail.prototype, "rootDir", {
        get: function () {
            return this._rootDir;
        },
        enumerable: false,
        configurable: true
    });
    Object.defineProperty(ClientDetail.prototype, "project", {
        get: function () {
            return this._project;
        },
        enumerable: false,
        configurable: true
    });
    ClientDetail.prototype.init = function (dirname) {
        return tslib_1.__awaiter(this, void 0, void 0, function () {
            var resp_1, error_1, resp;
            var _this = this;
            return tslib_1.__generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        this._rootDir = dirname;
                        _a.label = 1;
                    case 1:
                        _a.trys.push([1, 3, , 4]);
                        return [4 /*yield*/, new Promise(function (resolve, reject) {
                                _this.client.capabilityCheck({ optional: [], required: ["relative_root"] }, function (error, resp) {
                                    if (error) {
                                        return reject(error);
                                    }
                                    resolve(resp);
                                });
                            })];
                    case 2:
                        resp_1 = _a.sent();
                        console.log(resp_1);
                        return [3 /*break*/, 4];
                    case 3:
                        error_1 = _a.sent();
                        console.error(error_1);
                        this.client.end();
                        return [2 /*return*/];
                    case 4:
                        console.log(dirname);
                        return [4 /*yield*/, new Promise(function (resolve, reject) {
                                _this.client.command(["watch-project", dirname], function (error, resp) {
                                    if (error) {
                                        return reject(error);
                                    }
                                    if ("warning" in resp) {
                                        console.log("warning:", resp.warning);
                                    }
                                    console.log(resp);
                                    console.log("watch established on", resp.watch, "relative_path", resp.relative_path);
                                    resolve(resp);
                                });
                            }).catch(function (error) {
                                console.error("Error initiating watch:", error);
                            })];
                    case 5:
                        resp = _a.sent();
                        if (!resp) {
                            return [2 /*return*/];
                        }
                        this._project = resp;
                        return [2 /*return*/];
                }
            });
        });
    };
    ClientDetail.prototype.getSubscribeKey = function (index) {
        if (index === void 0) { index = null; }
        if (index === null) {
            index = this._index;
            this._index += 1;
        }
        return this._key + "_" + index;
    };
    ClientDetail.prototype.getAnalyzeKey = function (key) {
        var match;
        var exp = new RegExp("^" + this._key + "_([0-9]+?)$");
        if ((match = key.match(exp))) {
            return parseInt(match[1]);
        }
        return -1;
    };
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    ClientDetail.prototype.subscribe = function (key, sub) {
        return tslib_1.__awaiter(this, void 0, void 0, function () {
            var _this = this;
            return tslib_1.__generator(this, function (_a) {
                return [2 /*return*/, new Promise(function (resolve, reject) {
                        if (!_this.project) {
                            return reject("Not inited");
                        }
                        _this.client.command(["subscribe", _this.project.watch, key, sub], function (error, resp) {
                            if (error) {
                                return reject("Failed to subscribe: " + error);
                            }
                            console.log("subscription " + resp.subscribe + " established");
                            resolve(resp);
                        });
                    })];
            });
        });
    };
    ClientDetail.prototype.subscription = function (callback) {
        this.client.on("subscription", callback);
    };
    return ClientDetail;
}());
exports.default = ClientDetail;
//# sourceMappingURL=client.js.map