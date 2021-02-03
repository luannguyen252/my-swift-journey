# Understanding SwiftUI DSL
### Recreating a SwiftUI hierarchies in vanilla Swift

Complementary repository for article series [**Understanding SwiftUI DSL**]. The following snippets produce identical results (take a look at [`TupleView.swift`] for more).

#### `TupleView`, `ModifiedContent`

```Swift
struct ContentView: View {

   var body: some View {
        HStack {
            Text("Hello")
            Text("world!").bold().padding(-5)
        }
    }
}
```

```Swift
struct ContentView: View {
    
    var body: HStack<TupleView<(Text, ModifiedContent<Text, _PaddingLayout>)>> {
    
        // Text (with modifiers).
        let helloText: Text = Text("Hello")
        let worldText: Text = Text("world!")
        let boldWorldText: Text = worldText.bold()
        let modifiedBoldWorldText: ModifiedContent<Text, _PaddingLayout> =
            boldWorldText.padding(-5) as! ModifiedContent<Text, _PaddingLayout>
        
        // Tuple and tuple view.
        let tuple: (Text, ModifiedContent<Text, _PaddingLayout>) = (helloText, modifiedBoldWorldText)
        let tupleView: TupleView<(Text, ModifiedContent<Text, _PaddingLayout>)> = TupleView(tuple)
                
        // Horizontal stack and its content closure.
        let closure: () -> TupleView<(Text, ModifiedContent<Text, _PaddingLayout>)> = { return tupleView }
        let horizontalStack: HStack<TupleView<(Text, ModifiedContent<Text, _PaddingLayout>)>> = HStack(content: closure)
        
        return horizontalStack
    }
}
```

#### `_ConditionalContent` (`if` statement)

```Swift
struct ContentView: View {

    var showHand = true
    
    var body: some View {
        VStack {
        
            Text("Hello")
            Text("world!").bold()
            
            if showHand
            { Text("👋") }
        }
    }
}
```

```Swift
struct ContentView: View {
    
    var showHand = true
   
    var body: VStack<TupleView<(Text, Text, Optional<Text>)>> {
    
        // Views.
        let helloText: Text = Text("Hello")
        let worldText: Text = Text("world!").bold()
        let optionalHandText: Optional<Text> =
            showHand ? .some(Text("👋")) : .none
       
        // Tuple and vertical stack.
        let tupleView = TupleView((helloText, worldText, optionalHandText))
        return VStack(content: { return tupleView })
    }
}
```

#### `_ConditionalContent` (`switch` statement)

```Swift
struct ContentView: View
{
    
    enum `Type` { case text, image, color, divider, spacer }
    var type: `Type` = .image
    
    var body: some View {
        Group {
            switch type {
            case .text:
                Text("Text")
            case .image:
                Image(systemName: "photo")
            case .color:
                Color.red
            case .divider:
                Divider()
            case .spacer:
                Spacer()
            }
        }
    }
}
```

```Swift
struct ContentView: View {
    
    enum `Type` { case text, image, color, divider, spacer }
    var type: `Type` = .image

    var body: Group<
        _ConditionalContent<
            _ConditionalContent<
                _ConditionalContent<Text, Image>,
                _ConditionalContent<Color, Divider>
            >,
            Spacer
        >
    > {
        return Group {
            switch type {
            case .text:
                return ViewBuilder.buildEither(
                    first: ViewBuilder.buildEither(
                        first: ViewBuilder.buildEither(
                            first: Text("Text")
                        )
                    )
                )
            case .image:
                return ViewBuilder.buildEither(
                    first: ViewBuilder.buildEither(
                        first: ViewBuilder.buildEither(
                            second: Image(systemName: "photo")
                        )
                    )
                )
            case .color:
                return ViewBuilder.buildEither(
                    first: ViewBuilder.buildEither(
                        second: ViewBuilder.buildEither(
                            first: Color.red
                        )
                    )
                )
            case .divider:
                return ViewBuilder.buildEither(
                    first: ViewBuilder.buildEither(
                        second: ViewBuilder.buildEither(
                            second: Divider()
                        )
                    )
                )
            case .spacer:
                return ViewBuilder.buildEither(
                    second: Spacer()
                )
            }
        }
    }
}
```

#### License
> Licensed under the [Open Source MIT license].

[**Understanding SwiftUI DSL**]: http://blog.eppz.eu/understanding-swiftui-dsl-tupleview/
[`TupleView.swift`]: Understanding_SwiftUI_DSL/TupleView.swift
[Open Source MIT license]: http://en.wikipedia.org/wiki/MIT_License
