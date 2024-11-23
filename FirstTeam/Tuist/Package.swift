// swift-tools-version: 5.9
@preconcurrency import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,]
        productTypes: [
            "Alamofire": .framework,
            "SnapKit": .framework,
            "Then": .framework
        ]
    )
#endif

let package = Package(
    name: "temp",
    dependencies: [
         .package(url: "https://github.com/Alamofire/Alamofire.git", exact: "5.10.1"),
         .package(url: "https://github.com/SnapKit/SnapKit.git", exact: "5.7.1"),
         .package(url: "https://github.com/devxoul/Then", exact: "3.0.0"),
    ]
)
