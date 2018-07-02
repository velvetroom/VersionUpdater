import Foundation

class Reader:ReaderProtocol {
    weak var fileManager:FileManager!
    var arguments:[String]
    
    init() {
        self.arguments = CommandLine.arguments
        self.fileManager = FileManager.default
    }
    
    func getProjectPath() throws -> URL {
        let projectPath:String = try self.getProjectArgument()
        let url:URL = URL(fileURLWithPath:projectPath)
        try self.validateFileExistsAt(url:url)
        return url
    }
    
    private func getProjectArgument() throws -> String {
        let argument:String = try self.getArgumentAt(index:VersionUpdaterConstants.Arguments.projectLocation)
        guard
            argument.contains(VersionUpdaterConstants.Plist.fileExtension)
        else { throw ErrorVersionUpdater.projectNotSpecified }
        return argument
    }
    
    private func validateFileExistsAt(url:URL) throws {
        if self.fileManager.fileExists(atPath:url.absoluteString) == false {
            print(url.absoluteString)
            throw ErrorVersionUpdater.fileDoesNotExist
        }
    }
    
    private func getArgumentAt(index:Int) throws -> String {
        guard
            self.arguments.count > index
        else { throw ErrorVersionUpdater.argumentNotFound }
        return self.arguments[index]
    }
}
