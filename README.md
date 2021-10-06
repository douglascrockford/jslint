[<img align="left" height="100" src="asset_image_logo_512.svg"/>](https://github.com/jslint-org/jslint)


# JSLint, The JavaScript Code Quality Tool

&nbsp;

Douglas Crockford <douglas@crockford.com>


# Status
| Branch | [master<br>(v2021.9.20)](https://github.com/jslint-org/jslint/tree/master) | [beta<br>(Web Demo)](https://github.com/jslint-org/jslint/tree/beta) | [alpha<br>(Development)](https://github.com/jslint-org/jslint/tree/alpha) |
|--:|:--:|:--:|:--:|
| CI | [![ci](https://github.com/jslint-org/jslint/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/jslint-org/jslint/actions?query=branch%3Amaster) | [![ci](https://github.com/jslint-org/jslint/actions/workflows/ci.yml/badge.svg?branch=beta)](https://github.com/jslint-org/jslint/actions?query=branch%3Abeta) | [![ci](https://github.com/jslint-org/jslint/actions/workflows/ci.yml/badge.svg?branch=alpha)](https://github.com/jslint-org/jslint/actions?query=branch%3Aalpha) |
| Coverage | [![coverage](https://jslint-org.github.io/jslint/branch-master/.artifact/coverage/coverage_badge.svg)](https://jslint-org.github.io/jslint/branch-master/.artifact/coverage/index.html) | [![coverage](https://jslint-org.github.io/jslint/branch-beta/.artifact/coverage/coverage_badge.svg)](https://jslint-org.github.io/jslint/branch-beta/.artifact/coverage/index.html) | [![coverage](https://jslint-org.github.io/jslint/branch-alpha/.artifact/coverage/coverage_badge.svg)](https://jslint-org.github.io/jslint/branch-alpha/.artifact/coverage/index.html) |
| Demo | [<img src="asset_image_logo_512.svg" height="32">](https://jslint-org.github.io/jslint/branch-master/index.html) | [<img src="asset_image_logo_512.svg" height="32">](https://jslint-org.github.io/jslint/branch-beta/index.html) | [<img src="asset_image_logo_512.svg" height="32">](https://jslint-org.github.io/jslint/branch-alpha/index.html) |
| Artifacts | [<img src="asset_image_folder_open_solid.svg" height="30">](https://github.com/jslint-org/jslint/tree/gh-pages/branch-master/.artifact) | [<img src="asset_image_folder_open_solid.svg" height="30">](https://github.com/jslint-org/jslint/tree/gh-pages/branch-beta/.artifact) | [<img src="asset_image_folder_open_solid.svg" height="30">](https://github.com/jslint-org/jslint/tree/gh-pages/branch-alpha/.artifact) |


# Table of Contents
1. [Web Demo](#web-demo)
2. [Web Demo Archived](#web-demo-archived)
3. [API Doc](#api-doc)
4. [Quickstart Install](#quickstart-install)
5. [Quickstart JSLint Report](#quickstart-jslint-report)
6. [Plugin Vim](#plugin-vim)
7. [Description](#description)
8. [Package Listing](#package-listing)
9. [Changelog](#changelog)
10. [License](#license)


# Web Demo
- https://www.jslint.com

[![screenshot](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_browser__2fjslint_2fbranch-beta_2findex.html.png)](https://jslint-org.github.io/jslint/index.html)


# Web Demo Archived
- [Web Demo 2020](https://www.jslint.com/branch-v2020.11.6/index.html)
- [Web Demo 2014 (ES5 only)](https://www.jslint.com/branch-v2014.7.8/jslint.html)
- [Web Demo 2013 (ES5, CSS, HTML)](https://www.jslint.com/branch-v2013.3.13/jslint.html)


# API Doc
- https://www.jslint.com/apidoc.html

[![screenshot](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_browser__2f.artifact_2fapidoc.html.png)](https://www.jslint.com/apidoc.html)


# Quickstart Install
### To install, just download https://www.jslint.com/jslint.mjs and save to file:
```shell <!-- shRunWithScreenshotTxt .artifact/screenshot_install_download.svg -->
#!/bin/sh

curl -L https://www.jslint.com/jslint.mjs > jslint.mjs
```
- shell output

![screenshot.svg](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_install_download.svg)

### To run `jslint.mjs` from command-line:
```shell <!-- shRunWithScreenshotTxt .artifact/screenshot_install_cli_file.svg -->
#!/bin/sh

printf "console.log('hello world');\n" > hello.js

node jslint.mjs hello.js
```
- shell output

![screenshot.svg](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_install_cli_file.svg)

### To import `jslint.mjs` as es-module:
```shell <!-- shRunWithScreenshotTxt .artifact/screenshot_install_import.svg -->
#!/bin/sh

node --input-type=module -e '

/*jslint devel*/
import jslint from "./jslint.mjs";
let globals = ["caches", "indexedDb"];
let options = {browser: true};
let result;
let source = "console.log(\u0027hello world\u0027);\n";
result = jslint.jslint(source, options, globals);
result.warnings.forEach(function ({
    formatted_message
}) {
    console.error(formatted_message);
});

'
```
- shell output

![screenshot.svg](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_install_import.svg)

### To jslint entire directory from command-line:
```shell <!-- shRunWithScreenshotTxt .artifact/screenshot_install_cli_dir.svg -->
#!/bin/sh

node jslint.mjs .
```
- shell output

![screenshot.svg](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_install_cli_dir.svg)


# Quickstart JSLint Report
### To create a jslint-report from command-line:
```shell <!-- shRunWithScreenshotTxt .artifact/screenshot_install_cli_report.svg -->
#!/bin/sh

printf "function foo() {console.log('hello world');}\n" > hello.js

node jslint.mjs \
    jslint_report=.artifact/jslint_report.html \
    hello.js
```
- shell output

![screenshot.svg](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_install_cli_report.svg)

- screenshot file `.artifact/jslint_report.html`

![screenshot.png](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_browser__2f.artifact_2fjslint_report.html.png)


### To create a jslint-report programmatically:
```shell <!-- shRunWithScreenshotTxt .artifact/screenshot_install_import_report.svg -->
#!/bin/sh

node --input-type=module -e '

/*jslint devel*/
import jslint from "./jslint.mjs";
import fs from "fs";
(async function () {
    let report;
    let result;
    let source = "function foo() {console.log(\u0027hello world\u0027);}\n";
    result = jslint.jslint(source);
    report = jslint.jslint_report(result);
    await fs.promises.writeFile(".artifact/jslint_report.html", report);
    console.error("wrote file .artifact/jslint_report.html");
}());

'
```
- shell output

![screenshot.svg](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_install_import_report.svg)


# Plugin Vim
### To run jslint inside vim:
1. Download and save [`jslint.mjs`](https://www.jslint.com/jslint.mjs), [`jslint.vim`](https://www.jslint.com/jslint.vim) to directory `~/.vim/`
2. Add vim-command `:source ~/.vim/jslint.vim` to file `~/.vimrc`
3. Vim can now jslint files (via nodejs):
    - with vim-command `:SaveAndJslint`
    - with vim-key-combo `<Ctrl-S> <Ctrl-J>`
- screenshot

![screenshot.png](asset_image_jslint_vim_plugin.png)


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


# Package Listing
![screenshot_files.svg](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_files.svg)


# Changelog
- [Full CHANGELOG.md](CHANGELOG.md)

![screenshot_changelog.svg](https://jslint-org.github.io/jslint/branch-beta/.artifact/screenshot_changelog.svg)


# License
- JSLint is under [Unlicense License](LICENSE).
- CodeMirror code-editor is under [MIT License](https://github.com/codemirror/CodeMirror/blob/master/LICENSE).
