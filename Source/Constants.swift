import Foundation

struct Constants {
    struct Arguments {
        static let projectLocation:Int = 1
    }
    
    struct Plist {
        static let fileExtension:String = ".plist"
        static let versionKey:String = "CFBundleShortVersionString"
        static let buildKey:String = "CFBundleVersion"
    }
    
    struct Git {
        static let countCommits:String = "git rev-list HEAD --count"
        static let listTags:String = "git tag --sort=-refname"
        static let separator:String = "."
    }
    
    struct Version {
        static let defaultMayor:Int = 1
        static let defaultMinor:Int = -1
        static let defaultBuild:Int = 0
    }
}
