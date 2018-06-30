import Foundation

struct ErrorVersionUpdater:LocalizedError {
    let errorDescription:String?
    
    static let commitsNotFound:ErrorVersionUpdater = ErrorVersionUpdater(errorDescription:
        "Error Version Updater: Commits not found")
    static let plistNotFound:ErrorVersionUpdater = ErrorVersionUpdater(errorDescription:
        "Error Version Updater: Plist not found")
}
