"use strict";
const vscode = require('vscode');
var WhitespaceHighlighter;
(function (WhitespaceHighlighter) {
    class Extension {
        constructor(activeEditor, context) {
            this.activeEditor = activeEditor;
            this.context = context;
            this.subscribe();
            if (this.activeEditor) {
                this.triggerUpdateDecorations();
            }
        }
        updateDecorations() {
            if (!this.activeEditor) {
                return;
            }
            let text = this.activeEditor.document.getText();
            let whiteSpaceDecoration = [];
            let match;
            while (match = Extension.trailingWhitespaceRegex.exec(text)) {
                let startPos = this.activeEditor.document.positionAt(match.index);
                let endPos = this.activeEditor.document.positionAt(match.index + match[0].length);
                let decoration = { range: new vscode.Range(startPos, endPos), hoverMessage: "Trailing whitespace" };
                whiteSpaceDecoration.push(decoration);
            }
            this.activeEditor.setDecorations(Extension.decorationType, whiteSpaceDecoration);
        }
        subscribe() {
            vscode.window.onDidChangeActiveTextEditor(editor => {
                this.activeEditor = editor;
                if (editor) {
                    this.triggerUpdateDecorations();
                }
            }, null, this.context.subscriptions);
            vscode.workspace.onDidChangeTextDocument(event => {
                if (this.activeEditor && event.document === this.activeEditor.document) {
                    this.triggerUpdateDecorations();
                }
            }, null, this.context.subscriptions);
        }
        triggerUpdateDecorations() {
            if (this.timeout) {
                clearTimeout(this.timeout);
            }
            this.timeout = setTimeout(() => this.updateDecorations(), 500);
        }
    }
    Extension.extensionName = "Trailing Whitespace Highlighter";
    Extension.trailingWhitespaceRegex = /\s+(\n|$)/g; ///\s+[\r\n]/g;
    Extension.decorationType = vscode.window.createTextEditorDecorationType({
        backgroundColor: 'rgba(255, 66, 178, 0.3)'
    });
    WhitespaceHighlighter.Extension = Extension;
})(WhitespaceHighlighter = exports.WhitespaceHighlighter || (exports.WhitespaceHighlighter = {}));
//# sourceMappingURL=extension.js.map