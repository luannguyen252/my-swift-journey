import SwiftUI

extension Image {
    static var cloud: Image { Image("cloud").resizable() }
    static var airship: Image { Image(uiImage: UIImage(named: "airship")!).resizable() }
}
