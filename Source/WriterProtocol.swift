import Foundation

protocol WriterProtocol {
    func updateProjectAt(path:URL, with version:Version) throws
}
