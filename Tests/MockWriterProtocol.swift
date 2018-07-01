import Foundation
@testable import VersionUpdater

class MockWriter:WriterProtocol {
    var throwError:Error?
    
    func updateProjectAt(path:URL, with version:Version) throws {
        if let throwError:Error = self.throwError {
            throw throwError
        }
    }
}
