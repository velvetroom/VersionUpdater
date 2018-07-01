import Foundation

struct ErrorVersionUpdater:LocalizedError {
    let errorDescription:String?
    
    static let projectNotSpecified:ErrorVersionUpdater = ErrorVersionUpdater(errorDescription:
        "Error Version Updater: Project file not specified")
}
