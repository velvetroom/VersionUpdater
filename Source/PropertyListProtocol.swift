import Foundation

protocol PropertyListProtocol {
    func getAt(path:URL) throws -> [String:Any]
    func save(list:[String:Any], at path:URL) throws
}
