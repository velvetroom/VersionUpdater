import Foundation

struct Version:Equatable {
    var mayor:Int
    var minor:Int
    var build:Int
    
    init() {
        self.mayor = 0
        self.minor = 0
        self.build = 0
    }
}
