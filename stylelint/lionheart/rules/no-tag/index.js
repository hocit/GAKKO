"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var stylelint_1 = require("stylelint");
var namespace_1 = __importDefault(require("../../util/namespace"));
var isTag_1 = __importDefault(require("../../util/isTag"));
exports.ruleName = namespace_1.default('no-tag');
exports.messages = stylelint_1.utils.ruleMessages(exports.ruleName, {
    rejected: 'Must not use tag selector (%s)'
});
var plugin = function (primaryOption, _) {
    return function (root, result) {
        var validaOptions = stylelint_1.utils.validateOptions(result, exports.ruleName, {
            actual: primaryOption,
            possible: ['never']
        });
        if (!validaOptions) {
            return;
        }
        root.walkRules(function (rule) {
            if (rule.selectors) {
                var hasError_1 = false;
                rule.selectors.forEach(function (selector) {
                    if (isTag_1.default(selector)) {
                        hasError_1 = true;
                    }
                });
                if (hasError_1) {
                    stylelint_1.utils.report({
                        message: exports.messages.rejected.replace('%s', rule.selectors.join(',')),
                        node: rule,
                        result: result,
                        ruleName: exports.ruleName
                    });
                }
            }
            else {
                if (isTag_1.default(rule.selector)) {
                    stylelint_1.utils.report({
                        message: exports.messages.rejected.replace('%s', rule.selector),
                        node: rule,
                        result: result,
                        ruleName: exports.ruleName
                    });
                }
            }
        });
        return;
    };
};
exports.default = plugin;
