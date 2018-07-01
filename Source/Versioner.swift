import Foundation
import SwiftToShell

class Versioner:VersionerProtocol {
    weak var shell:ShellProtocol!
    
    func nextVersion() -> Version {
        var version:Version = self.getNextTag()
        version.build = self.getNextBuild()
        return version
    }
    
    private func getNextTag() -> Version {
        var currentTag:Version = self.getCurrentTag()
        currentTag.minor += 1
        return currentTag
    }
    
    private func getNextBuild() -> Int {
        return self.getCurrentBuild() + 1
    }
    
    private func getCurrentBuild() -> Int {
        let build:String = self.shell.send(message:VersionUpdaterConstants.Git.countCommits)
        guard
            let numeric:Int = Int(build)
        else { return 0 }
        return numeric
    }
    
    private func getCurrentTag() -> Version {
        let tags:[String] = self.getAllTags()
        guard
            let lastTag:String = tags.first
        else { return Version() }
        return VersionFactory.makeWith(gitTag:lastTag)
    }
    
    private func getAllTags() -> [String] {
        let tagString:String = self.shell.send(message:VersionUpdaterConstants.Git.listTags)
        return tagString.components(separatedBy:"\n")
    }
}
