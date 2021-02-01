# ShimmerView

## Overview

ShimmerView is a SwiftUI implementation of Facebook shimmering effect. It's implemented as a SwiftUI view modifier allowing developers to add shimmering effect to any of SwiftUI View in a single line.

### Preview Samples

![](https://raw.githubusercontent.com/Vidhyadharan-Mohanram/ShimmerView/master/etc/LeftPanel.gif)

## Requirements
- [x] Xcode 11
- [x] Swift 5.1
- [x] iOS 13 or higher.

## Installation
### Swift Package Manager

Select the project in Navigator, go to the Swift Packages tab and add the following url 

```
https://github.com/Vidhyadharan-Mohanram/ShimmerView
```

## Usage
### Initialization

Shimmer effect can to added to any view by adding the view modifier to the view, the simmer view modifier takes an boolean value isActive to display or hide shimmering effect.

```swift
import ShimmerView 

struct MainView : View {
    
    var body: some View {
        Text("Hello World")
            .shimmer(isActive: shouldShimmer)
            .padding()
    }.environmentObject(ShimmerConfig())
    
}
```



## Customization
### ShimmerConfig

`ShimmerConfig` supports the following customizations

```swift
    // color of the background view. Default is #c8c8c8
    public var bgColor: Color
	
    // color of the foreground view. Default is Color.white
    public var fgColor: Color
    
```


## Known Issues

* Shimmers when active causes the simulator and mac OS to stutter. Run the example app in device to prevent stuttering.

## SideMenu
For the Side Menu go to `https://github.com/Vidhyadharan-Mohanram/SideMenu` for more details.
