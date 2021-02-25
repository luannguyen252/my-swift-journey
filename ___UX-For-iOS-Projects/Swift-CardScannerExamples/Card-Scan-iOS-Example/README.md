# CardScan Example Apps for iOS

This repo contains two example apps that show a simple integration for the CardScan library: one using Cocoapods and another using Swift package manager.

## CardScan using Cocoapods

This repo includes a sample Podfile that you can use, all you need to do is to install the CardScan Cocoapod. To test out the example app:

```bash
$ cd CardScanPodExample
$ pod update
$ open CardScanPodExample.xcworkspace
```

## CardScan using Swift Package Manager (SPM)

This repo already set up SPM for the project and configured it to use our main repo `https://github.com/getbouncer/cardscan-ios.git` with a policy for using version `2.0.2 - Next Major`. To test out the example app:

```bash
$ cd CardScanSpmExample
$ open CardScanSpmExample.xcodeproj
```
