import Foundation
import SwiftToShell

public class Updater {
    var reader:ReaderProtocol
    var writer:WriterProtocol
    var versioner:VersionerProtocol
    var shell:ShellProtocol
    
    public init() {
        self.reader = Reader()
        self.writer = Writer()
        self.versioner = Versioner()
        self.shell = ShellFactory.makeShell()
        self.versioner.shell = self.shell
    }
    
    public func update() {
        do {
            try self.updateProject()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func updateProject() throws {
        let path:URL = try self.reader.getProjectPath()
        let nextVersion:Version = self.versioner.nextVersion()
        try self.writer.updateProjectAt(path:path, with:nextVersion)
    }
}
