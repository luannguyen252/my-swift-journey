<img src="https://github.com/heestand-xyz/PixelKit-SwiftUI/blob/main/Assets/Setup/Icon.png?raw=true" height=100>

# PixelKit with SwiftUI

Realtime graphics in [PixelKit](https://github.com/heestand-xyz/PixelKit) with SwiftUI.

> This project uses **Swift 5.4** and needs **Xcode 12.5 beta** or later to build.

## Setup

In Xcode go to File / Swift Packages / Add Package Dependecy... enter the repo url, then specify the **lite** branch:

```
https://github.com/heestand-xyz/PixelKit
```

<img src="https://github.com/heestand-xyz/PixelKit-SwiftUI/blob/main/Assets/Setup/AddRepo.png?raw=true" height=166>

Import SwiftUI and PixelKit:

```swift
import SwiftUI
import PixelKit
```
Note the examples in this repo you need to **Play Previews** so PixelKit can render:

<img src="https://github.com/heestand-xyz/PixelKit-SwiftUI/blob/main/Assets/Setup/PlayPreview.png?raw=true" height=124>

## Color Triangle

<img src="https://github.com/heestand-xyz/PixelKit-SwiftUI/blob/main/Assets/Examples/ColorTriangle.png?raw=true" height=500>

```swift
struct ColorTriangle: View {
    var body: some View {
        LumaColorShiftPIX(hue: 0.5) {
            LumaBlurPIX(radius: 0.25) {
                PolygonPIX()
            } with: {
                GradientPIX()
                    .pixContrast(3.0)
            }
            .pixMultiply(color: .red)
        } with: {
            GradientPIX()
                .pixContrast(3.0)
        }
    }
}
```

## Tilt Shift

<img src="https://github.com/heestand-xyz/PixelKit-SwiftUI/blob/main/Assets/Examples/TiltShift.png?raw=true" height=500>

```swift
struct TiltShift: View {
    var body: some View {
        LumaBlurPIX(radius: 0.1) {
            ImagePIX(named: "City")
                .pixTranslate(y: 0.1)
                .pixExtend(.mirror)
                .pixScaleResolution(placement: .fill)
        } with: {
            GradientPIX(direction: .vertical,
                        colorSteps: [
                            ColorStep(0.0, .white),
                            ColorStep(0.5, .black),
                            ColorStep(1.0, .white),
                        ])
        }
    }
}
```
