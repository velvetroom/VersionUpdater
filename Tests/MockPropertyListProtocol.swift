import Foundation
@testable import VersionUpdater

class MockPropertyListProtocol:PropertyListProtocol {
    var list:[String:Any]
    
    init() {
        self.list = [:]
    }
    
    func getAt(path:URL) throws -> [String:Any] {
        return self.list
    }
    
    func save(list:[String:Any], at path:URL) throws {
        self.list = list
    }
}
