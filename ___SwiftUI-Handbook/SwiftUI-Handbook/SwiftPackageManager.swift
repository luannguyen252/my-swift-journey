import SwiftUI
import SwiftUIX

/// File → Swift Packages → Add Package
/// https://swiftuihub.com/swiftui-libraries/
/// https://github.com/SwiftUIX/SwiftUIX.git - Add UIKit functionalities to SwiftUI
/// https://github.com/SDWebImage/SDWebImageSwiftUI.git - oad URL images asynchronously
/// https://github.com/JohnSundell/Ink.git - Markdown parser
/// https://github.com/maxnatchanon/trackable-scroll-view.git - Track and store the progress in your ScrollView
/// https://github.com/contentful/contentful.swift.git - SDK for Contentful in iOS
/// https://github.com/firebase/firebase-ios-sdk.git - SDK for Firebase in iOS
/// https://github.com/apollographql/apollo-ios.git - GraphQL client for iOS

struct SwiftPackageManager: View {
    var body: some View {
        ZStack {
            Text("Hello, world!")
                .font(.largeTitle).bold()
            VisualEffectBlurView(blurStyle: .systemUltraThinMaterial)
        }
    }
}

#if DEBUG
struct SwiftPackageManager_Previews: PreviewProvider {
    static var previews: some View {
        SwiftPackageManager()
    }
}
#endif
