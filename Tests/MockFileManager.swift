import Foundation

class MockFileManager:FileManager {
    override func fileExists(atPath path:String) -> Bool {
        return true
    }
}
