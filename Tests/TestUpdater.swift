import XCTest
@testable import VersionUpdater

class TestUpdater:XCTestCase {
    private var model:Updater!
    private var reader:MockReader!
    private var writer:MockWriter!
    private var versioner:MockVersionerProtocol!
    private var shell:MockShellProtocol!
    
    override func setUp() {
        super.setUp()
        self.model = Updater()
        self.reader = MockReader()
        self.writer = MockWriter()
        self.versioner = MockVersionerProtocol()
        self.shell = MockShellProtocol()
        self.model.reader = self.reader
        self.model.writer = self.writer
        self.model.versioner = self.versioner
        self.model.shell = self.shell
    }
    
    func testInjectsShellToVersioner() {
        let model:Updater = Updater()
        XCTAssertNotNil(model.versioner.shell, "Not injected")
    }
    
    func testUpdate() {
        var updated:Bool = false
        self.writer.onUpdateProject = { updated = true }
        self.model.update()
        XCTAssertTrue(updated, "Not updated")
    }
}
