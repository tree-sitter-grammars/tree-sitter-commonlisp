// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "TreeSitterCommonLisp",
    platforms: [.macOS(.v13), .iOS(.v15)],
    products: [
        .library(name: "TreeSitterCommonLisp", targets: ["TreeSitterCommonLisp"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ChimeHQ/SwiftTreeSitter", from: "0.8.0"),
    ],
    targets: [
        .target(name: "TreeSitterCommonLisp",
                path: ".",
                exclude: [
                    "Cargo.toml",
                    "Makefile",
                    "binding.gyp",
                    "bindings/c",
                    "bindings/go",
                    "bindings/node",
                    "bindings/python",
                    "bindings/rust",
                    "prebuilds",
                    "grammar.js",
                    "package.json",
                    "package-lock.json",
                    "pyproject.toml",
                    "setup.py",
                    "test",
                    ".editorconfig",
                    ".github",
                    ".gitignore",
                    ".gitattributes",
                    ".gitmodules",
                ],
                sources: [
                    "src/parser.c",
                    // NOTE: if your language has an external scanner, add it here.
                ],
                resources: [
                    .copy("queries")
                ],
                publicHeadersPath: "bindings/swift",
                cSettings: [.headerSearchPath("src")]),
         .testTarget(
                name: "TreeSitterCommonLispTests",
                dependencies: [
                    "SwiftTreeSitter",
                    "TreeSitterCommonLisp",
                ],
                path: "bindings/swift/TreeSitterCommonLispTests"
        )
    ],
    cLanguageStandard: .c11
)
