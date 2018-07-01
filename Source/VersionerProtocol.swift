import Foundation
import SwiftToShell

protocol VersionerProtocol {
    var shell:ShellProtocol! { get set }
    
    func nextVersion() -> Version
}
