# Animated Splash Screen

> Build an animated splash screen with SwiftUI.

![Animated Splash Screen 1](./AnimatedSplashScreen_1.png "Animated Splash Screen 1")

![Animated Splash Screen 2](./AnimatedSplashScreen_2.png "Animated Splash Screen 2")

![Animated Splash Screen 3](./AnimatedSplashScreen_3.png "Animated Splash Screen 3")

![Animated Splash Screen 4](./AnimatedSplashScreen_4.png "Animated Splash Screen 4")

---

- SwiftUI Lottie Animation
- SwiftUI Animation
- SwiftUI Podfile
- SwiftUI HStack, VStack, ZStack
- SwiftUI TextView
- SwiftUI Button
- SwiftUI Rectangle
- SwiftUI Divider
- SwiftUI Spacer
- Xcode 12 Cocoapods

---

## Install Pod

- Run: `sudo gem install -n /usr/local/bin cocoapods`

- Go to project: `cd <my-project>`

- Run: `pod init`

- Open Podfile: `open podfile`

- Add [lotti-ios](https://github.com/airbnb/lottie-ios) to your podfile: `pod 'lottie-ios'`

```
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'AnimatedSplashScreen' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

pod 'lottie-ios'

  # Pods for AnimatedSplashScreen

end
```

- Run install Podfile: `pod install`

## Fix bug Podfile

Automatically assigning platform `iOS` with version `14.0` on target `AnimatedSplashScreen` because no platform was specified. Please specify a platform for this target in your Podfile. See `https://guides.cocoapods.org/syntax/podfile.html#platform`.

Remove `# platform :ios, '9.0'` to `platform :ios, '9.0'`

## Fix no such module

Open `.xcworkspace` instead `.xcodeproj`
