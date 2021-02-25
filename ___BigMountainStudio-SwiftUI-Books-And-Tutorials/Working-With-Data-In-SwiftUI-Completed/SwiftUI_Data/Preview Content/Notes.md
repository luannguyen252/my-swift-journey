
#  Working with variables
* Some controls can just read variables but it's read-only, like a text view reading a variable. 👍
* Working with nils


# Working with @State
* Intro to property wrappers 👍
* Text views can read from @State - One-way bind 👍
* TextFields can read AND write to @State - Two-way bind 👍
* How to use another struct as your state variable? (@State private var person: Person) 👍
* How to extract subview and pass in a state variable? (@Binding) 👍
* How to preview with @State
* Possible errors? Nils? 


# Working with @Binding
* Passing values to Subviews that the subview can mutate. 👍
* How to preview with @Binding (Binding.constant) 👍
* Possible errors? Nils?


# Working with ObservableObject
* ObservableObject used to be called "BindableObject" during WWDC 2019
* Working with classes instead of structs
* How to use this class in your SwiftUI view? (@ObservedObject) 👍
* Possible errors? Nils?
* onReceive

# Working with @StateObject
* What it is and when to use it 👍
* To pass in or not to pass in data? When to initialize?

# Working with @ObservedObject
* Passing StateObject values to subviews to show or mutate 👍
* How to preview with @ObservedObject 👍
* Possible errors? Nils?

# Working with @AppStorage
* Introduction 👍
* What can be stored? 👍
* How to store a structure?  👍

# Working with @SceneStorage
* How to persist data on a screen when you navigate away and then back to it. (text drafts) 👍


# Working with @EnvironmentObject
* How do you share data with all of your views? 👍
* How can you share data with just your descendant views? 👍
* How to preview views with @EnvironmentObject
* Possible errors? Nils?


# Working with @Published
* Is anyone listening? How to let your audience know about your updates.
* Possible errors? Nils?


# How to trigger data retrieval
* OnAppear?
* Instantiate on view creation?


# How to actually get data from API all the way to a SwiftUI Screen
* Architecture overview
* Making a REST API call
* Decoding the JSON

# Data Events
* onChange
