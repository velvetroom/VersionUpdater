import XCTest
@testable import VersionUpdater

class TestVersionFactory:XCTestCase {
    func testMakeFirstVersion() {
        let version:Version = VersionFactory.makeWith(gitTag:String())
        XCTAssertEqual(version.mayor, 1, "Invalid version")
        XCTAssertEqual(version.minor, 0, "Invalid version")
        XCTAssertEqual(version.build, 0, "Invalid version")
    }
}
