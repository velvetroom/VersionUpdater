import Foundation

class GitTagFactory {
    class func makeWith(string:String) -> GitTag {
        var gitTag:GitTag = GitTag()
//        let components:[String] = string.components(separatedBy:Constants.Git.separator)
        return gitTag
    }
    
    class func makeStringFrom(gitTag:GitTag) -> String {
        return "\(gitTag.mayor).\(gitTag.minor).\(gitTag.build)"
    }
    
    private init() { }
}
