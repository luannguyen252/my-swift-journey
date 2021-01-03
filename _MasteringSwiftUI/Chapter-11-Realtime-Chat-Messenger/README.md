# Realtime Chat Messenger – Firebase and SwiftUI

- How to work with realtime databases such as Firebase in SwiftUI
- How to implement a Notification Center and listen to system notifications
- Storing small pieces of data by using UserDefaults

## Firebase

1 - Setup Firebase project

![Setup Firebase project](./Firebase_RealtimeChatMessengerFirebase_1.png "Setup Firebase project")

![Setup Firebase project](./Firebase_RealtimeChatMessengerFirebase_2.png "Setup Firebase project")

![Setup Firebase project](./Firebase_RealtimeChatMessengerFirebase_3.png "Setup Firebase project")

![Setup Firebase project](./Firebase_RealtimeChatMessengerFirebase_4.png "Setup Firebase project")

![Setup Firebase project](./Firebase_RealtimeChatMessengerFirebase_5.png "Setup Firebase project")

![Setup Firebase project](./Firebase_RealtimeChatMessengerFirebase_6.png "Setup Firebase project")

![Setup Firebase project](./Firebase_RealtimeChatMessengerFirebase_7.png "Setup Firebase project")

2 - Setup iOS project

3 - Copy `GoogleService-Info.plist` into project and restart Xcode project

4 - Run `pod init`

5 - Open `Podfile`

```
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'RealtimeChatMessengerFirebase' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for RealtimeChatMessengerFirebase
  pod 'Firebase/Core'
  pod 'Firebase/Storage'
  pod 'Firebase/Auth'
  pod 'Firebase/Database'

end
```

6 - Run `pod install`

7 - Open `RealtimeChatMessengerFirebase.xcworkspace`

## Create Firebase Database

![Create Firebase Database](./CreateFirebaseDatabase-1.png "Create Firebase Database")

![Create Firebase Database](./CreateFirebaseDatabase-2.png "Create Firebase Database")

![Create Firebase Database](./CreateFirebaseDatabase-3.png "Create Firebase Database")

## Our Database Structure

![Our Database Structure](./OurDatabaseStructure-1.png "Our Database Structure")

![Our Database Structure](./OurDatabaseStructure-2.png "Our Database Structure")

## My First Message

![My First Message](./MyFirstMessage_1.png "My First Message")

![My First Message](./MyFirstMessage_2.png "My First Message")

---

![SwiftUI - Chat App - Database - Firebase](./SwiftUIChatAppDatabaseFirebase_1.png "SwiftUI - Chat App - Database - Firebase")

![SwiftUI - Chat App - Database - Firebase](./SwiftUIChatAppDatabaseFirebase_2.png "SwiftUI - Chat App - Database - Firebase")
