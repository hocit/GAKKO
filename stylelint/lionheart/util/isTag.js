"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.default = (function (selectorname) {
    // eslint-disable-next-line no-useless-escape
    return selectorname.match(/^[a-zA-z\*]/) !== null;
});
