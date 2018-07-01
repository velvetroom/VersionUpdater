import Foundation

class Reader:ReaderProtocol {
    func getProjectPath() throws -> URL {
        throw ErrorVersionUpdater.projectNotSpecified
    }
}
