import Foundation
@testable import VersionUpdater

class MockWriter:WriterProtocol {
    var throwError:Error?
    
    func updateProjectAt(path:String, with version:Version) throws {
        if let throwError:Error = self.throwError {
            throw throwError
        }
    }
}
