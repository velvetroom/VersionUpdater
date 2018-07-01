import Foundation
import SwiftToShell

class MockShellProtocol:ShellProtocol {
    var onSendMessage:(() -> Void)?
    var returnString:String
    
    init() {
        self.returnString = String()
    }
    
    func send(message:String) -> String {
        self.onSendMessage?()
        return self.returnString
    }
}
