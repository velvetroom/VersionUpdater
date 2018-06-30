import Foundation

public class Updater {
    var reader:ReaderProtocol
    var writer:WriterProtocol
    
    public init() {
        self.reader = Reader()
        self.writer = Writer()
    }
}
