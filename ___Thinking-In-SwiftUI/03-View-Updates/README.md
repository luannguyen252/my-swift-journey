# View Updates

- How the view tree gets constructed in SwiftUI

- How the view updated in response to state changes

### Updating the View Tree

- In most object-oriented GUI applications — such as UIKit apps and the Document Object Model (DOM) apps in a browser — there are two view-related code paths: one path handles the initial construction of the views, and the other path updates the views when events happen.

- Due to the separation of these code paths and the manual updating involved, it’s easy to make mistakes: we might update the views in response to an event but forget to update the model, or vice versa.

- In AppKit and UIKit programming, there have been a number of techniques that try to solve this problem. AppKit uses the Cocoa bindings technology, a two-way layer to keep the models and views in sync. In UIKit, people use techniques like reactive programming to (mostly) unify both code paths.

- SwiftUI has been designed to entirely avoid this category of problems. First, there is a single code path that constructs the initial views and is also used for all subsequent updates: the view’s body property. Second, SwiftUI makes it impossible to bypass the normal view update cycle and to modify the view tree directly. Triggering a reevaluation of the body property is the only way to update what’s onscreen in SwiftUI.

### @State and @Binding

```swift
struct LabelView: View {
    @Binding var number: Int

    var body: some View {
        Group {
            if number > 0 {
                Text("You've tapped \(number) times")
            }
        }
    }
}
```

```swift
struct ContentView: View {
    @State var counter = 0

    var body: some View {
        VStack {
            Button("Tap me!") {
                self.counter += 1
            }

            LabelView(number: $counter)
        }
    }
}
```

SwiftUI’s bindings and Cocoa bindings are different technologies that serve a similar purpose. Both SwiftUI and Cocoa provide two-way bindings, but their implementations are very different.

## Dynamic View Trees

SwiftUI has three different mechanisms for building a view tree with dynamic parts:

1. if statements or switch statements in view builders

- if statements and switch statements in view builders are the most restrictive option for dynamically changing what’s onscreen at runtime.

- The branches of an if/else or a switch statement are fully encoded in the type of the view (as `_ConditionalContent`). You can think of an if/else statement as a variant of a switch statement (with one case for true and one case for false).

- It’s clear at compile time that the view onscreen will come from one of the branches of a switch. In other words, if/else and switch allow us to hide or show views at runtime based on a condition, but we have to decide the types of the views at compile time.

- Likewise, an if without an else is encoded as an optional view that only displays when the condition is true. When you have more than two cases in a switch, they get translated to nested `_ConditionalContent` values.

2. ForEach

- Within ForEach, the number of views can change, but they all need to have the same type.

- ForEach is most commonly used with Lists (similar to a table view in UIKit).

- The number of items in a list is often based upon model data and cannot always be known at compile time:

```swift
struct ContentView: View {
    var body: some View {
        ForEach(1...3, id: \.self) { x in
            Text("Item \(x)")
        }
    }
}
```

- ForEach requires each element to be identifiable, it can figure out at runtime (by computing a diff) which views have been added or removed since the last view update.

3. AnyView

- AnyView is a view that can be initialized with any view to erase the wrapped view’s type.

## Efficient View Trees

- SwiftUI relies on static information about the structure of the view tree to perform efficient comparisons of view tree values between updates.

```swift
struct LabelView: View {
    @Binding var counter: Int

    var helper: some View {
        if counter > 0 {
            Text("You've tapped \(counter) times")
            }
        }
    // ...
}
```

- @ViewBuilder:

```swift
struct LabelView: View {
    @Binding var counter: Int

    @ViewBuilder var helper: some View {
        if counter > 0 {
            Text("You've tapped \(counter) times")
            }
        }
    // ...
}
```

## Displaying Data in Views

- The data is a value type (for example, a struct, an enum, or an immutable object)
- Three options: a plain property, a @State property, or a @Binding

## Working with Objects

- When your data is an object, you can conform it to ObservableObject to make sure SwiftUI can subscribe to any changes (we’ll talk more about ObservableObject later).

- There are three property wrappers that work with observable objects:
  - `@ObservedObject` is used when the reference to the object can change
  - `@StateObject` is used when the reference cannot change
  - `@EnvironmentObject` is used when the object is passed through the environment

## Property Wrappers

**@State:**

```swift
struct ContentView: View {
    @State var counter = 0

    var body: some View {
        VStack {
            Button("Tap me!") {
                self.counter += 1
            }
            LabelView(number: $counter)
        }
    }
}
```

If we remove the `@State` prefix, it’s no longer possible to mutate counter inside body, as body is not a mutating function or property.

## State vs. Binding

```swift
struct Knob: View {
    @Binding var value: Double

    var body: some View {
         KnobShape()
            .fill(Color.primary)
            .rotationEffect(Angle(degrees: value * 330))
            .onTapGesture {
                withAnimation(.default) {
                    self.value = self.value < 0.5 ? 1 : 0
                }
            }
    }
}
```

```swift
struct ContentView: View {
    @State var value: Double = 0.5
    @State var knobSize: CGFloat = 0.1

    var body: some View {
        VStack {
            Knob(value: $value)
                .frame(width: 100, height: 100)
            HStack {
                Text("Value")
                Slider(value: $value, in: 0...1)
            }
            HStack {
                Text("Knob Size")
                Slider(value: $knobSize, in: 0...0.4)
            }
            Button("Toggle", action: {
                withAnimation(.default) {
                    self.value = self.value == 0 ? 1 : 0
                }
            })
        }
    }
}
```

## ObservedObject

```swift
struct ContentView: View {
    @State var selection: Contact?

    var body: some View {
        HStack {
            ForEach(contacts) { contact in
                Button(contact.name) {
                    self.selection = contact
                }
            }
        }

        if let c = selection {
            Detail(contact: c)
        }
    }
}
```

```swift
// Define contact using @ObservedObject
struct Detail: View {
    @ObservedObject var contact: Contact

    var body: some View {
        VStack {
            Text(contact.name)
                .bold()
            Text(contact.city)
        }
    }
}
```

```swift
// ObservedObject
final class Contact: ObservableObject, Identifiable {
    let id = UUID()
    @Published var name: String
    @Published var city: String

    init(name: String, city: String) {
        self.name = name
        self.city = city
    }
}

// Contact Data
var contacts = [
    Contact(name: "Luan Nguyen", city: "Hanoi"),
    Contact(name: "Steve Jobs", city: "San Francisco"),
    Contact(name: "Tim Cook", city: "Florida"),
]
```

If we forget the `@ObservedObject` prefix, our code will mostly still work: we can access the object’s properties and call methods on it. However, SwiftUI will not subscribe to the objectWillChange notifications, and views will not get rerendered when the state changes.

## Optimizing Observed Objects

- When creating observed objects, keep in mind that they will be created on view construction.

- As views can be created and recreated many times during the lifetime of an app, recreating observed objects can become a performance issue.

## Takeaways

- With SwiftUI, we can’t manipulate the view tree directly. Instead, we change state, which causes the view tree to be reevaluated.

- The most commonly used state property wrappersare `@State`, `@Binding`, and `@ObservedObject`. They’re used to trigger view updates in response to state changes.

- We need to access state properties withi naview’s body to specify the view tree that matches the current state.

- Large parts of the view tree, and not just the parts that are currently on screen, are constructed upfront. Therefore, we must avoid doing expensive or unnecessary work on view construction.
