import Foundation

class PropertyList:PropertyListProtocol {
    func getAt(path:URL) throws -> [String:Any] {
        let data:Data = try Data(contentsOf:path)
        let rawList:Any = try PropertyListSerialization.propertyList(
            from:data, options:PropertyListSerialization.ReadOptions(), format:nil)
        guard
            let list:[String:Any] = rawList as? [String:Any]
        else { throw ErrorVersionUpdater.invalidProjectFile }
        return list
    }
    
    func save(list:[String:Any], at path:URL) throws {
        let data:Data = try PropertyListSerialization.data(fromPropertyList:list,
                                                           format:PropertyListSerialization.PropertyListFormat.xml,
                                                           options:PropertyListSerialization.WriteOptions())
        try data.write(to:path, options:Data.WritingOptions.atomicWrite)
    }
}
