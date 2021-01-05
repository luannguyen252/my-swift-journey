import Foundation

public class Singer {
    public static let musicPlayer = MusicPlayer()
    
    public var name: String
    
    public lazy var reversedName: String = makeReversedName()
    
    public init(name: String) {
        print("Creating a new Singer")
        self.name = name
    }
}

private extension Singer {
    func makeReversedName() -> String {
        return String(name.reversed())
    }
}
