# Custom Layout

## Geometry Readers

A GeometryReader is configured with a ViewBuilder (just like any other container view), but unlike other containers, the view builder for a geometry reader receives a parameter: the GeometryProxy.

```swift
GeometryReader { proxy in
    Rectangle()
        .fill(Color.red)
        .frame(width: proxy.size.width/3)
    }
```

```swift
Circle()
    .fill(Color.blue)
    .overlay(Circle().strokeBorder(Color.white).padding(3))
    .overlay(Text("Start").foregroundColor(.white))
    .frame(width: 75, height: 75)
```

```swift
Text("Start")
    .foregroundColor(.white)
    .padding(10)
    .background(
        GeometryReader { proxy in
            Circle()
                .fill(Color.blue)
                .frame(width: proxy.size.width, height: proxy.size.width)
                })
```

## Preferences and GeometryReaders

- Using preferences, we can communicate values up the view tree, from views to their ancestors.

- Preferences are set using keys and values, and views can set a value for a specific preference key.

- Using the PreferenceKey protocol, we can define our own preference keys.

```swift
struct WidthKey: PreferenceKey {
    static let defaultValue: CGFloat? = nil
    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        value = value ?? nextValue()
    }
}
```

```swift
Text("Hello, world")
    .background(GeometryReader { proxy in
        Color.clear.preference(key: WidthKey.self, value: proxy.size.width)
    })
```

```swift
struct TextWithCircle: View {
    @State private var width: CGFloat? = nil

    var body: some View {
        Text("Hello, world")
            .background(GeometryReader { proxy in
                Color.clear.preference(key: WidthKey.self, value: proxy.size.width)
            })
            .onPreferenceChange(WidthKey.self) { self.width = $0 }
        }
    }
```

```swift
struct TextWithCircle: View {
    @State private var width: CGFloat? = nil

    var body: some View {
        Text("Hello, world")
            .background(GeometryReader { proxy in
                Color.clear.preference(key: WidthKey.self, value: proxy.size.width)
            })
            .onPreferenceChange(WidthKey.self) {
                self.width = $0
            }
            .frame(width: width, height: width)
            .background(Circle().fill(Color.blue))
        }
    }
```

## Anchors

- Anchors are helpful when passing points and rectangles between different parts of the layout hierarchy.

- An anchor is a wrapper around a value (for example, a point) that can be resolved inside the coordinate system of a different view somewhere else in the view hierarchy.

```swift
struct BoundsKey: PreferenceKey {
    static var defaultValue: Anchor<CGRect>? = nil
    static func reduce(value: inout Anchor<CGRect>?, nextValue: () -> Anchor<CGRect>?) {
        value = value ?? nextValue()
    }
}
```

```swift
struct ContentView: View {
    let tabs: [Text] = [Text("World Clock"), Text("Alarm"), Text("Bedtime")]
    @State var selectedTabIndex = 0

    var body: some View {
        HStack {
            ForEach(tabs.indices) { tabIndex in
                Button(action: {
                    self.selectedTabIndex = tabIndex
                    },
                    label: {
                        self.tabs[tabIndex]
                    })
                    .anchorPreference(key: BoundsKey.self, value: .bounds, transform: { anchor in
                    self.selectedTabIndex == tabIndex ? anchor : nil
                })
            }
        }
    }
}
```

```swift
.overlayPreferenceValue(BoundsKey.self, { anchor in
    GeometryReader { proxy in
        Rectangle()
            .fill(Color.accentColor)
            .frame(width: proxy[anchor!].width, height: 2)
            .offset(x: proxy[anchor!].minX)
        }
    })
```

```swift
// ...
Rectangle()
    .fill(Color.blue)
    .frame(width: proxy[anchor!].width, height: 2)
    .offset(x: proxy[anchor!].minX)
    .frame(width: proxy.size.width, height: proxy.size.height, alignment: .bottomLeading)
    .animation(.default)
```

## Alternative Implementation

We can use a `matchedGeometryEffect` to let SwiftUI do the work of matching the geometry of the selection line to the geometry of the button — all without using anchors and preferences ourselves.

