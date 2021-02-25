# Environment

- The environment is an important piece of the puzzle for understanding how SwiftUI functions.

## How the Environment Works

```swift
var body: some View {
    VStack {
        Text("Hello World!")
    }
    .debug()
}
// VStack<Text>
```

```swift
var body: some View {
    VStack {
        Text("Hello World!")
    }
    .font(Font.headline)
    .debug()
}
/*
ModifiedContent<
    VStack<Text>,
    _EnvironmentKeyWritingModi􏰀er<Optional<Font>>
>
*/
```

```swift
var body: some View {
    VStack {
        Text("Hello, world!")
        .transformEnvironment(\.font) {
            dump($0)
        }
    }
    .font(Font.headline)
}
// ...
// - style: SwiftUI.Font.TextStyle.headline
```

```swift
var body: some View {
    VStack {
        Text("Hello World!")
    }
    .environment(\.font, Font.headline)
    .debug()
}
/* ModifiedContent<
    VStack<Text>,
    _EnvironmentKeyWritingModi􏰀er<Optional<Font>>
>
*/
```

## Takeaways

- The environment is used through out all of SwiftUI, and it enables us to write concise code. For example, if we set the font on a VStack, all children inherit that font.

- `@EnvironmentObject` is a built-in way to perform dependency injection (i.e.touse the environment with objects and not just values). But we need to be careful to not forget setting the dependencies.

- The counter part to the environment is the preference system: it’s used to implicitly communicate values up the view tree.
