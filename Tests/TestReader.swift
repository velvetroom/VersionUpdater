import XCTest
@testable import VersionUpdater

class TestReader:XCTestCase {
    private var model:Reader!
    private var fileManager:MockFileManager!
    
    override func setUp() {
        super.setUp()
        self.model = Reader()
        self.fileManager = MockFileManager()
        self.model.fileManager = self.fileManager
    }
    
    func testThrowsWhenNoArguments() {
        XCTAssertThrowsError(try self.model.getProjectPath(), "Should throw")
    }
    
    func testNotRetainingFileManager() {
        self.model.fileManager = MockFileManager()
        XCTAssertNil(self.model.fileManager, "Retains")
    }
    
    func testShouldNotThrowWhenProjectSpecified() {
        self.model.arguments = ["", "/dummy.plist"]
        XCTAssertNoThrow(try self.model.getProjectPath(), "Should not throw")
    }
}
