import Foundation

struct Constants {
    struct Plist {
        static let location:String = "../Configuration/source.plist"
        static let versionKey:String = "CFBundleShortVersionString"
        static let bundleKey:String = "CFBundleVersion"
    }
    
    struct Git {
        static let countCommits:String = "git rev-list HEAD --count"
        static let listTags:String = "git tag --sort=-refname"
        static let separator:String = "."
    }
}
