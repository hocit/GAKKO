"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var stylelint_1 = require("stylelint");
var namespace_1 = __importDefault(require("../../util/namespace"));
var ruleName = namespace_1.default('no-root-tag');
var plugin = function (primaryOption, _) {
    return function (root, result) {
        var validaOptions = stylelint_1.utils.validateOptions(result, ruleName, {
            actual: primaryOption,
            possible: ['never']
        });
        if (!validaOptions) {
            return;
        }
        root.walkRules(function (selector) {
            if (selector.parent.type === 'rule') {
                return;
            }
            if (selector.parent.type === 'atrule') {
                console.log(selector.parent.name);
            }
        });
        return;
    };
};
exports.default = plugin;
