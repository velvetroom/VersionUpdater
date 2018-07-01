import Foundation
@testable import VersionUpdater

class MockWriter:WriterProtocol {
    var throwError:Error?
    var onUpdateProject:(() -> Void)?
    
    func updateProjectAt(path:URL, with version:Version) throws {
        if let throwError:Error = self.throwError {
            throw throwError
        }
        self.onUpdateProject?()
    }
}
