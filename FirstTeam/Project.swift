import ProjectDescription

let project = Project(
    name: "FirstTeam",
    settings: .settings(
        configurations: [
            .debug(name: .debug, xcconfig: "FirstTeam/Resources/Secret.xcconfig")
        ]
    ),
    targets: [
        .target(
            name: "FirstTeam",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.FirstTeam",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                    "UIApplicationSceneManifest": [
                        "UIApplicationSupportsMultipleScenes": false,
                        "UISceneConfigurations": [
                            "UIWindowSceneSessionRoleApplication": [
                                [
                                    "UISceneConfigurationName": "Default Configuration",
                                    "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                                ],
                            ]
                        ]
                    ],
                    "BASE_URL": "$(BASE_URL)"
                ]
            ),
            sources: ["FirstTeam/Sources/**"],
            resources: ["FirstTeam/Resources/**"],
            dependencies: [
                .external(name: "Alamofire"),
                .external(name: "SnapKit"),
                .external(name: "Then"),
            ]
        ),
        .target(
            name: "FirstTeamTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.FirstTeamTests",
            infoPlist: .default,
            sources: ["FirstTeam/Tests/**"],
            resources: [],
            dependencies: [.target(name: "FirstTeam")]
        ),
    ]
)
