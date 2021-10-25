shCiArtifactUploadCustom() {(set -e
# this function will custom-upload build-artifacts to branch-gh-pages
    # .cache - restore
    if [ -d .cache ]
    then
        cp -a .cache/* .
        # js-hack - */
    fi
    # add jslint.js
    cp jslint.mjs jslint.js
    git add -f jslint.js
    # seo - inline css-assets and invalidate cached-assets
    node --input-type=module -e '
import moduleFs from "fs";
(async function () {
    let cacheKey = Math.random().toString(36).slice(-4);
    let fileDict = {};
    await Promise.all([
        "index.html"
    ].map(async function (file) {
        try {
            fileDict[file] = await moduleFs.promises.readFile(file, "utf8");
        } catch (ignore) {
            process.exit();
        }
    }));
    // invalidate cached-assets
    fileDict["index.html"] = fileDict["index.html"].replace((
        /\b(?:href|src)=".+?\.(?:css|js|mjs)\b/g
    ), function (match0) {
        return `${match0}?cc=${cacheKey}`;
    });
    // write file
    Object.entries(fileDict).map(function ([
        file, data
    ]) {
        moduleFs.promises.writeFile(file, data);
    });
}());
' "$@" # '
    # screenshot quickstart
    node --input-type=module -e '
import moduleFs from "fs";
import moduleChildProcess from "child_process";
(async function () {
    let screenshotCurl;
    screenshotCurl = await moduleFs.promises.stat("jslint.mjs");
    screenshotCurl = String(`
echo "\
% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                     Dload  Upload   Total   Spent    Left  Speed
100  250k  100  250k    0     0   250k      0  0:00:01 --:--:--  0:00:01  250k\
"
    `).trim().replace((
        /250/g
    ), Math.floor(screenshotCurl.size / 1024));
    // parallel-task - run-and-screenshot example-shell-commands in README.md
    await Promise.all(Array.from(String(
        await moduleFs.promises.readFile("README.md", "utf8")
    ).matchAll(
        /\n```shell <!-- shRunWithScreenshotTxt (.*?) -->\n([\S\s]*?\n)```\n/g
    )).map(async function ([
        ignore, file, script0
    ]) {
        let script = script0;
        // modify script - jslint install
        script = script.replace(
            "curl -L https://www.jslint.com/jslint.mjs > jslint.mjs",
            screenshotCurl
        );
        // modify script - cd node-sqlite3
        script = script.replace((
            /\n\ncd node-sqlite3-\w*?\n/g
        ), (
            " 2>/dev/null || true\n"
            + "$&\n"
            + "git checkout 60a022c511a37788e652c271af23174566a80c30\n"
        ));
        // limit stdout to 100 lines
        script = script.trimRight() + " 2>&1 | head -n 100\n";
        // printf script
        script = (
            "(set -e\n"
            + "printf \u0027"
            + script0.trim().replace((
                /[%\\]/gm
            ), "$&$&").replace((
                /\u0027/g
            ), "\u0027\"\u0027\"\u0027").replace((
                /^/gm
            ), "> ")
            + "\n\n\n\u0027\n"
            + script
            + ")\n"
        );
        await moduleFs.promises.writeFile(file + ".sh", script);
        await new Promise(function (resolve) {
            moduleChildProcess.spawn(
                "sh",
                [
                    "jslint_ci.sh", "shRunWithScreenshotTxt", file,
                    "sh", file + ".sh"
                ],
                {
                    stdio: [
                        "ignore", 1, 2
                    ]
                }
            ).on("exit", resolve);
        });
    }));
}());
' "$@" # '
    # screenshot asset_image_logo
    shImageLogoCreate &
    # screenshot html
    node --input-type=module -e '
import moduleChildProcess from "child_process";
(async function () {
    await Promise.all([
        (
            "https://"
            + process.env.UPSTREAM_OWNER
            + ".github.io/"
            + process.env.UPSTREAM_REPO
            + "/branch-beta/index.html"
        ),
        ".artifact/apidoc.html",
        ".artifact/coverage_sqlite3_js/index.html",
        ".artifact/coverage_sqlite3_js/lib/sqlite3.js.html",
        ".artifact/coverage_sqlite3_sh/index.html",
        ".artifact/coverage_sqlite3_sh/lib/sqlite3.js.html",
        ".artifact/jslint_report_hello.html"
    ].map(async function (url) {
        await new Promise(function (resolve) {
            moduleChildProcess.spawn(
                "sh",
                [
                    "jslint_ci.sh", "shBrowserScreenshot", url
                ],
                {
                    stdio: [
                        "ignore", 1, 2
                    ]
                }
            ).on("exit", resolve);
        });
    }));
}());
' "$@" # '
    # remove bloated json-coverage-files
    rm .artifact/coverage/*.json
    rm .artifact/coverage_sqlite3_*/*.json
    # js-hack - */
    # .cache - save
    if [ ! -d .cache ]
    then
        mkdir .cache
        cp -a node-sqlite3-* .cache
    fi
)}

