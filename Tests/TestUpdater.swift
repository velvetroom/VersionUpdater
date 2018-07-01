import XCTest
@testable import VersionUpdater

class TestUpdater:XCTestCase {
    private var model:Updater!
    private var reader:MockReader!
    private var writer:MockWriter!
    
    override func setUp() {
        super.setUp()
        self.model = Updater()
        self.reader = MockReader()
        self.writer = MockWriter()
        self.model.reader = self.reader
        self.model.writer = self.writer
    }
    
    func testUpdateProject() {
        
    }
}
