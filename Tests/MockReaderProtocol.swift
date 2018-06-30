import Foundation
@testable import VersionUpdater

class MockReader:ReaderProtocol {
    var throwError:Error?
    var returnString:String
    
    init() {
        self.returnString = String()
    }
    
    func getProjectPath() throws -> String {
        if let throwError:Error = self.throwError {
            throw throwError
        }
        return self.returnString
    }
}
