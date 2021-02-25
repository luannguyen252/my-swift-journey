# Fruta: Building a Feature-Rich App with SwiftUI

Create a shared codebase to build a multiplatform app that offers widgets and an App Clip.


## Overview

- Note: This sample project is associated with WWDC 2020 sessions [10637: Platforms State of the Union](https://developer.apple.com/wwdc20/10637/), [10146: Configure and Link Your App Clips](https://developer.apple.com/wwdc20/10146/), [10120: Streamline Your App Clip](https://developer.apple.com/wwdc20/10120/), [10118: Create App Clips for Other Businesses](https://developer.apple.com/wwdc20/10118/), [10096: Explore Packages and Projects with Xcode Playgrounds](https://developer.apple.com/wwdc20/10096/), and [10028: Meet WidgetKit](https://developer.apple.com/wwdc20/10028/).

The Fruta sample app builds an app for macOS, iOS, and iPadOS that implements [SwiftUI](https://developer.apple.com/documentation/swiftui) platform features like widgets or App Clips. Users can order smoothies, save favorite drinks, collect rewards, and browse recipes.

The sample app’s Xcode project includes widget extensions that enable users to add a widget to their iOS Home screen or the macOS Notification Center and view their rewards or a favorite smoothie. The Xcode project also includes an App Clip target. With the App Clip, users can discover and instantly launch some of the app's functionality on their iPhone or iPad without installing the full app.

The Fruta sample app leverages [Sign in with Apple](https://developer.apple.com/documentation/sign_in_with_apple) and [Apple Pay](https://developer.apple.com/documentation/passkit) to provide a streamlined user experience, and promotes code reuse by bundling shared code and localized assets as [Swift Packages](https://developer.apple.com/documentation/swift_packages).

- Important: This update to the Fruta sample has the following known issues related to how the ingredient card renders. On macOS the ingredient card sometimes appears at a reduced size, and on iOS the ingredient card sometimes disappears when tapped rather than appearing at full-size.

## Configure the Sample Code Project

This project requires Xcode 12.5 or later. To build this project:

* Set the iOS runtime requirement to iOS 14.5 or later
* Set the macOS runtime requirement to macOS Big Sur 11.3 or later

And follow these steps:

1. To run on your devices, including on macOS, set your team in the targets’ Signing & Capabilities panes. Xcode manages the provisioning profiles for you.
2. To run on an iOS or iPadOS device, open the `iOSClip.entitlements` file and update the value of the [Parent Application Identifiers Entitlement](https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_developer_parent-application-identifiers) to match the iOS app's bundle identifier.
3. Make a note of the App Group name suffix on the iOS target's Signing and Capabilities tab in Project Settings. Append this value to the App Group name string in line 27 of `FrutaModel.swift` so it's identical to that on the Signing and Capabilities tab.
4. To enable the in-app-purchase flow, edit the Fruta iOS "Run" scheme, and select `Configuration.storekit` for StoreKit Configuration.
5. The Xcode project includes playgrounds that are configured to run on iOS. To change a playground’s platform, select it in the Project navigator, open the File inspector, and select the desired platform. Next, select the scheme that matches the platform before you build and run the playground.

## Create a Shared Codebase in SwiftUI

To create a single app definition that works for multiple platforms, the project defines a structure that conforms to the [App](https://developer.apple.com/documentation/swiftui/app) protocol. Because the `@main` attribute precedes the structure definition, the system recognizes the structure as the entry point into the app. Its computed body property returns a [WindowGroup](https://developer.apple.com/documentation/swiftui/windowgroup) scene that contains the view hierarchy displayed by the app to the user. SwiftUI manages the presentation of the scene and its contents in a platform-appropriate manner.

``` swift
@main
struct FrutaApp: App {
    @StateObject private var model = FrutaModel()
    @StateObject private var store = Store()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
                .environmentObject(store)
        }
        .commands {
            SidebarCommands()
        }
    }
}
```
[View in Source](x-source-tag://SingleAppDefinitionTag)

For more information, see [App Structure and Behavior](https://developer.apple.com/documentation/swiftui/app-structure-and-behavior).

## Offer an App Clip 

On iOS and iPadOS, the Fruta app offers some of its functionality to users who don't have the full app installed as an App Clip. The app's Xcode project contains an App Clip target, and, instead of duplicating code, reuses code that’s shared across all platforms to build the App Clip. In shared code, the project makes use of the Active Compilation Condition build setting to exclude code for targets that don't define the `APPCLIP` value. For example, only the App Clip target presents an App Store overlay to prompt the user to get the full app.

``` swift
VStack(spacing: 0) {
    Spacer()
    
    orderStatusCard
    
    Spacer()
    
    if presentingBottomBanner {
        bottomBanner
    }
    
    #if APPCLIP
    Text("App Store Overlay")
        .hidden()
        .appStoreOverlay(isPresented: $presentingAppStoreOverlay) {
            SKOverlay.AppClipConfiguration(position: .bottom)
        }
    #endif
}
.onChange(of: model.hasAccount) { _ in
    #if APPCLIP
    if model.hasAccount {
        presentingAppStoreOverlay = true
    }
    #endif
}
```
[View in Source](x-source-tag://ActiveCompilationConditionTag)

For more information, see [Creating an App Clip with Xcode](https://developer.apple.com/documentation/app_clips/creating_an_app_clip_with_xcode) and [Choosing the Right Functionality for Your App Clip](https://developer.apple.com/documentation/app_clips/choosing_the_right_functionality_for_your_app_clip).

## Create a Widget

To allow users to see some of the app's content as a widget on their iOS Home screen or in the macOS Notification Center, the Xcode project contains targets for widget extensions. Both use code that’s shared across all targets.

For more information, see [WidgetKit](https://developer.apple.com/documentation/widgetkit).
