"use strict";
// Support for-await-of syntax
if (!Symbol.asyncIterator) {
    Symbol.asyncIterator = Symbol.for('Symbol.asyncIterator');
}
