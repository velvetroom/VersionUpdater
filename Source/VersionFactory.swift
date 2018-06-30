import Foundation

class VersionFactory {
    class func makeWith(gitTag:String) -> Version {
        var version:Version = Version()
        version.mayor = makeMayorWith(gitTag:gitTag)
        version.minor = makeMinorWith(gitTag:gitTag)
        version.build = makeBuildWith(gitTag:gitTag)
        return version
    }
    
    class func makeStringFrom(version:Version) -> String {
        return "\(version.mayor).\(version.minor).\(version.build)"
    }
    
    private class func makeMayorWith(gitTag:String) -> Int {
        let components:[String] = gitTag.components(separatedBy:Constants.Git.separator)
        guard
            let first:String = components.first,
            let numeric:Int = Int(first)
        else { return Constants.Version.defaultMayor }
        return numeric
    }
    
    private class func makeMinorWith(gitTag:String) -> Int {
        let components:[String] = gitTag.components(separatedBy:Constants.Git.separator)
        guard
            components.count > 1,
            let numeric:Int = Int(components[1])
        else { return Constants.Version.defaultMinor }
        return numeric
    }
    
    private class func makeBuildWith(gitTag:String) -> Int {
        let components:[String] = gitTag.components(separatedBy:Constants.Git.separator)
        guard
            let last:String = components.last,
            let numeric:Int = Int(last)
        else { return Constants.Version.defaultBuild }
        return numeric
    }
    
    private init() { }
}
