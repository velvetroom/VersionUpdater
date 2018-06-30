import XCTest
@testable import VersionUpdater

class TestVersionFactory:XCTestCase {
    func testMakeFirstVersion() {
        let version:Version = VersionFactory.makeWith(gitTag:String())
        XCTAssertEqual(version.mayor, Constants.Version.defaultMayor, "Invalid version")
        XCTAssertEqual(version.minor, Constants.Version.defaultMinor, "Invalid version")
        XCTAssertEqual(version.build, Constants.Version.defaultBuild, "Invalid version")
    }
    
    func testMakeFirstVersionWhenInvalidTag() {
        let version:Version = VersionFactory.makeWith(gitTag:"Hello world")
        XCTAssertEqual(version.mayor, Constants.Version.defaultMayor, "Invalid version")
        XCTAssertEqual(version.minor, Constants.Version.defaultMinor, "Invalid version")
        XCTAssertEqual(version.build, Constants.Version.defaultBuild, "Invalid version")
    }
    
    func testMakeVersionWithTag() {
        let mayor:Int = 345
        let minor:Int = 4
        let build:Int = 120
        let version:Version = VersionFactory.makeWith(gitTag:"\(mayor).\(minor).\(build)")
        XCTAssertEqual(version.mayor, mayor, "Invalid version")
        XCTAssertEqual(version.minor, minor, "Invalid version")
        XCTAssertEqual(version.build, build, "Invalid version")
    }
    
    func testMakeVersionCombined() {
        let mayor:Int = 345
        let version:Version = VersionFactory.makeWith(gitTag:"\(mayor)")
        XCTAssertEqual(version.mayor, mayor, "Invalid version")
        XCTAssertEqual(version.minor, Constants.Version.defaultMinor, "Invalid version")
        XCTAssertEqual(version.build, mayor, "Invalid version")
    }
}
