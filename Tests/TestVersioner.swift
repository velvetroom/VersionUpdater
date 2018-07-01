import XCTest
import SwiftToShell
@testable import VersionUpdater

class TestVersioner:XCTestCase {
    private var model:Versioner!
    private var shell:MockShellProtocol!
    
    override func setUp() {
        super.setUp()
        self.model = Versioner()
        self.shell = MockShellProtocol()
        self.model.shell = self.shell
    }
    
    func testGetNextVersionWithBuild() {
        let value:Int = 5
        self.shell.returnString = "\(value)"
        var expected:Version = Version()
        expected.mayor = value
        expected.minor = VersionUpdaterConstants.Version.defaultMinor + 1
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
        expected.build = VersionUpdaterConstants.Version.defaultBuild + 1
        let version:Version = self.model.nextVersion()
        XCTAssertEqual(expected, version, "Invalid version")
    }
    
    func testNotRetainingShell() {
        self.model.shell = MockShellProtocol()
        XCTAssertNil(self.model.shell, "Retaining shell")
    }
}