```swift
HStack {
    ForEach(tabs.indices) { tabIndex in
    Button(self.tabs[tabIndex]) {
        withAnimation(.default) {
            self.selectedTabIndex = tabIndex
        }
    }
    .matchedGeometryEffect(id: tabIndex, in: ns) }
}
```

```swift
...
.overlay(
    Rectangle()
        .fill(Color.accentColor)
        .frame(height: 2, alignment: .bottom)
        .matchedGeometryEffect(id: selectedTabIndex, in: ns, isSource: false)
    )
```

## Custom Layouts

With geometry readers, anchors, and preferences, we have all the building blocks in place to create more complex custom layouts. As an example, we’ll build a custom layout container — a stack that can lay itself out either horizontally or vertically.

```swift
struct CollectSizePreference: PreferenceKey {
    static let defaultValue: [Int: CGSize] = [:]
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}
```

```swift
struct CollectSize: ViewModifier {
    var index: Int

    func body(content: Content) -> some View {
        content.background(GeometryReader { proxy in
        Color.clear.preference(
            key: CollectSizePreference.self,
            value: [self.index: proxy.size])
        })
    }
}
```

```swift
struct Stack<Element, Content: View>: View {
    var elements: [Element]
    var spacing: CGFloat = 8
    var axis: Axis = .horizontal
    var alignment: Alignment = .topLeading var content: (Element) -> Content

    @State private var offsets: [CGPoint] = []
}
```

```swift
struct Stack<Element, Content: View>: View {
    // ...
    var body: some View {
        ZStack(alignment: alignment) {
            // ...
        }
        .onPreferenceChange(CollectSizePreference.self, perform: self.computeOffsets)
    }
}
```

```swift
private func computeOffsets(sizes: [Int: CGSize]) {
    guard !sizes.isEmpty else { return }

    var offsets: [CGPoint] = [.zero]

    for idx in 0..<self.elements.count {
        guard let size = sizes[idx] else { fatalError() }
        var newPoint = offsets.last!
        newPoint.x += size.width + self.spacing
        newPoint.y += size.height + self.spacing
        offsets.append(newPoint)
    }
    self.offsets = offsets
}
```

```swift
private func offset(at index: Int) -> CGPoint {
    guard index < offsets.endIndex else { return .zero }
    return offsets[index]
}
```

```swift
var body: some View {
    ZStack(alignment: alignment) {
        ForEach(elements.indices, content: { idx in
        self.content(self.elements[idx])
            .modifier(CollectSize(index: idx))
            .alignmentGuide(self.alignment.horizontal, computeValue: {
                self.axis == .horizontal ? -self.offset(at: idx).x : $0[self.alignment.horizontal]
            })
            .alignmentGuide(self.alignment.vertical, computeValue: {
                self.axis == .vertical ? -self.offset(at: idx).y : $0[self.alignment.vertical]
            })
        })
    }
    .onPreferenceChange(CollectSizePreference.self, perform: self.computeOffsets)
}
```

```swift
struct ContentView: View {
    let colors: [(Color, CGFloat)] = [(.red, 50), (.green, 30), (.blue, 75)]
    @State var horizontal: Bool = true

    var body: some View {
        VStack {
            Button(action: {
                withAnimation(.default) {
                    self.horizontal.toggle()
                    }
                }) {
                    Text("Toggle axis")
                }

            Stack(elements: colors, axis: horizontal ? .horizontal : .vertical) { item in Rectangle()
                .fill(item.0)
                .frame(width: item.1, height: item.1)
            }
            .border(Color.black)
        }
    }
}
```

## Takeaways

- Use a GeometryReader in any view's background to hook into the layout process and read the proposed size of the view.

- To propagate this size up the view hierarchy, set a preference value using `Color.clear.preference(...)`.

- To modify a view's state based on this preference value, use `onPreferenceChange` to observe it.

- To read a view's geometry data within another view's coordinate system, setan anchor preference via the `anchorPreference` API.

- Anchor preferences can be read using the `overlayPreferenceValue` or `backgroundPreferenceValue` methods, within which we create a geometry reader to resolve the anchor in the target coordinate system.
