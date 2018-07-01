import XCTest
@testable import VersionUpdater

class TestWriter:XCTestCase {
    private var model:Writer!
    private var propertyList:MockPropertyListProtocol!
    private var url:URL!
    private var version:Version!
    
    override func setUp() {
        super.setUp()
        self.model = Writer()
        self.propertyList = MockPropertyListProtocol()
        self.model.propertyList = self.propertyList
        self.url = URL(fileURLWithPath:String())
        self.version = Version()
    }
    
    func testUpdateBuild() {
        self.version.build = 99
        do { try self.model.updateProjectAt(path:self.url, with:self.version) } catch { }
        XCTAssertEqual(self.propertyList.list[Constants.Plist.buildKey] as? String, String(self.version.build),
                       "Not updated")
    }
    
    func testUpdateVersion() {
        self.version.build = 4
        self.version.minor = 9
        self.version.mayor = 8
        let expectedVersion:String = VersionFactory.makeStringFrom(version:self.version)
        do { try self.model.updateProjectAt(path:self.url, with:self.version) } catch { }
        XCTAssertEqual(self.propertyList.list[Constants.Plist.versionKey] as? String, expectedVersion,
                       "Not updated")
    }
    
    func testPersistsOtherValuesInProjectFileWhileUpdating() {
        let randomKey:String = "lorem ipsum"
        let randomValue:String = "hello world"
        self.propertyList.list[randomKey] = randomValue
        do { try self.model.updateProjectAt(path:self.url, with:self.version) } catch { }
        XCTAssertEqual(self.propertyList.list[randomKey] as? String, randomValue, "Not persisiting other values")
    }
}
