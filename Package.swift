// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "md4c",
    products: [
        // The core Markdown parser library.
        .library(
            name: "md4c",
            targets: ["md4c"]
        ),
        // The HTML renderer library (depends on md4c).
        .library(
            name: "md4c-html",
            targets: ["md4c-html"]
        ),
    ],
    targets: [
        // Core Markdown parser: compiles src/md4c.c and exposes md4c.h as public.
        .target(
            name: "md4c",
            path: ".",
            sources: ["src/md4c.c"],
            publicHeadersPath: "Sources/md4c/include",
            cSettings: [
                .headerSearchPath("src")
            ]
        ),
        // HTML renderer: compiles src/md4c-html.c and src/entity.c, depends on md4c.
        .target(
            name: "md4c-html",
            dependencies: ["md4c"],
            path: ".",
            sources: ["src/md4c-html.c", "src/entity.c"],
            publicHeadersPath: "Sources/md4c-html/include",
            cSettings: [
                .headerSearchPath("src")
            ]
        ),
    ]
)