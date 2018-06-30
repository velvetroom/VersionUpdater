import XCTest
@testable import VersionUpdater

class TestVersioner:XCTestCase {
    private var model:Versioner!
    
    override func setUp() {
        super.setUp()
        self.model = Versioner()
    }
    
    func testGetCurrentVersion() {
        
    }
}
