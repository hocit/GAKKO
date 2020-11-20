"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var stylelint_1 = require("stylelint");
var rules_1 = __importDefault(require("./rules"));
var namespace_1 = __importDefault(require("./util/namespace"));
var rulesPlugins = Object.keys(rules_1.default).map(function (ruleName) {
    return stylelint_1.createPlugin(namespace_1.default(ruleName), rules_1.default[ruleName]);
});
exports.default = rulesPlugins;
