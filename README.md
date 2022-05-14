# [<img align="left" height="80" src="asset_image_logo_512.svg"/>](https://github.com/jslint-org/jslint) JSLint, The JavaScript Code Quality and Coverage Tool
Douglas Crockford <douglas@crockford.com>


# Status
| Branch | [master<br>(v2022.3.30)](https://github.com/jslint-org/jslint/tree/master) | [beta<br>(Web Demo)](https://github.com/jslint-org/jslint/tree/beta) | [alpha<br>(Development)](https://github.com/jslint-org/jslint/tree/alpha) |
|--:|:--:|:--:|:--:|
| CI | [![ci](https://github.com/jslint-org/jslint/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/jslint-org/jslint/actions?query=branch%3Amaster) | [![ci](https://github.com/jslint-org/jslint/actions/workflows/ci.yml/badge.svg?branch=beta)](https://github.com/jslint-org/jslint/actions?query=branch%3Abeta) | [![ci](https://github.com/jslint-org/jslint/actions/workflows/ci.yml/badge.svg?branch=alpha)](https://github.com/jslint-org/jslint/actions?query=branch%3Aalpha) |
| Coverage | [![coverage](https://jslint-org.github.io/jslint/branch-master/.artifact/coverage/coverage_badge.svg)](https://jslint-org.github.io/jslint/branch-master/.artifact/coverage/index.html) | [![coverage](https://jslint-org.github.io/jslint/branch-beta/.artifact/coverage/coverage_badge.svg)](https://jslint-org.github.io/jslint/branch-beta/.artifact/coverage/index.html) | [![coverage](https://jslint-org.github.io/jslint/branch-alpha/.artifact/coverage/coverage_badge.svg)](https://jslint-org.github.io/jslint/branch-alpha/.artifact/coverage/index.html) |
| Demo | [<img src="asset_image_logo_512.svg" height="32">](https://jslint-org.github.io/jslint/branch-master/index.html) | [<img src="asset_image_logo_512.svg" height="32">](https://jslint-org.github.io/jslint/branch-beta/index.html) | [<img src="asset_image_logo_512.svg" height="32">](https://jslint-org.github.io/jslint/branch-alpha/index.html) |
| Artifacts | [<img src="asset_image_folder_open_solid.svg" height="30">](https://github.com/jslint-org/jslint/tree/gh-pages/branch-master/.artifact) | [<img src="asset_image_folder_open_solid.svg" height="30">](https://github.com/jslint-org/jslint/tree/gh-pages/branch-beta/.artifact) | [<img src="asset_image_folder_open_solid.svg" height="30">](https://github.com/jslint-org/jslint/tree/gh-pages/branch-alpha/.artifact) |


<br><br>
# Table of Contents

1. [Web Demo](#web-demo)

2. [Web Demo Archived](#web-demo-archived)

3. [API Doc](#api-doc)

4. [Quickstart Install](#quickstart-install)
    - [To install, just download and save https://www.jslint.com/jslint.mjs to file:](#to-install-just-download-and-save-httpswwwjslintcomjslintmjs-to-file)
    - [To run `jslint.mjs` in shell:](#to-run-jslintmjs-in-shell)
    - [To import `jslint.mjs` in ES Module environment:](#to-import-jslintmjs-in-es-module-environment)
    - [To import `jslint.mjs` in CommonJS environment:](#to-import-jslintmjs-in-commonjs-environment)
    - [To JSLint entire directory in shell:](#to-jslint-entire-directory-in-shell)

5. [Quickstart JSLint Report](#quickstart-jslint-report)
    - [To create a JSLint report in shell:](#to-create-a-jslint-report-in-shell)
    - [To create a JSLint report in javascript:](#to-create-a-jslint-report-in-javascript)

6. [Quickstart V8 Coverage Report](#quickstart-v8-coverage-report)
    - [To create V8 coverage report from Node.js / Npm program in shell:](#to-create-v8-coverage-report-from-nodejs--npm-program-in-shell)
    - [To create V8 coverage report from Node.js / Npm program in javascript:](#to-create-v8-coverage-report-from-nodejs--npm-program-in-javascript)

7. [Quickstart JSLint in CodeMirror](#quickstart-jslint-in-codemirror)

8. [Quickstart JSLint in Vim](#quickstart-jslint-in-vim)

9. [Quickstart JSLint in VSCode](#quickstart-jslint-in-vscode)

10. [Description](#description)

11. [Package Listing](#package-listing)

12. [Changelog](#changelog)

13. [License](#license)


<br><br>
# Web Demo
- https://www.jslint.com

[![screenshot](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_browser__2fjslint_2fbranch-beta_2findex.html.png)](https://jslint-org.github.io/jslint/index.html)


<br><br>
# Web Demo Archived
- [Web Demo 2020](https://www.jslint.com/branch-v2020.11.6/index.html)
- [Web Demo 2014 (ES5 only)](https://www.jslint.com/branch-v2014.7.8/jslint.html)
- [Web Demo 2013 (ES5, CSS, HTML)](https://www.jslint.com/branch-v2013.3.13/jslint.html)


<br><br>
# API Doc
- https://www.jslint.com/apidoc.html

[![screenshot](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_browser__2f.artifact_2fapidoc.html.png)](https://www.jslint.com/apidoc.html)


<br><br>
# Quickstart Install


<br><br>
### To install, just download and save https://www.jslint.com/jslint.mjs to file:
```shell <!-- shRunWithScreenshotTxt .artifact/screenshot_sh_install_download.svg -->
#!/bin/sh

curl -L https://www.jslint.com/jslint.mjs > jslint.mjs
```
- shell output

![screenshot](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_sh_install_download.svg)


<br><br>
### To run `jslint.mjs` in shell:
```shell <!-- shRunWithScreenshotTxt .artifact/screenshot_sh_jslint_file.svg -->
#!/bin/sh

printf "console.log('hello world');\n" > hello.js

node jslint.mjs hello.js
```
- shell output

![screenshot](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_sh_jslint_file.svg)


<br><br>
### To import `jslint.mjs` in ES Module environment:
```shell <!-- shRunWithScreenshotTxt .artifact/screenshot_js_import_esm.svg -->
#!/bin/sh

node --input-type=module --eval '

/*jslint devel*/

// Import JSLint in ES Module environment.

import jslint from "./jslint.mjs";

let globals = ["caches", "indexedDb"];
let options = {browser: true};
let result;
let source = "console.log(\u0027hello world\u0027);\n";

// JSLint <source> and print <formatted_message>.

result = jslint.jslint(source, options, globals);
result.warnings.forEach(function ({
    formatted_message
}) {
    console.error(formatted_message);
});

'
```
- shell output

![screenshot](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_js_import_esm.svg)


<br><br>
### To import `jslint.mjs` in CommonJS environment:
```shell <!-- shRunWithScreenshotTxt .artifact/screenshot_js_import_cjs.svg -->
#!/bin/sh

node --eval '

/*jslint devel*/
(async function () {
    let globals = ["caches", "indexedDb"];
    let jslint;
    let options = {browser: true};
    let result;
    let source = "console.log(\u0027hello world\u0027);\n";

// Import JSLint in CommonJS environment.

    jslint = await import("./jslint.mjs");
    jslint = jslint.default;

// JSLint <source> and print <formatted_message>.

    result = jslint.jslint(source, options, globals);
    result.warnings.forEach(function ({
        formatted_message
    }) {
        console.error(formatted_message);
    });
}());

'
```
- shell output

![screenshot](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_js_import_cjs.svg)


<br><br>
### To JSLint entire directory in shell:
```shell <!-- shRunWithScreenshotTxt .artifact/screenshot_sh_jslint_dir.svg -->
#!/bin/sh

# JSLint directory '.'

node jslint.mjs .
```
- shell output

![screenshot](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_sh_jslint_dir.svg)


<br><br>
# Quickstart JSLint Report


<br><br>
### To create a JSLint report in shell:
```shell <!-- shRunWithScreenshotTxt .artifact/screenshot_sh_jslint_report_file.svg -->
#!/bin/sh

printf "function foo() {console.log('hello world');}\n" > hello.js

# Create JSLint report from file 'hello.js' in shell.

node jslint.mjs \
    jslint_report=.artifact/jslint_report_hello.html \
    hello.js
```
- shell output

![screenshot](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_sh_jslint_report_file.svg)

- screenshot file [.artifact/jslint_report_hello.html](https://jslint-org.github.io/jslint/branch-beta/.artifact/jslint_report_hello.html)

[![screenshot](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_browser__2f.artifact_2fjslint_report_hello.html.png)](https://jslint-org.github.io/jslint/branch-beta/.artifact/jslint_report_hello.html)


<br><br>
### To create a JSLint report in javascript:
```shell <!-- shRunWithScreenshotTxt .artifact/screenshot_js_jslint_report_file.svg -->
#!/bin/sh

node --input-type=module --eval '

/*jslint devel*/
import jslint from "./jslint.mjs";
import fs from "fs";
(async function () {
    let result;
    let source = "function foo() {console.log(\u0027hello world\u0027);}\n";

// Create JSLint report from <source> in javascript.

    result = jslint.jslint(source);
    result = jslint.jslint_report(result);
    result = `<body class="JSLINT_ JSLINT_REPORT_">\n${result}</body>\n`;

    await fs.promises.mkdir(".artifact/", {recursive: true});
    await fs.promises.writeFile(".artifact/jslint_report_hello.html", result);
    console.error("wrote file .artifact/jslint_report_hello.html");
}());

'
```
- shell output

![screenshot](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_js_jslint_report_file.svg)

- screenshot file [.artifact/jslint_report_hello.html](https://jslint-org.github.io/jslint/branch-beta/.artifact/jslint_report_hello.html)

[![screenshot](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_browser__2f.artifact_2fjslint_report_hello.html.png)](https://jslint-org.github.io/jslint/branch-beta/.artifact/jslint_report_hello.html)


<br><br>
# Quickstart V8 Coverage Report


<br><br>
### To create V8 coverage report from Node.js / Npm program in shell:
```shell <!-- shRunWithScreenshotTxt .artifact/screenshot_sh_coverage_report_spawn.svg -->
#!/bin/sh

git clone https://github.com/mapbox/node-sqlite3 node-sqlite3-sh \
    --branch=v5.0.2 \
    --depth=1 \
    --single-branch

cd node-sqlite3-sh
npm install

# Create V8 coverage report from program `npm run test` in shell.

node ../jslint.mjs \
    v8_coverage_report=../.artifact/coverage_sqlite3_sh/ \
        --exclude=tes?/ \
        --exclude=tes[!0-9A-Z_a-z-]/ \
        --exclude=tes[0-9A-Z_a-z-]/ \
        --exclude=tes[^0-9A-Z_a-z-]/ \
        --exclude=test/**/*.js \
        --exclude=test/suppor*/*elper.js \
        --exclude=test/suppor?/?elper.js \
        --exclude=test/support/helper.js \
        --include=**/*.cjs \
        --include=**/*.js \
        --include=**/*.mjs \
        --include=li*/*.js \
        --include=li?/*.js \
        --include=lib/ \
        --include=lib/**/*.js \
        --include=lib/*.js \
        --include=lib/sqlite3.js \
    npm run test
```
- shell output

![screenshot](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_sh_coverage_report_spawn.svg)

- screenshot file [.artifact/coverage_sqlite3_sh/index.html](https://jslint-org.github.io/jslint/branch-beta/.artifact/coverage_sqlite3_sh/index.html)

[![screenshot](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_browser__2f.artifact_2fcoverage_sqlite3_sh_2findex.html.png)](https://jslint-org.github.io/jslint/branch-beta/.artifact/coverage_sqlite3_sh/index.html)

- screenshot file [.artifact/coverage_sqlite3_sh/lib/sqlite3.js.html](https://jslint-org.github.io/jslint/branch-beta/.artifact/coverage_sqlite3_sh/lib/sqlite3.js.html)

[![screenshot](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_browser__2f.artifact_2fcoverage_sqlite3_sh_2flib_2fsqlite3.js.html.png)](https://jslint-org.github.io/jslint/branch-beta/.artifact/coverage_sqlite3_sh/lib/sqlite3.js.html)


<br><br>
### To create V8 coverage report from Node.js / Npm program in javascript:
```shell <!-- shRunWithScreenshotTxt .artifact/screenshot_js_coverage_report_spawn.svg -->
#!/bin/sh

git clone https://github.com/mapbox/node-sqlite3 node-sqlite3-js \
    --branch=v5.0.2 \
    --depth=1 \
    --single-branch

cd node-sqlite3-js
npm install

node --input-type=module --eval '

/*jslint node*/
import jslint from "../jslint.mjs";
(async function () {

// Create V8 coverage report from program `npm run test` in javascript.

    await jslint.v8CoverageReportCreate({
        coverageDir: "../.artifact/coverage_sqlite3_js/",
        processArgv: [
            "--exclude=tes?/",
            "--exclude=tes[!0-9A-Z_a-z-]/",
            "--exclude=tes[0-9A-Z_a-z-]/",
            "--exclude=tes[^0-9A-Z_a-z-]/",
            "--exclude=test/**/*.js",
            "--exclude=test/suppor*/*elper.js",
            "--exclude=test/suppor?/?elper.js",
            "--exclude=test/support/helper.js",
            "--include=**/*.cjs",
            "--include=**/*.js",
            "--include=**/*.mjs",
            "--include=li*/*.js",
            "--include=li?/*.js",
            "--include=lib/",
            "--include=lib/**/*.js",
            "--include=lib/*.js",
            "--include=lib/sqlite3.js",
            "npm", "run", "test"
        ]
    });
}());

'
```
- shell output

![screenshot](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_js_coverage_report_spawn.svg)

- screenshot file [.artifact/coverage_sqlite3_js/index.html](https://jslint-org.github.io/jslint/branch-beta/.artifact/coverage_sqlite3_js/index.html)

[![screenshot](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_browser__2f.artifact_2fcoverage_sqlite3_js_2findex.html.png)](https://jslint-org.github.io/jslint/branch-beta/.artifact/coverage_sqlite3_js/index.html)

- screenshot file [.artifact/coverage_sqlite3_js/lib/sqlite3.js.html](https://jslint-org.github.io/jslint/branch-beta/.artifact/coverage_sqlite3_js/lib/sqlite3.js.html)

[![screenshot](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_browser__2f.artifact_2fcoverage_sqlite3_js_2flib_2fsqlite3.js.html.png)](https://jslint-org.github.io/jslint/branch-beta/.artifact/coverage_sqlite3_js/lib/sqlite3.js.html)


<br><br>
# Quickstart JSLint in CodeMirror
1. Download and save [`jslint.mjs`](https://www.jslint.com/jslint.mjs), [`jslint_wrapper_codemirror.js`](https://www.jslint.com/jslint_wrapper_codemirror.js) to file.

2. Edit, save, and serve example html-file below:
```html <!-- jslint_wrapper_codemirror.html -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>CodeMirror: JSLint Demo</title>

<!-- Assets from codemirror. -->

    <link rel="stylesheet" href="https://codemirror.net/lib/codemirror.css">
    <link rel="stylesheet" href="https://codemirror.net/addon/lint/lint.css">
    <script defer src="https://codemirror.net/lib/codemirror.js"></script>
    <script defer
        src="https://codemirror.net/mode/javascript/javascript.js"></script>
    <script defer src="https://codemirror.net/addon/lint/lint.js"></script>

<!-- Assets from jslint. -->

    <script type="module" src="./jslint.mjs?window_jslint=1"></script>
    <script defer src="./jslint_wrapper_codemirror.js"></script>
<style>
body {
    background: #bbb;
    color: #333;
    font-family: sans-serif;
    margin: 20px;
}
.JSLINT_.JSLINT_REPORT_ {
    margin-top: 20px;
}
</style>
</head>


<body>
    <h1>CodeMirror: JSLint Demo</h1>
    <h3>
This demo will auto-lint the code below, and auto-generate a report as you type.
    </h3>

<!-- Container for codemirror-editor. -->

    <textarea id="editor1">console.log('hello world');</textarea>

<!-- Container for jslint-report. -->

    <div class="JSLINT_ JSLINT_REPORT_"></div>


<script type=module>
window.addEventListener("load", function () {
    let editor = window.CodeMirror.fromTextArea(document.getElementById(
        "editor1"
    ), {
        gutters: [
            "CodeMirror-lint-markers"
        ],
        indentUnit: 4,
        lineNumbers: true,
        lint: {
            lintOnChange: true, // Enable auto-lint.
            options: {
                // browser: true,
                // node: true
                globals: [
                    // "caches",
                    // "indexedDb"
                ]
            }
        },
        mode: "javascript"
    });

// Initialize event-handling before linter is run.

    editor.on("lintJslintBefore", function (/* options */) {
        // options.browser = true;
        // options.node = true;
        // options.globals = [
        //     "caches",
        //     "indexedDb"
        // ];
        return;
    });

// Initialize event-handling after linter is run.

    editor.on("lintJslintAfter", function (options) {

// Generate jslint-report from options.result.

        document.querySelector(
            ".JSLINT_REPORT_"
        ).innerHTML = window.jslint.jslint_report(options.result);
    });

// Manually trigger linter.

    editor.performLint();
});
</script>
</body>
</html>
```
3. Live example at https://www.jslint.com/jslint_wrapper_codemirror.html

[![screenshot](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_browser__2fjslint_2fbranch-beta_2fjslint_wrapper_codemirror.html.png)](https://jslint-org.github.io/jslint/jslint_wrapper_codemirror.html)


<br><br>
# Quickstart JSLint in Vim
1. Download and save [`jslint.mjs`](https://www.jslint.com/jslint.mjs), [`jslint_wrapper_vim.vim`](https://www.jslint.com/jslint_wrapper_vim.vim) to directory `~/.vim/`
2. Add vim-command `:source ~/.vim/jslint_wrapper_vim.vim` to file `~/.vimrc`
3. Vim can now jslint files (via nodejs):
    - with vim-command `:SaveAndJslint`
    - with vim-key-combo `<Ctrl-S> <Ctrl-J>`
- screenshot

[![screenshot](asset_image_jslint_wrapper_vim.png)](https://www.jslint.com/jslint_wrapper_vim.vim)


<br><br>
# Quickstart JSLint in VSCode
1. In VSCode, search and install extension [`vscode-jslint`](https://marketplace.visualstudio.com/items?itemName=jslint.vscode-jslint)
2. In VSCode, while editing a javascript file:
    - right-click context-menu and select `[JSLint - Lint File]`
    - or use key-binding `[Ctrl + Shift + J], [L]`
    - or use key-binding `[ Cmd + Shift + J], [L]` for Mac
- screenshot

[![screenshot](https://jslint-org.github.io/jslint/asset_image_jslint_wrapper_vscode.png)](https://marketplace.visualstudio.com/items?itemName=jslint.vscode-jslint)


<br><br>
# Description
- [jslint.mjs](jslint.mjs) contains the jslint function. It parses and analyzes a source file, returning an object with information about the file. It can also take an object that sets options.

- [index.html](index.html) runs the jslint.mjs function in a web page.

- [help.html](help.html) describes JSLint's usage. Please [read it](https://jslint-org.github.io/jslint/help.html).

JSLint can be run anywhere that JavaScript (or Java) can run.

The place to express yourself in programming is in the quality of your ideas and
the efficiency of their execution. The role of style in programming is the same
as in literature: It makes for better reading. A great writer doesn't express
herself by putting the spaces before her commas instead of after, or by putting
extra spaces inside her parentheses. A great writer will slavishly conform to
some rules of style, and that in no way constrains her power to express herself
creatively. See for example William Strunk's The Elements of Style
[https://www.crockford.com/style.html].

This applies to programming as well. Conforming to a consistent style improves
readability, and frees you to express yourself in ways that matter. JSLint here
plays the part of a stern but benevolent editor, helping you to get the style
right so that you can focus your creative energy where it is most needed.


<br><br>
# Package Listing
![screenshot_package_listing.svg](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_package_listing.svg)


<br><br>
# Changelog
- [Full CHANGELOG.md](CHANGELOG.md)

![screenshot_changelog.svg](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_changelog.svg)


<br><br>
# License
- JSLint is under [Unlicense License](LICENSE).
- CodeMirror editor is under [MIT License](https://github.com/codemirror/CodeMirror/blob/master/LICENSE).
- Function `v8CoverageListMerge` is derived from [MIT Licensed v8-coverage](https://github.com/demurgos/v8-coverage/blob/73446087dc38f61b09832c9867122a23f8577099/ts/LICENSE.md).

<!--
Coverage-hack
node --eval '
0
'
-->
