shArtifactUploadCustom() {(set -e
# this function will custom-upload build-artifacts to branch-gh-pages
    # screenshot asset_image_logo
    shImageLogoCreate &
    # screenshot install
    shBrowserScreenshot \
        "https://$UPSTREAM_OWNER.github.io/\
$UPSTREAM_REPO/branch-beta/index.html"
    # screenshot curl
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
    // parallel-task - screenshot example-shell-commands in README.md
    Array.from(String(
        await moduleFs.promises.readFile("README.md", "utf8")
    ).matchAll(
        /\n```shell\u0020<!--\u0020shRunWithScreenshotTxt\u0020(.*?)\u0020-->\n([\S\s]*?\n)```\n/g
    )).forEach(async function ([
        ignore, file, script
    ]) {
        await moduleFs.promises.writeFile(file + ".sh", (
            "printf \u0027"
            + script.trim().replace((
                /[%\\]/gm
            ), "$&$&").replace((
                /\u0027/g
            ), "\u0027\"\u0027\"\u0027").replace((
                /^/gm
            ), "> ")
            + "\n\n\n\u0027\n"
            + script.replace(
                "curl -L https://www.jslint.com/jslint.mjs > jslint.mjs",
                screenshotCurl
            )
        ));
        moduleChildProcess.spawn(
            "sh",
            [
                "jslint_ci.sh",
                "shRunWithScreenshotTxt",
                file,
                "sh",
                file + ".sh"
            ],
            {
                stdio: [
                    "ignore", 1, 2
                ]
            }
        );
    });
}());
' "$@" # '
    # screenshot asset_image_logo_512.png
    shBrowserScreenshot .jslint_report.html \
        --window-size=512x512 \
        -screenshot=.build/screenshot_install_cli_report.png
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
    git add -f jslint.cjs jslint.js || true
)}

shCiBaseCustom() {(set -e
# this function will run base-ci
    # create jslint.cjs
    cp jslint.mjs jslint.js
    cat jslint.mjs | sed \
        -e "s|^// module.exports = |module.exports = |" \
        -e "s|^export default Object.freeze(|// &|" \
        -e "s|^jslint_import_meta_url = |// &|" \
        > jslint.cjs
    # run test with coverage-report
    # coverage-hack - test jslint's invalid-file handling-behavior
    mkdir -p .test-dir.js
    # test jslint's cli handling-behavior
    printf "node jslint.cjs .\n"
    node jslint.cjs .
    printf "node jslint.mjs .\n"
    node jslint.mjs .
    printf "node test.mjs\n"
    (set -e
        # coverage-hack - test jslint's cli handling-behavior
        export JSLINT_BETA=1
        shRunWithCoverage node test.mjs
    )
    # update edition in README.md, jslint.mjs from CHANGELOG.md
    node --input-type=module -e '
import moduleFs from "fs";
(async function () {
    let fileDict;
    let versionBeta;
    let versionMaster;
    fileDict = {};
    await Promise.all([
        "CHANGELOG.md",
        "README.md",
        "index.html",
        "jslint.mjs"
    ].map(async function (file) {
        fileDict[file] = await moduleFs.promises.readFile(file, "utf8");
    }));
    Array.from(fileDict["CHANGELOG.md"].matchAll(
        /\n\n#\u0020(v\d\d\d\d\.\d\d?\.\d\d?(.*?)?)\n/g
    )).slice(0, 2).forEach(function ([
        ignore, version, isBeta
    ]) {
        versionBeta = versionBeta || version;
        versionMaster = versionMaster || (!isBeta && version);
    });
    [
        {
            file: "README.md",
            src: fileDict["README.md"].replace((
                /\bv\d\d\d\d\.\d\d?\.\d\d?\b/m
            ), versionMaster),
            src0: fileDict["README.md"]
        }, {
            file: "jslint.mjs",
            // inline css-assets
            src: fileDict["jslint.mjs"].replace((
                /^let\u0020jslint_edition\u0020=\u0020".*?";$/m
            ), `let jslint_edition = "${versionBeta}";`),
            src0: fileDict["jslint.mjs"]
        }, {
            file: "index.html",
            src: fileDict["index.html"].replace((
                /\n<style\sclass="JSLINT_REPORT_STYLE">\n[\S\s]*?\n<\/style>\n/
            ), function () {
                return fileDict["jslint.mjs"].match(
                    /\n<style\sclass="JSLINT_REPORT_STYLE">\n[\S\s]*?\n<\/style>\n/
                )[0];
            }),
            src0: fileDict["index.html"]
        }
    ].forEach(function ({
        file,
        src,
        src0
    }) {
        if (src !== src0) {
            console.error(`update file ${file}`);
            moduleFs.promises.writeFile(file, src);
        }
    });
}());
' "$@" # '
)}