shCiBaseCustom() {(set -e
# this function will run base-ci
    # update version in README.md, jslint.mjs, package.json from CHANGELOG.md
    if [ "$(git branch --show-current)" = alpha ]
    then
        node --input-type=module -e '
import jslint from "./jslint.mjs";
import moduleFs from "fs";
(async function () {
    let fileDict = {};
    let fileModified;
    let packageDescription;
    let versionBeta;
    let versionMaster;
    await Promise.all([
        "CHANGELOG.md",
        "README.md",
        "index.html",
        "jslint.mjs",
        "jslint_ci.sh",
        "package.json"
    ].map(async function (file) {
        fileDict[file] = await moduleFs.promises.readFile(file, "utf8");
    }));
    packageDescription = fileDict["package.json"].match(
        /"description": "(.*?)"/
    )[1];
    Array.from(fileDict["CHANGELOG.md"].matchAll(
        /\n\n# (v\d\d\d\d\.\d\d?\.\d\d?(.*?)?)\n/g
    )).slice(0, 2).forEach(function ([
        ignore, version, isBeta
    ]) {
        versionBeta = versionBeta || version;
        versionMaster = versionMaster || (!isBeta && version);
    });
    await Promise.all([
        {
            file: "README.md",
            src: fileDict["README.md"].replace((
                /\bv\d\d\d\d\.\d\d?\.\d\d?\b/m
            ), versionMaster).replace((
                /\n# .*/
            ), "\n# " + packageDescription)
        }, {
            file: "index.html",
            src: fileDict["index.html"].replace((
                /\n<style class="JSLINT_REPORT_STYLE">\n[\S\s]*?\n<\/style>\n/
            ), function () {
                return fileDict["jslint.mjs"].match(
                    /\n<style class="JSLINT_REPORT_STYLE">\n[\S\s]*?\n<\/style>\n/
                )[0];
            })
        }, {
            file: "jslint.mjs",
            // inline css-assets
            src: fileDict["jslint.mjs"].replace((
                /^let jslint_edition = ".*?";$/m
            ), `let jslint_edition = "${versionBeta}";`)
        }, {
            file: "jslint_ci.sh",
            // update coverage-code
            src: fileDict["jslint_ci.sh"].replace((
                /(\nshRunWithCoverage[\S\s]*?\nlet moduleUrl;\n)[\S\s]*?\nv8CoverageReportCreate\(/m
            ), function (ignore, match1) {
                return (
                    match1
                    + [
                        jslint.assertOrThrow,
                        jslint.fsWriteFileWithParents,
                        jslint.htmlEscape,
                        jslint.moduleFsInit,
                        jslint.v8CoverageListMerge,
                        jslint.v8CoverageReportCreate
                    // reduce size of string/argument passed to nodejs
                    // by removing comments
                    ].join("\n").replace((
                        /\n\/\/.*/g
                    ), "").replace((
                        /\n\n\n/g
                    // CL-xxx reduce size of string/argument passed to nodejs
                    // by using 2-space-indent
                    ), "\n").replace((
                        /    /g
                    ), "  ")
                    + "\nv8CoverageReportCreate("
                );
            })
        }, {
            file: "package.json",
            src: fileDict["package.json"].replace((
                /("version": )".*?"/
            ), "$1" + JSON.stringify(versionBeta.slice(1)))
        }
    ].map(async function ({
        file,
        src
    }) {
        let src0 = fileDict[file];
        if (src !== src0) {
            console.error(`update file ${file}`);
            fileModified = file;
            await moduleFs.promises.writeFile(file, src);
        }
    }));
    if (fileModified) {
        // throw new Error("modified file " + fileModified);
        return;
    }
}());
' "$@" # '
    fi
    # test jslint's cli handling-behavior
    printf "node jslint.mjs .\n"
    node jslint.mjs .
    # run test with coverage-report
    printf "node test.mjs\n"
    npm run test
)}