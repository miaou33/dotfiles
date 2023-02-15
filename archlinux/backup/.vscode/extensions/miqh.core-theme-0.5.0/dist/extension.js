"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __asyncValues = (this && this.__asyncValues) || function (o) {
    if (!Symbol.asyncIterator) throw new TypeError("Symbol.asyncIterator is not defined.");
    var m = o[Symbol.asyncIterator], i;
    return m ? m.call(o) : (o = typeof __values === "function" ? __values(o) : o[Symbol.iterator](), i = {}, verb("next"), verb("throw"), verb("return"), i[Symbol.asyncIterator] = function () { return this; }, i);
    function verb(n) { i[n] = o[n] && function (v) { return new Promise(function (resolve, reject) { v = o[n](v), settle(resolve, reject, v.done, v.value); }); }; }
    function settle(resolve, reject, d, v) { Promise.resolve(v).then(function(v) { resolve({ value: v, done: d }); }, reject); }
};
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (Object.hasOwnProperty.call(mod, k)) result[k] = mod[k];
    result["default"] = mod;
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
require("./polyfills");
const themeManager = __importStar(require("./themeManager"));
const constants_1 = require("./constants");
let extensionPath;
function activate(context) {
    return __awaiter(this, void 0, void 0, function* () {
        extensionPath = context.extensionPath;
        context.subscriptions.push(vscode_1.commands.registerCommand(`${constants_1.extensionName}.create`, create), vscode_1.commands.registerCommand(`${constants_1.extensionName}.edit`, edit), vscode_1.commands.registerCommand(`${constants_1.extensionName}.generate`, generate), vscode_1.commands.registerCommand(`${constants_1.extensionName}.remove`, remove), vscode_1.workspace.onDidSaveTextDocument(checkTemplates));
        yield checkThemes();
    });
}
exports.activate = activate;
function checkTemplates(savedFile) {
    return __awaiter(this, void 0, void 0, function* () {
        // Use case-insensitive comparison to account for discrepancies when
        // handling the dummy `TextDocument` generated from removing a template
        if (!savedFile.uri.fsPath.toLowerCase().startsWith(extensionPath.toLowerCase())) {
            return;
        }
        const selection = yield vscode_1.window.showInformationMessage('Core Theme template change detected.', { title: 'Update Generated Themes' }, { title: 'Dismiss' });
        if (selection == null || selection.title === 'Dismiss') {
            return;
        }
        yield generate();
    });
}
function checkThemes() {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            yield themeManager.checkThemes();
        }
        catch (e) {
            if (typeof e === 'string') {
                const selection = yield vscode_1.window.showWarningMessage(e, { title: 'Generate Themes' }, { title: 'Dismiss' });
                if (selection == null || selection.title === 'Dismiss') {
                    return;
                }
                yield generate();
            }
        }
    });
}
function create() {
    return __awaiter(this, void 0, void 0, function* () {
        let themeName = yield vscode_1.window.showInputBox({
            placeHolder: 'Custom theme name',
        });
        if (!themeName) {
            return;
        }
        let templateFilePath;
        try {
            templateFilePath = yield themeManager.createTemplate(themeName);
        }
        catch (e) {
            if (typeof e === 'string') {
                yield vscode_1.window.showErrorMessage(e);
                return;
            }
            throw e;
        }
        const document = yield vscode_1.workspace.openTextDocument(templateFilePath);
        yield vscode_1.window.showTextDocument(document);
    });
}
function edit() {
    return __awaiter(this, void 0, void 0, function* () {
        const template = yield getSelectedTemplate();
        if (template == null) {
            return;
        }
        const document = yield vscode_1.workspace.openTextDocument(template.data.metadata.filePath);
        yield vscode_1.window.showTextDocument(document);
    });
}
function generate() {
    return __awaiter(this, void 0, void 0, function* () {
        yield themeManager.generateFromTemplates();
        // Reload VS Code so that the newly generated themes are picked up
        yield vscode_1.commands.executeCommand('workbench.action.reloadWindow');
    });
}
function getSelectedTemplate() {
    return __awaiter(this, void 0, void 0, function* () {
        var e_1, _a;
        let templates = [];
        try {
            for (var _b = __asyncValues(themeManager.readTemplates()), _c; _c = yield _b.next(), !_c.done;) {
                const template = _c.value;
                // Theme management commands should only apply to custom templates
                if (template.default != null) {
                    continue;
                }
                templates.push({
                    label: template.name,
                    data: template,
                    description: '',
                });
            }
        }
        catch (e_1_1) { e_1 = { error: e_1_1 }; }
        finally {
            try {
                if (_c && !_c.done && (_a = _b.return)) yield _a.call(_b);
            }
            finally { if (e_1) throw e_1.error; }
        }
        if (templates.length === 0) {
            yield vscode_1.window.showInformationMessage('No custom theme templates exist.');
            return;
        }
        return yield vscode_1.window.showQuickPick(templates);
    });
}
function remove() {
    return __awaiter(this, void 0, void 0, function* () {
        const template = yield getSelectedTemplate();
        if (template == null) {
            return;
        }
        yield themeManager.removeTemplate(template.data);
        // Create dummy `TextDocument` to trigger the template check handler
        const doc = { uri: { fsPath: template.data.metadata.filePath } };
        yield checkTemplates(doc);
    });
}
