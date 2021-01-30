# My Swift Journey

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Swift](https://img.shields.io/badge/Language-Swift-orange)
![SwiftUI](https://img.shields.io/badge/Platform-SwiftUI-purple)
[![User Interface: SwiftUI](https://img.shields.io/badge/User%20Interface-SwiftUI-blue)](https://developer.apple.com/xcode/interface-builder/)
![Xcode 12](https://img.shields.io/badge/IDE-Xcode%2012-blue)

> A collection for my journey to learn Swift programming language, a powerful and intuitive programming language for macOS, iOS, watchOS, tvOS and beyond.

![My Swift Journey](./MySwiftJourneyCover.png "My Swift Journey")

Visit Swift official website: [Swift](https://developer.apple.com/swift/)

Visit SwiftUI website: [SwiftUI](https://developer.apple.com/xcode/swiftui/)

---

## SwiftUI

> SwiftUI is a modern way to declare user interfaces for any Apple platform. Create beautiful, dynamic apps faster than ever before.

SwiftUI is an innovative new way to build user interfaces across all Apple platforms, so you can create better apps with less code. With a declarative Swift syntax that’s easy to read and natural to write, SwiftUI works seamlessly with new Xcode design tools to keep your code and design perfectly in sync. Automatic support for Dynamic Type, Dark Mode, localization, and accessibility means your first line of SwiftUI code is already the most powerful UI code you’ve ever written.

Visit SwiftUI Tutorials from Apple: [SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui)

---

[Carbon](https://carbon.now.sh/)

> Create and share beautiful images of your source code. Start typing or drop a file into the text area to get started.

---

## Navigation View

```swift
struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("You're going to flip a coin – do you want to choose heads or tails?")

                NavigationLink(destination: ResultView(choice: "Heads")) {
                    Text("Choose Heads")
                }

                NavigationLink(destination: ResultView(choice: "Tails")) {
                    Text("Choose Tails")
                }
            }
            .navigationBarTitle("Navigation")
        }
    }
}
```

---

## Global Variables

1.

```swift
// MARK: Colors
let darkGray = Color(red: 41/255, green: 42/255, blue: 48/255)
let darkBlue = Color(red: 96/255, green: 174/255, blue: 201/255)
let darkPink = Color(red: 244/255, green: 132/255, blue: 177/255)
let darkViolet = Color(red: 214/255, green: 189/255, blue: 251/255)
```

```swift
.foregroundColor(darkBlue)
```

2.

```swift
// Colors
extension Color {
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
}

// Gradient
extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topTrailing, endPoint: .bottomTrailing)
    }
}
```

```swift
LinearGradient(Color.darkEnd, Color.darkStart)
```

---

## Detect Dark Mode

```swift
@Environment(\.colorScheme) var colorScheme

.foregroundColor(colorScheme == .dark ? Color.black : Color.white)
```

---

## Change Status Bar

```swift
import SwiftUI

// Using this to provide .lightContent status bar style
class HostingController<T: View>: UIHostingController<T> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
```

---

## Use HEX Colors

```swift
import SwiftUI

prefix operator ⋮
prefix func ⋮(hex:UInt32) -> Color {
    return Color(hex)
}

extension Color {
    init(_ hex: UInt32, opacity:Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}

let hexColor:(UInt32) -> (Color) = {
    return Color($0)
}
```

Use: `.foregroundColor(Color(0x111111))`

---

## For phones having lesser screen size

`ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : .init(), showsIndicators: false) { ... }`

---

## @State and @Binding

```swift
struct ContentView: View {
    @State var show = false

    var body: some View {
        ZStack {
            Text("View Transition")
                .font(.system(size: 18))
                .fontWeight(.bold)
                .foregroundColor(Color("dark"))
                .padding()
                .background(Capsule().fill(Color("pink2")))
                .onTapGesture {
                    withAnimation(.spring()) {
                        show.toggle()
                    }
                }

            if show {
                NewView(show: $show)
                    .transition(.move(edge: .bottom)) // .bottom, .top, .leading, .trailing
                    .zIndex(1)
            }
        }
        .statusBar(hidden: true)
    }
}

struct NewView: View {
    @Binding var show: Bool

    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color("pink2"))
            .padding()
            .onTapGesture {
                withAnimation(.easeOut) {
                    show.toggle()
                }
            }
    }
}
```

---

# SwiftUI - Shadows

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Text("App of the day")
                .font(.title).bold()
                .foregroundColor(.white)
                .shadow(radius: 20)
        }
        .frame(width: 300, height: 400)
        .background(Color("pink2"))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        .shadow(color: Color("pink2").opacity(0.3), radius: 20, x: 0, y: 10)
    }
}
```

---

- Take a design-first approach
- Effortlessly share model code
- Be judicious when sharing new code
- Learn once, apply anywhere

## iOS

---

## iPadOS

---

## macOS

- Keyboard shortcuts

---

## watchOS

1. Provide useful information
2. Offer intuitive actions
3. Deliver at the right time

## tvOS

**3 keypoints:**

1. 10-foot experience

- Large screen
- Long viewing distance
- Extended periods of use
- Multiple viewers at the same time

2. Focus and the Siri Remote

- Entire interface must support focus
- SwiftUI supports focus by default

3. Streamlined navigation

- TabbedView

![tvOS - TabbedView](./_Images/tvOS_TabbedView_1.png "tvOS - TabbedView")

---

## Pending Projects

1. [My First App Clips](./MyFirstAppClips/)

2. [Fetch Data API](./FetchDataAPI/)

3. [Detect Shake Gestures](./DetectShakeGestures/)

4. [Auto Validation](./AutoValidation/)

5. [Simple iOS and watchOS App](./SimpleIOSAndWatchOSApp/)

---

## Update User Interface

1. [Courses App](./CoursesApp/)

2. [Custom Curves and Shapes](./CustomCurvesAndShapes/)

---

## Helpful Links

1. [SwiftUI On All Devices - WWDC 2019 - Videos - Apple Developer](https://developer.apple.com/videos/play/wwdc2019/240/)

> Once you've learned the basics of SwiftUI, you've learned what you need to know to use SwiftUI anywhere. You can use the same SwiftUI skills for making an iOS app as you would for making an app on watchOS, tvOS or macOS. We'll cover the basics, and then dig into more detail about how SwiftUI can help you make changes to your app on every Apple device. Hear about design principles for each platform and learn about how much code you can share across platforms.

2. [Introduction to SwiftUI](https://developer.apple.com/videos/play/wwdc2020/10119/)

> Explore the world of declarative-style programming: Discover how to build a fully-functioning SwiftUI app from scratch as we explain the benefits of writing declarative code and how SwiftUI and Xcode can combine forces to help you build great apps, faster.

3. [What's new in SwiftUI](https://developer.apple.com/videos/play/wwdc2020/10041/)

> SwiftUI can help you build better and more powerful apps for iPhone, iPad, Mac, Apple Watch, and Apple TV. Learn more about the latest refinements to SwiftUI, including interface improvements like outlines, grids, and toolbars. Take advantage of SwiftUI's enhanced support across Apple frameworks to enable features like Sign In with Apple. Discover new visual effects, as well as new controls and styles. And find out how the new app and scene APIs enable you to create apps entirely in SwiftUI, as well as custom complications and all new widgets. To get the most out of this session, you should be familiar with SwiftUI. Watch "Introduction to SwiftUI" for a primer.

4. [Build SwiftUI apps for tvOS](https://developer.apple.com/videos/play/wwdc2020/10042/)

> Add a new dimension to your tvOS app with SwiftUI. We'll show you how to build layouts powered by SwiftUI and customize your interface with custom buttons, provide more functionality in your app with a context menu, check if views are focused, and manage default focus. To get the most out of this session, you should be comfortable with SwiftUI. For a primer, watch “Introducing SwiftUI: Building Your First App” and “SwiftUI On All Devices.”

5. [Build complications in SwiftUI](https://developer.apple.com/videos/play/wwdc2020/10048/)

> Spice up your graphic complications on Apple Watch using SwiftUI. We'll teach you how to use custom SwiftUI views in complications on watch faces like Meridian and Infograph, look at some best practices when creating your complications, and show you how to preview your work in Xcode 12. To get the most out of this session, you should be familiar with the basics of SwiftUI and building complications on Apple Watch. For an overview, watch “Create Complications for Apple Watch” and read “Building watchOS App Interfaces with SwiftUI.” Once you've discovered how to build graphic complications in SwiftUI, you can combine this with other watchOS 7 features like multiple complications and Face Sharing to create a watch face packed with personality and customized for people who love your app.

6. [Add custom views and modifiers to the Xcode Library](https://developer.apple.com/videos/play/wwdc2020/10649/)

> The Xcode Library is an easy way for you to discover available SwiftUI views and drag and drop them to the Xcode Previews canvas, enabling rich visual editing of your app. We'll show you how to extend the content of the Xcode Library with your own views and modifiers, optimizing for reusability and discoverability within your app or Swift packages. For more on Xcode Previews, check out "Structure your app for SwiftUI previews", and "Visually edit SwiftUI views".

7. [App essentials in SwiftUI](https://developer.apple.com/videos/play/wwdc2020/10037/)

> Thanks to the new App protocol, SwiftUI now supports building entire apps! See how Apps, Scenes, and Views fit together. Learn how easy it is to implement the features people expect from a best-in-class product while saving time and reducing complexity. Easily add expected functionality to your interface using the new commands modifier, and explore the ins and outs of the new WindowGroup API. To get the most out of this session, you should have some experience with SwiftUI. Watch “Introduction to SwiftUI” for a primer. Want more SwiftUI? Take your pick: “What's new in SwiftUI”, “Data essentials in Swift UI ”, "Stacks, grids, and outlines in SwiftUI", and “Build document-based apps in SwiftUI”.

8. [Visually edit SwiftUI views](https://developer.apple.com/videos/play/wwdc2020/10185/)

> Help your apps be the best versions of themselves: Discover how you can leverage Xcode Previews and SwiftUI to quickly iterate upon and improve your app. Find out how you can use the Previews canvas to build your app from the ground up, and view your interface in different environments like Light or Dark mode or with accessibility features like Dynamic Type enabled. To learn more about SwiftUI Previews, check out “Structure your app for SwiftUI previews” and “Add custom views and modifiers to the Xcode Library”.

9. [Build a SwiftUI view in Swift Playgrounds](https://developer.apple.com/videos/play/wwdc2020/10643/)

> Easily prototype and play around with SwiftUI views when you use them with Swift Playgrounds. We'll show you how to build a SwiftUI view in a Xcode-compatible playground, and explore tools to help you easily edit and preview your code. For more on Swift Playgrounds, check out our interactive challenge, “Swan's Quest”, and learn to build your own by watching “Create Swift Playgrounds Content for iPad and Mac”.

10. [Build document-based apps in SwiftUI](https://developer.apple.com/videos/play/wwdc2020/10039/)

> Learn how to build a document-based app entirely in SwiftUI! We'll walk you through the DocumentGroup API and how it composes with your App and Scenes, allowing you to add out-of-the-box support for document management — such as document browsing and standard commands — no heavy lifting required. You'll learn to set up Universal Type Identifiers as well as gain understanding into what makes a top-notch document-based app. To get the most out of this session, you should first familiarize yourself with building apps in SwiftUI. Check out "App essentials in SwiftUI" to learn more.

11. [Stacks, Grids, and Outlines in SwiftUI](https://developer.apple.com/videos/play/wwdc2020/10031/)

> Display detailed data in your SwiftUI apps more quickly and efficiently with improved stacks and new list and outline views. Now available on iOS and iPadOS for the first time, outlines are a new multi-platform tool for expressing hierarchical data that work alongside stacks and lists. Learn how to use new and improved tools in SwiftUI to display more content on screen when using table views, create smooth-scrolling and responsive stacks, and build out list views for content that needs more than a vStack can provide. Take your layout options even further with the new grid view, as well as disclosure groups. To get the most out of this video, we recommend first checking out “SwiftUI App Essentials,” which provides an overview of everything new in SwiftUI for 2020. If you're brand-new to coding with SwiftUI, we also suggest watching 2019's “SwiftUI Essentials” talk.

12. [Build SwiftUI views for widgets](https://developer.apple.com/videos/play/wwdc2020/10033/)

> Widgets are bite-sized pieces of information from your app that someone can choose to place on their home screen or Today view. Discover the process of building the views for a widget from scratch using SwiftUI. Brush up on the syntax that you'll need for widget-specific construction and learn how to incorporate those commands and customize your widget's interface for a great glanceable experience. To learn more about widgets, be sure to check out "Meet WidgetKit" and "Widgets Code-along".

13. [Data Essentials in SwiftUI](https://developer.apple.com/videos/play/wwdc2020/10040/)

> Data is a complex part of any app, but SwiftUI makes it easy to ensure a smooth, data-driven experience from prototyping to production. Discover @State and @Binding, two powerful tools that can preserve and seamlessly update your Source of Truth. We'll also show you how ObservableObject lets you connect your views to your data model. Learn about some tricky challenges and cool new ways to solve them — directly from the experts! To get the most out of this session, you should be familiar with SwiftUI. Watch “App essentials in SwiftUI” and "Introduction to SwiftUI"

14. [SF Symbols 2](https://developer.apple.com/videos/play/wwdc2020/10207/)

> SF Symbols make it easy to adopt high-quality, Apple-designed symbols created to look great with San Francisco, the system font for all Apple platforms. Discover how you can use SF Symbols in AppKit, UIKit, and SwiftUI. Learn how to work with SF Symbols in common design tools and how to use them in code. And we'll walk you through the latest updates, including additions to the repertoire, alignment improvements, changes with right-to-left localization, and multicolor symbols. This session focuses on the latest features in SF Symbols 2. While not required, we recommend watching "Introducing SF Symbols" from WWDC19. If you're planning to incorporate symbol assets into SwiftUI, you may also benefit from watching “Building Custom Views with SwiftUI."

15. [Structure your app for SwiftUI previews](https://developer.apple.com/videos/play/wwdc2020/10149/)

> When you use SwiftUI previews during development, you can quickly create apps that are more flexible and maintainable. Discover ways to improve the preview experience by making small tweaks to your project. Find out how to preview multiple files at once, how to manage data flow for previews, and how to use sample data while previewing. We'll also give you strategies for defining view inputs to make them more previewable and testable. To get the most out of this session, you should have some familiarity with SwiftUI. For an introduction to interacting with SwiftUI previews in Xcode, check out "Visually Edit SwiftUI Views" from WWDC20.

16. [Accessibility in SwiftUI](https://developer.apple.com/videos/play/wwdc2019/238/)

> Making your app accessible is critical, but just as important is designing a fantastic accessibility experience. Learn what makes a great experience and how to make your app understandable, navigable, and interactable. SwiftUI builds accessibility into your app for you! Discover how much you get with no extra adoption, like accessible images and controls. Identify where you can add supplemental accessibility information with the new SwiftUI Accessibility API, which gives you the tools to add information to elements such as labels, values, and hints.

17. [Data Flow Through SwiftUI](https://developer.apple.com/videos/play/wwdc2019/226/)

> SwiftUI was built from the ground up to let you write beautiful and correct user interfaces free of inconsistencies. Learn how to connect your data as dependencies while keeping the UI fully predictable and error free. Familiarize yourself with SwiftUI's powerful data flow tools and understand what the best tool is for each situation.

18. [Building Custom Views with SwiftUI](https://developer.apple.com/videos/play/wwdc2019/237)

> Learn how to build custom views and controls in SwiftUI with advanced composition, layout, graphics, and animation. See a demo of a high performance, animatable control and watch it made step by step in code. Gain a deeper understanding of the layout system of SwiftUI.

19. [SwiftUI Essentials](https://developer.apple.com/videos/play/wwdc2019/216)

> Take your first deep-dive into building an app with SwiftUI. Learn about Views and how they work. From basic controls to sophisticated containers like lists and navigation stacks, SwiftUI enables the creation of great user interfaces, faster and more easily. See how basic controls like Button are both simple yet versatile. Discover how to compose these pieces into larger, full-featured user interfaces that facilitate building great apps with SwiftUI. Build your SwiftUI skills as you learn the essentials of Apple's new declarative framework.

20. [SwiftUI on watchOS](https://developer.apple.com/videos/play/wwdc2019/219)

> SwiftUI allows a whole new world of possibilities when developing watchOS apps and notifications. From custom animations to providing an intuitive feel with Digital Crown haptics, SwiftUI helps you build exciting and immersive experiences for Apple Watch. See how easy it is to create custom elements with animations, embed gesture-driven animations within notifications, and learn about the enhanced debugging support to make watchOS app development faster than ever.

21. [Integrating SwiftUI](https://developer.apple.com/videos/play/wwdc2019/231)

> SwiftUI is designed to integrate with your existing code base on any of Apple's platforms. Learn how to adopt SwiftUI on any Apple platform by adding SwiftUI views into your app's hierarchy, leveraging your existing data model and more.

22. [Introducing SwiftUI: Building Your First App](https://developer.apple.com/videos/play/wwdc2019/204)

> See SwiftUI in action! Watch as engineers from the SwiftUI team build a fully-functioning app from scratch. Understand the philosophy driving this new framework and learn about the benefits of declarative-style programming. Take a look under the hood to understand how SwiftUI operates and learn how SwiftUI and Xcode 11 work together to help you to build great apps, faster.

## License

Copyright 2020 - 2021 Luan Nguyen

Licensed under the [MIT License](./LICENSE)
