import SwiftUI


// Helpers for manually simulating landscape-mode previews, since this is not yet supported directly
// Reference:
//  https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/adaptivity-and-layout/


extension PreviewLayout {

    // MARK: - iPhone
    public static var iPhoneSELandscape: PreviewLayout = .fixed(width: 568, height: 320)
    public static var iPhone11Landscape: PreviewLayout = .fixed(width: 896, height: 414)


    // MARK: - iPad
    public static var iPadPro11InchLandscape: PreviewLayout = .fixed(width: 2388, height: 1668)
}
