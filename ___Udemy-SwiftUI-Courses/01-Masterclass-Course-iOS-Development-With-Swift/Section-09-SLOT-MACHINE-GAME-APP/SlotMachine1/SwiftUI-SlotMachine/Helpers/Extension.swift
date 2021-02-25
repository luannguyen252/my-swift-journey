import SwiftUI

// Text Extension
extension Text {
    // Score Label
    func scoreLabelStyle() -> Text {
        self
        .foregroundColor(.white)
        .font(.system(size: 10, weight: .bold, design: .rounded))
    }

    // Score Number Label
    func scoreNumberStyle() -> Text {
        self
        .foregroundColor(.white)
        .font(.system(.title, design: .rounded))
        .fontWeight(.heavy)
    }
}
