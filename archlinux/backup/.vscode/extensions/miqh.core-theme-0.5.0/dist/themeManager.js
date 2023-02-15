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
var __await = (this && this.__await) || function (v) { return this instanceof __await ? (this.v = v, this) : new __await(v); }
var __asyncGenerator = (this && this.__asyncGenerator) || function (thisArg, _arguments, generator) {
    if (!Symbol.asyncIterator) throw new TypeError("Symbol.asyncIterator is not defined.");
    var g = generator.apply(thisArg, _arguments || []), i, q = [];
    return i = {}, verb("next"), verb("throw"), verb("return"), i[Symbol.asyncIterator] = function () { return this; }, i;
    function verb(n) { if (g[n]) i[n] = function (v) { return new Promise(function (a, b) { q.push([n, v, a, b]) > 1 || resume(n, v); }); }; }
    function resume(n, v) { try { step(g[n](v)); } catch (e) { settle(q[0][3], e); } }
    function step(r) { r.value instanceof __await ? Promise.resolve(r.value.v).then(fulfill, reject) : settle(q[0][2], r); }
    function fulfill(value) { resume("next", value); }
    function reject(value) { resume("throw", value); }
    function settle(f, v) { if (f(v), q.shift(), q.length) resume(q[0][0], q[0][1]); }
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const fs_1 = __importDefault(require("fs"));
const path_1 = __importDefault(require("path"));
require("./polyfills");
const color_1 = require("./color");
// Obtain the extension path by relative resolution rather than accessing the
// VS Code API to avoid a dependency on the latter so that exposed functions
// can be invoked from other scripts
const extensionPath = path_1.default.resolve(__dirname, '..');
const packageJsonPath = path_1.default.resolve(extensionPath, 'package.json');
const templatesPath = path_1.default.resolve(extensionPath, 'templates');
const themesPath = path_1.default.resolve(extensionPath, 'themes');
const readDir = promisify(fs_1.default.readdir);
const readFile = (filePath) => promisify(fs_1.default.readFile)(filePath, 'utf8');
const removeFile = promisify(fs_1.default.unlink);
const writeDir = promisify(fs_1.default.mkdir);
const writeFile = promisify(fs_1.default.writeFile);
/**
 * Theme version tracks extension version.
 *
 * Version should not change while extension is activated.
 */
const getThemeVersion = Object.assign(() => __awaiter(this, void 0, void 0, function* () {
    const { cachedVersion } = getThemeVersion;
    if (cachedVersion) {
        return Promise.resolve(cachedVersion);
    }
    const packageJsonData = yield readFile(packageJsonPath);
    let { version } = JSON.parse(packageJsonData);
    getThemeVersion.cachedVersion = version;
    return getThemeVersion.cachedVersion;
}), { cachedVersion: undefined });
/**
 * Will not exist on generated themes prior to 0.4.0.
 */
exports.themeVersionKey = '__version';
/**
 * Creates a new theme template file with the given name.
 *
 * @param name Theme name.
 * @return Created template file path.
 */
function createTemplate(name) {
    return __awaiter(this, void 0, void 0, function* () {
        const fileName = name
            .toLowerCase()
            .replace(/\W+/g, '-')
            .replace(/-$/, '') + '.json';
        const filePath = path_1.default.resolve(templatesPath, fileName);
        const template = {
            name: name,
            backgroundColor: color_1.Rgba.parse('#000000'),
            foregroundColor: color_1.Rgba.parse('#ffffff'),
            metadata: { filePath },
        };
        try {
            yield writeJsonFile(filePath, template, { flag: 'wx' });
        }
        catch (e) {
            if (e.code === 'EEXIST') {
                throw 'Template with a similar name already exists.';
            }
            throw e;
        }
        return filePath;
    });
}
exports.createTemplate = createTemplate;
/**
 * Generates VS Code theme files based on the settings of templates.
 */
function generateFromTemplates() {
    return __awaiter(this, void 0, void 0, function* () {
        var e_1, _a;
        yield clearThemes();
        let themes = [];
        try {
            for (var _b = __asyncValues(readTemplates()), _c; _c = yield _b.next(), !_c.done;) {
                const theme = _c.value;
                const generatedTheme = yield generateTheme(theme);
                themes.push(generatedTheme);
            }
        }
        catch (e_1_1) { e_1 = { error: e_1_1 }; }
        finally {
            try {
                if (_c && !_c.done && (_a = _b.return)) yield _a.call(_b);
            }
            finally { if (e_1) throw e_1.error; }
        }
        yield updateManifest(themes);
    });
}
exports.generateFromTemplates = generateFromTemplates;
/**
 * Gets all available theme templates.
 *
 * @return Iterator across theme templates.
 */
function readTemplates() {
    return __asyncGenerator(this, arguments, function* readTemplates_1() {
        const files = yield __await(readDir(templatesPath));
        for (const file of files) {
            const filePath = path_1.default.resolve(templatesPath, file);
            const fileData = yield __await(readFile(filePath));
            let template = JSON.parse(fileData);
            yield yield __await({
                name: template.name,
                default: template.default,
                backgroundColor: color_1.Rgba.parse(template.backgroundColor),
                foregroundColor: color_1.Rgba.parse(template.foregroundColor),
                metadata: { filePath },
            });
        }
    });
}
exports.readTemplates = readTemplates;
/**
 * Removes the given theme template.
 *
 * @param template Theme template to remove.
 */
function removeTemplate(template) {
    return __awaiter(this, void 0, void 0, function* () {
        yield removeFile(template.metadata.filePath);
    });
}
exports.removeTemplate = removeTemplate;
/**
 * Checks whether themes require generation.
 */
function checkThemes() {
    return __awaiter(this, void 0, void 0, function* () {
        let files;
        try {
            files = yield readDir(themesPath);
        }
        catch (e) {
            if (e.code !== 'ENOENT') {
                throw e;
            }
            // Case of fresh install
            throw 'No themes detected.';
        }
        const themeVersion = yield getThemeVersion();
        for (const file of files) {
            const filePath = path_1.default.resolve(themesPath, file);
            const fileData = yield readFile(filePath);
            let theme = JSON.parse(fileData);
            if (theme[exports.themeVersionKey] !== themeVersion) {
                // Case of upgrade
                throw 'Detected an outdated theme version.';
            }
        }
    });
}
exports.checkThemes = checkThemes;
/**
 * Deletes all theme files (i.e. with `.json` extension).
 */
function clearThemes() {
    return __awaiter(this, void 0, void 0, function* () {
        let files;
        try {
            files = yield readDir(themesPath);
        }
        catch (e) {
            // Themes directory will not exist until themes have been generated before
            if (e.code !== 'ENOENT') {
                throw e;
            }
            return;
        }
        for (const file of files) {
            if (!file.endsWith('.json')) {
                continue;
            }
            const filepath = path_1.default.resolve(themesPath, file);
            yield removeFile(filepath);
        }
    });
}
/**
 * Generates a VS Code theme file from a given template.
 *
 * @param template Theme template.
 * @return Generated theme details.
 */
function generateTheme(template) {
    return __awaiter(this, void 0, void 0, function* () {
        const themeVersion = yield getThemeVersion();
        const bg = template.backgroundColor;
        const fg = template.foregroundColor;
        const b1 = bg.toHex();
        const b2 = color_1.mix(fg, bg, .07).toHex();
        const f1 = fg.toHex();
        const f2 = color_1.mix(fg, bg, .8).toHex();
        const f3 = color_1.mix(fg, bg, .6).toHex();
        const f4 = color_1.mix(fg, bg, .23).toHex();
        const s1 = color_1.fadeOut(fg, .18).toHex();
        const s2 = color_1.fadeOut(fg, .50).toHex();
        const s3 = color_1.fadeOut(fg, .75).toHex();
        const s4 = color_1.fadeOut(fg, .92).toHex();
        const s5 = color_1.fadeOut(fg, .96).toHex();
        const none = '#0000';
        const theme = {
            [exports.themeVersionKey]: themeVersion,
            'name': template.name,
            'type': (color_1.brightness(bg) > color_1.brightness(fg) ? 'light' : 'dark'),
            'colors': {
                'activityBar.activeBackground': none,
                'activityBar.activeBorder': none,
                'activityBar.background': b1,
                'activityBar.border': none,
                'activityBar.dropBackground': s4,
                'activityBar.foreground': f3,
                'activityBarBadge.background': f1,
                'activityBarBadge.foreground': b1,
                'badge.background': f1,
                'badge.foreground': b1,
                'button.background': f1,
                'button.foreground': b1,
                'button.hoverBackground': f1,
                'diffEditor.insertedTextBackground': none,
                'diffEditor.removedTextBackground': none,
                'dropdown.background': b2,
                'dropdown.foreground': f1,
                'dropdown.listBackground': b2,
                'editor.background': b1,
                'editor.findMatchBackground': s4,
                'editor.findMatchBorder': f1,
                'editor.findMatchHighlightBackground': s4,
                'editor.findMatchHighlightBorder': f1,
                'editor.findRangeHighlightBackground': s5,
                'editor.foreground': f1,
                'editor.hoverHighlightBackground': s5,
                'editor.inactiveSelectionBackground': s4,
                'editor.lineHighlightBackground': s5,
                'editor.lineHighlightBorder': none,
                'editor.rangeHighlightBackground': none,
                'editor.selectionBackground': s4,
                'editor.selectionHighlightBackground': s4,
                'editor.wordHighlightBackground': s3,
                'editor.wordHighlightStrongBackground': s3,
                'editorBracketMatch.background': s3,
                'editorBracketMatch.border': none,
                'editorCodeLens.foreground': f4,
                'editorCursor.background': b2,
                'editorCursor.foreground': f1,
                'editorError.foreground': f1,
                'editorGroup.background': b1,
                'editorGroup.border': none,
                'editorGroup.dropBackground': s4,
                'editorGroupHeader.noTabsBackground': b1,
                'editorGroupHeader.tabsBackground': b1,
                'editorGutter.addedBackground': f2,
                'editorGutter.deletedBackground': f2,
                'editorGutter.modifiedBackground': f4,
                'editorHint.foreground': f4,
                'editorHoverWidget.background': b2,
                'editorIndentGuide.background': b2,
                'editorInfo.foreground': f4,
                'editorLightBulb.foreground': f1,
                'editorLightBulbAutoFix.foreground': f1,
                'editorLineNumber.activeForeground': f3,
                'editorLineNumber.foreground': f4,
                'editorLink.activeForeground': f2,
                'editorOverviewRuler.addedForeground': s3,
                'editorOverviewRuler.border': none,
                'editorOverviewRuler.bracketMatchForeground': s1,
                'editorOverviewRuler.commonContentForeground': none,
                'editorOverviewRuler.currentContentForeground': s3,
                'editorOverviewRuler.deletedForeground': s3,
                'editorOverviewRuler.errorForeground': s2,
                'editorOverviewRuler.findMatchForeground': s1,
                'editorOverviewRuler.incomingContentForeground': s3,
                'editorOverviewRuler.infoForeground': s2,
                'editorOverviewRuler.modifiedForeground': s3,
                'editorOverviewRuler.rangeHighlightForeground': s1,
                'editorOverviewRuler.selectionHighlightForeground': s1,
                'editorOverviewRuler.warningForeground': s2,
                'editorOverviewRuler.wordHighlightForeground': s1,
                'editorOverviewRuler.wordHighlightStrongForeground': s1,
                'editorRuler.foreground': b2,
                'editorSuggestWidget.background': b2,
                'editorSuggestWidget.foreground': f1,
                'editorSuggestWidget.highlightForeground': f1,
                'editorSuggestWidget.selectedBackground': s4,
                'editorUnnecessary.foreground': f4,
                'editorWarning.foreground': f3,
                'editorWhitespace.foreground': b2,
                'editorWidget.background': b2,
                'editorWidget.resizeBorder': f3,
                'errorForeground': f3,
                'focusBorder': f1,
                'foreground': f1,
                'gitDecoration.addedResourceForeground': f1,
                'gitDecoration.conflictingResourceForeground': f1,
                'gitDecoration.deletedResourceForeground': f1,
                'gitDecoration.ignoredResourceForeground': f4,
                'gitDecoration.modifiedResourceForeground': f1,
                'gitDecoration.submoduleResourceForeground': f1,
                'gitDecoration.untrackedResourceForeground': f1,
                'input.background': b2,
                'input.foreground': f1,
                'input.placeholderForeground': f4,
                'inputOption.activeBorder': f2,
                'inputValidation.errorBackground': f4,
                'inputValidation.errorBorder': none,
                'inputValidation.infoBackground': f4,
                'inputValidation.infoBorder': none,
                'inputValidation.warningBackground': f4,
                'inputValidation.warningBorder': none,
                'list.activeSelectionBackground': s4,
                'list.activeSelectionForeground': f1,
                'list.dropBackground': s4,
                'list.errorForeground': f3,
                'list.focusBackground': s4,
                'list.hoverBackground': none,
                'list.inactiveSelectionBackground': s4,
                'list.invalidItemForeground': f3,
                'list.warningForeground': f3,
                'listFilterWidget.background': b2,
                'listFilterWidget.outline': none,
                'listFilterWidget.noMatchesOutline': f3,
                'merge.border': b2,
                'merge.commonContentBackground': none,
                'merge.commonHeaderBackground': none,
                'merge.currentContentBackground': none,
                'merge.currentHeaderBackground': none,
                'merge.incomingContentBackground': none,
                'merge.incomingHeaderBackground': none,
                'minimap.selectionHighlight': s1,
                'minimap.findMatchHighlight': s2,
                'notificationsErrorIcon.foreground': f1,
                'notificationsInfoIcon.foreground': f1,
                'notificationsWarningIcon.foreground': f1,
                'panel.border': none,
                'panel.dropBackground': s4,
                'panelTitle.activeBorder': none,
                'panelTitle.activeForeground': f1,
                'panelTitle.inactiveForeground': f4,
                'peekView.border': b2,
                'peekViewEditor.background': b2,
                'peekViewEditor.matchHighlightBackground': none,
                'peekViewEditor.matchHighlightBorder': f1,
                'peekViewEditorGutter.background': b2,
                'peekViewResult.background': b2,
                'peekViewResult.lineForeground': f2,
                'peekViewResult.matchHighlightBackground': none,
                'peekViewResult.selectionBackground': s4,
                'peekViewResult.selectionForeground': f2,
                'peekViewTitle.background': b2,
                'peekViewTitleDescription.foreground': f2,
                'peekViewTitleLabel.foreground': f1,
                'problemsErrorIcon.foreground': f1,
                'problemsInfoIcon.foreground': f1,
                'problemsWarningIcon.foreground': f1,
                'progressBar.background': f1,
                'scrollbar.shadow': none,
                'scrollbarSlider.activeBackground': s4,
                'scrollbarSlider.background': s4,
                'scrollbarSlider.hoverBackground': s4,
                'sideBar.background': b1,
                'sideBar.border': none,
                'sideBar.dropBackground': s4,
                'sideBar.foreground': f1,
                'sideBarSectionHeader.background': none,
                'sideBarSectionHeader.foreground': f1,
                'sideBarTitle.foreground': f3,
                'statusBar.background': b1,
                'statusBar.debuggingBackground': f4,
                'statusBar.debuggingForeground': f1,
                'statusBar.foreground': f2,
                'statusBar.noFolderBackground': b1,
                'statusBar.noFolderForeground': f2,
                'statusBarItem.activeBackground': b2,
                'statusBarItem.hoverBackground': b2,
                'statusBarItem.prominentBackground': b2,
                'statusBarItem.prominentHoverBackground': b2,
                'symbolIcon.arrayForeground': f3,
                'symbolIcon.booleanForeground': f3,
                'symbolIcon.classForeground': f3,
                'symbolIcon.colorForeground': f3,
                'symbolIcon.constructorForeground': f3,
                'symbolIcon.constantForeground': f3,
                'symbolIcon.enumeratorForeground': f3,
                'symbolIcon.enumeratorMemberForeground': f3,
                'symbolIcon.eventForeground': f3,
                'symbolIcon.fieldForeground': f3,
                'symbolIcon.fileForeground': f3,
                'symbolIcon.folderForeground': f3,
                'symbolIcon.functionForeground': f3,
                'symbolIcon.interfaceForeground': f3,
                'symbolIcon.keyForeground': f3,
                'symbolIcon.keywordForeground': f3,
                'symbolIcon.methodForeground': f3,
                'symbolIcon.moduleForeground': f3,
                'symbolIcon.namespaceForeground': f3,
                'symbolIcon.nullForeground': f3,
                'symbolIcon.numberForeground': f3,
                'symbolIcon.objectForeground': f3,
                'symbolIcon.operatorForeground': f3,
                'symbolIcon.packageForeground': f3,
                'symbolIcon.propertyForeground': f3,
                'symbolIcon.referenceForeground': f3,
                'symbolIcon.snippetForeground': f3,
                'symbolIcon.stringForeground': f3,
                'symbolIcon.structForeground': f3,
                'symbolIcon.textForeground': f3,
                'symbolIcon.typeParameterForeground': f3,
                'symbolIcon.unitForeground': f3,
                'symbolIcon.variableForeground': f3,
                'tab.activeBackground': none,
                'tab.activeForeground': f1,
                'tab.border': none,
                'tab.inactiveBackground': none,
                'tab.inactiveForeground': s3,
                'tab.unfocusedActiveForeground': f2,
                'tab.unfocusedInactiveForeground': s3,
                'terminal.background': b1,
                'terminal.border': b2,
                'terminal.foreground': f1,
                'titleBar.activeBackground': b1,
                'titleBar.activeForeground': f1,
                'titleBar.border': none,
                'titleBar.inactiveBackground': b1,
                'titleBar.inactiveForeground': f2,
                'welcomePage.buttonBackground': b2,
                'welcomePage.buttonHoverBackground': b2,
                'widget.shadow': none,
            },
            'tokenColors': [
                {
                    'name': 'lang-doc',
                    'scope': [
                        'comment',
                        'comment constant.numeric',
                        'comment keyword.operator.expression',
                        'comment keyword.other',
                        'comment storage.type',
                        'comment storage.type.function.arrow',
                        'comment string.quoted',
                        'comment support.constant',
                        'comment support.type.primitive',
                        'comment markup.heading',
                        'comment markup.inline.raw',
                        'comment markup.raw.block',
                    ],
                    'settings': {
                        'foreground': f4,
                    },
                },
                {
                    'name': 'lang-resets',
                    'scope': [
                        'entity.name.tag.yaml',
                        'keyword.control.ternary.java',
                        'source.java storage.type.generic',
                        'source.yaml keyword.control',
                        'storage.modifier.import.java',
                        'storage.modifier.lifetime.rust',
                        'storage.modifier.package.java',
                        'storage.type.cs',
                        'storage.type.function.arrow',
                        'storage.type.java',
                        'storage.type.object.array.java',
                        'storage.type.annotation.java',
                        'storage.type.variable.ruby',
                    ],
                    'settings': {
                        'foreground': f1,
                    },
                },
                {
                    'name': 'lang-core',
                    'scope': [
                        'keyword.control',
                        'keyword.operator.cast',
                        'keyword.operator.expression',
                        'keyword.operator.instanceof',
                        'keyword.operator.logical.python',
                        'keyword.operator.new',
                        'keyword.other',
                        'keyword.reserved.java',
                        'keyword.type',
                        'keyword.channel.go',
                        'keyword.const.go',
                        'keyword.function.go',
                        'keyword.import.go',
                        'keyword.interface.go',
                        'keyword.map.go',
                        'keyword.package.go',
                        'keyword.struct.go',
                        'keyword.type.go',
                        'keyword.var.go',
                        'storage.modifier',
                        'storage.type',
                        'support.type.primitive',
                        'variable.language',
                    ],
                    'settings': {
                        'foreground': f3,
                    },
                },
                {
                    'name': 'lang-literals',
                    'scope': [
                        'constant.language',
                        'constant.language.boolean',
                        'constant.numeric',
                        'constant.numeric keyword.other',
                        'constant.other.color',
                        'source.yaml string.unquoted',
                        'storage.type.tag-handle.yaml',
                        'string.quoted',
                        'support.constant',
                    ],
                    'settings': {
                        'foreground': f2,
                    },
                },
                {
                    'name': 'doc-source',
                    'scope': [
                        'markup.inline.raw',
                        'markup.raw.block',
                    ],
                    'settings': {
                        'foreground': f2,
                    },
                },
                {
                    'name': 'doc-sections',
                    'scope': [
                        'markup.heading',
                        'meta.separator.markdown',
                    ],
                    'settings': {
                        'foreground': f2,
                    },
                },
                {
                    'name': 'style-bold',
                    'scope': [
                        'markup.bold',
                        'markup.heading',
                        'meta.separator.markdown',
                    ],
                    'settings': {
                        'fontStyle': 'bold',
                    },
                },
                {
                    'name': 'style-italic',
                    'scope': [
                        'markup.italic',
                    ],
                    'settings': {
                        'fontStyle': 'italic',
                    },
                },
            ],
        };
        try {
            yield writeDir(themesPath);
        }
        catch (e) {
            if (e.code !== 'EEXIST') {
                throw e;
            }
        }
        const themeFilename = path_1.default.basename(template.metadata.filePath);
        const outPath = path_1.default.resolve(themesPath, themeFilename);
        yield writeJsonFile(outPath, theme);
        return {
            name: `Core (${theme.name})`,
            type: theme.type,
            metadata: { filePath: outPath },
        };
    });
}
/**
 * Rewrites the `package.json` file to include the specified themes.
 *
 * Necessary because VS Code does not pick up themes from theme file existence alone.
 *
 * @param themes Themes to be contributed.
 */
function updateManifest(themes) {
    return __awaiter(this, void 0, void 0, function* () {
        let themeContributions = themes.map(theme => ({
            label: theme.name,
            uiTheme: theme.type === 'dark' ? 'vs-dark' : 'vs',
            path: path_1.default.relative(extensionPath, theme.metadata.filePath),
        }));
        // Sort by theme name to assist visual grepping
        themeContributions.sort((a, b) => a.label.localeCompare(b));
        // Do not use the parsed copy of package.json from the extensions
        // namespace as it contains extra properties which should not be written
        const packageJsonData = yield readFile(packageJsonPath);
        let packageJson = JSON.parse(packageJsonData);
        packageJson.contributes.themes = themeContributions;
        yield writeJsonFile(packageJsonPath, packageJson);
    });
}
/**
 * Writes JSON-like data to a file.
 *
 * Ensures the output file ends with a newline and strips any metadata properties.
 *
 * @param filePath Target file.
 * @param data JSON-like data to write.
 * @param options Write options.
 */
function writeJsonFile(filePath, data, options = undefined) {
    return __awaiter(this, void 0, void 0, function* () {
        const filter = (key, value) => key !== 'metadata' ? value : undefined;
        const fileData = JSON.stringify(data, filter, 4) + '\n';
        yield writeFile(filePath, fileData, options);
    });
}
/**
 * Crudely wraps a function using a callback for results to produce a promise.
 *
 * @param fn Function with a callback as the last parameter.
 * @return Wrapped version of the input function.
 * @todo Should use `util.promisify()`, but VS Code does not come with Node v8
 *       at the time of writing this.
 */
function promisify(fn) {
    return function (...args) {
        return new Promise((resolve, reject) => {
            fn.apply(null, args.concat((err, res) => {
                if (err) {
                    reject(err);
                }
                else {
                    resolve(res);
                }
            }));
        });
    };
}
