# Model View ViewModel (MVVM)

[SwiftUI 2.0: MVVM - A Practical Approach](https://www.youtube.com/watch?v=LntH6moCuo0)
[SwiftUI MVVM | A Realistic Example](https://www.youtube.com/watch?v=bdqEcpppAMc)
[SwiftUI MVVM Programming with ObservableObject @Published @ObservedObject](https://www.youtube.com/watch?v=1IlUBHvgY8Q)
[SwiftUI MVVM Design Pattern - SwiftUI Tutorials](https://www.youtube.com/watch?v=mRk0F1Ii718)

- Preferred Architectural Design Paradigm for SwiftUI Projects
- Improves Code Organization
- Different from MVC

## What is the Idea behind MVVM?

`Model`:

- Data and Logic
- Source of Truth

```swift
struct Person {
    let name: String
    var age: Int
}
```

`View`:

- Everything visible on screen
- Wants to display the Source of Truth

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

`ViewModel`:

- Interpreter
- Glue between Model and View
- Processes Intents
