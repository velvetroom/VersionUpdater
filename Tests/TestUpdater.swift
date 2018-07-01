import XCTest
@testable import VersionUpdater

class TestUpdater:XCTestCase {
    private var model:Updater!
    private var reader:MockReader!
    private var writer:MockWriter!
    private var version:MockVersionerProtocol!
    
    override func setUp() {
        super.setUp()
        self.model = Updater()
        self.reader = MockReader()
        self.writer = MockWriter()
        self.version = MockVersionerProtocol()
        self.model.reader = self.reader
        self.model.writer = self.writer
        self.model.versioner = self.version
    }
    
    func testUpdateProject() {
        var updated:Bool = false
        self.writer.onUpdateProject = { updated = true }
        self.model.updateProject()
        XCTAssertTrue(updated, "Not updated")
    }
}
