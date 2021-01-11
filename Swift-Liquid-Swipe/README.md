# Swift Liquid Swipe

[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/Cuberto/liquid-swipe/master/LICENSE)
[![CocoaPods](https://img.shields.io/cocoapods/v/liquid-swipe.svg)](http://cocoapods.org/pods/liquid-swipe)
[![Swift 4.2](https://img.shields.io/badge/Swift-4.2-green.svg?style=flat)](https://developer.apple.com/swift/)

![Animation](https://raw.githubusercontent.com/Cuberto/liquid-swipe/master/Screenshots/animation.gif)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 9.3+
- Xcode 10

## Installation

liquid-swipe is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'liquid-swipe'
```
Then run `pod install`.

## Usage

Instantiate `LiquidSwipeContainerController` from storyboard or from code and set properly configured datasource
The data source for a  controller is responsible for providing the content view controllers on demand and must conform to the `LiquidSwipeContainerDataSource`
Container delegate can be used for monitoring conent changes

## Android

Similar library [LiquidSwipe](https://github.com/Cuberto/liquid-swipe-android) by [Cuberto](https://github.com/Cuberto)

## Author

Cuberto Design, info@cuberto.com