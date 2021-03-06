import Foundation
@testable import VersionUpdater

class MockReader:ReaderProtocol {
    var throwError:Error?
    var returnPath:URL
    
    init() {
        self.returnPath = URL(fileURLWithPath:String())
    }
    
    func getProjectPath() throws -> URL {
        if let throwError:Error = self.throwError {
            throw throwError
        }
        return self.returnPath
    }
}
