import Foundation

class VersionFactory {
    class func makeWith(gitTag:String) -> Version {
        var version:Version = Version()
//        let components:[String] = string.components(separatedBy:Constants.Git.separator)
        return version
    }
    
    class func makeStringFrom(version:Version) -> String {
        return "\(version.mayor).\(version.minor).\(version.build)"
    }
    
    private init() { }
}
