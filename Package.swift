// swift-tools-version:4.0
import PackageDescription

let package:Package = Package(
    name:"VersionUpdater",
    dependencies:[.package(url:"https://github.com/velvetroom/SwiftToShell.git", .branch("master"))],
    targets:[.target(name:"VersionUpdater", dependencies:["SwiftToShell"], path:"Source/")]
)
