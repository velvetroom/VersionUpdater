import Foundation

class Writer:WriterProtocol {
    var propertyList:PropertyListProtocol
    
    init() {
        self.propertyList = PropertyList()
    }
    
    func updateProjectAt(path:URL, with version:Version) throws {
        let project:[String:Any] = try self.getProjectAt(path:path, with:version)
        try self.propertyList.save(list:project, at:path)
    }
    
    private func getProjectAt(path:URL, with version:Version) throws -> [String:Any] {
        let projectFile:[String:Any] = try self.propertyList.getAt(path:path)
        let updatedProject:[String:Any] = self.update(project:projectFile, with:version)
        return updatedProject
    }
    
    private func update(project:[String:Any], with version:Version) -> [String:Any] {
        var project:[String:Any] = project
        project[Constants.Plist.versionKey] = VersionFactory.makeStringFrom(version:version)
        project[Constants.Plist.buildKey] = String(version.build)
        return project
    }
}
