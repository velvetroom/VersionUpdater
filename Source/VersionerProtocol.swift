import Foundation

protocol VersionerProtocol {
    var shell:ShellProtocol! { get set }
    
    func nextVersion() -> Version
}
