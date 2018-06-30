import Foundation

protocol WriterProtocol {
    func updateProjectAt(path:String, with version:Version) throws
}
