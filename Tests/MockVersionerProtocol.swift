import Foundation
@testable import VersionUpdater

class MockVersionerProtocol:VersionerProtocol {
    var returnVersion:Version
    
    init() {
        self.returnVersion = Version()
    }
    
    func nextVersion() -> Version {
        return self.returnVersion
    }
}
