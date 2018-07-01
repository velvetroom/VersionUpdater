import Foundation
import SwiftToShell
@testable import VersionUpdater

class MockVersionerProtocol:VersionerProtocol {
    var shell:ShellProtocol!
    var returnVersion:Version
    
    init() {
        self.returnVersion = Version()
    }
    
    func nextVersion() -> Version {
        return self.returnVersion
    }
}
