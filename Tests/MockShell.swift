import Foundation
@testable import SwiftToShell

class MockShell:Shell {
    var returnString:String
    
    override init() {
        self.returnString = String()
        super.init()
    }
    
    override func send(message:String) -> String {
        return self.returnString
    }
}
