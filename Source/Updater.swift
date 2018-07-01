import Foundation

public class Updater {
    var reader:ReaderProtocol
    var writer:WriterProtocol
    var versioner:VersionerProtocol
    
    public init() {
        self.reader = Reader()
        self.writer = Writer()
        self.versioner = Versioner()
    }
    
    public func updateProject() {
        
    }
}
