import XCTest
@testable import VersionUpdater

class TestVersioner:XCTestCase {
    private var model:Versioner!
    private var shell:MockShell!
    
    override func setUp() {
        super.setUp()
        self.model = Versioner()
        self.shell = MockShell()
        self.model.shell = self.shell
    }
    
    func testGetNextVersionWithBuild() {
        let value:Int = 5
        self.shell.returnString = "\(value)"
        var expected:Version = Version()
        expected.mayor = value
        expected.minor = Constants.Version.defaultMinor + 1
        expected.build = value + 1
        let version:Version = self.model.nextVersion()
        XCTAssertEqual(expected, version, "Invalid version")
    }
    
    func testGetNextVersionWithTag() {
        let mayor:Int = 5
        let minor:Int = 5
        let build:Int = 5
        self.shell.returnString = "\(mayor).\(minor).\(build)"
        var expected:Version = Version()
        expected.mayor = mayor
        expected.minor = minor + 1
        expected.build = Constants.Version.defaultBuild + 1
        let version:Version = self.model.nextVersion()
        XCTAssertEqual(expected, version, "Invalid version")
    }
}
