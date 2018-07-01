import Foundation

struct ErrorVersionUpdater:LocalizedError {
    let errorDescription:String?
    
    static let projectNotSpecified:ErrorVersionUpdater = ErrorVersionUpdater(errorDescription:
        "Error Version Updater: Project file not specified")
    static let argumentNotFound:ErrorVersionUpdater = ErrorVersionUpdater(errorDescription:
        "Error Version Updater: Argument not found")
    static let fileDoesNotExist:ErrorVersionUpdater = ErrorVersionUpdater(errorDescription:
        "Error Version Updater: File does not exists")
    static let invalidProjectFile:ErrorVersionUpdater = ErrorVersionUpdater(errorDescription:
        "Error Version Updater: Invalid project file")
}
