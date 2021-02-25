# Layout

- The view layout process has the task of assigning each view in the view tree a position and a size.

- In SwiftUI, the algorithm for this is simple in principle: for the root view in the hierarchy, SwiftUI proposes a size (the available space).

- The view lays itself out within that available space and reports back with its actual size. The container view then aligns the root view in the available space.

```swift
struct ProposedSize {
    var width, height: CGFloat?
}

extension View {
    func layout(in: ProposedSize) -> CGSize {
        // ...
        for child in children {
            child.layout(in: ...)
        }
        // ...
    }
}
```

## Elementary Views

```swift
struct MeasureBehavior<Content: View>: View {
    @State private var width: CGFloat = 100
    @State private var height: CGFloat = 100
    var content: Content

    var body: some View {
        VStack {
            content
            .border(Color.gray)
            .frame(width: width, height: height)
            .border(Color.black)

            Slider(value: $width, in: 0...500)
            Slider(value: $height, in: 0...200)
        }
    }
}
```

## Paths

- A Path is a list of 2D drawing instructions (similar to a CGPath in Cocoa).

- When the layout method on Path is called, it always returns the proposed size as its actual size.

```swift
Path {  p in
    p.move(to: CGPoint(x: 50, y: 0))
    p.addLines([
        CGPoint(x: 100, y: 75),
        CGPoint(x: 0, y: 75),
        CGPoint(x: 50, y: 0)
    ])
}
```

## Shapes

```swift
protocol Shape : Animatable, View {
    func path(in rect: CGRect) -> Path
}
```

- Shapes and paths have some of the most predictable layout behavior.

- Like Path, the layout method on Shape always returns the proposed size as its actual size.

```swift
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { p in
            p.move(to: CGPoint(x: rect.midX, y: rect.minY))
            p.addLines([CGPoint(x: rect.maxX, y: rect.maxY), CGPoint(x: rect.minX, y: rect.maxY), CGPoint(x: rect.midX, y: rect.minY)])
        }
    }
}
```

- A Shape can have modifiers.

```swift
Rectangle()
    .rotation(.degrees(45))
    .fill(Color.red)
```

```swift
Rectangle()
    .rotation(.degrees(45))
    .fill(Color.red)
    .border(Color.blue)
    .frame(width: 100, height: 100)
```

## Images

- By default, Image views have a fixed size — namely the size of the image in points. This means that the image view’s layout method ignores the size proposed by the layout system and always returns the image’s size.

```swift
let image = Image(systemName: "ellipsis")
HStack {
    image
    image.resizable()
    image.resizable().aspectRatio(contentMode: .fit)
}
```

## Text

- A Text view’s layout method always tries to fit its contents in the proposed size, and it returns the bounding box of the rendered text as its result.

- `fixedSize` proposes `nil` as the size, and the text view becomes its ideal size.

- `lineLimit` specifies the maximum number of lines.

- `minimumScaleFactor` allows `Text` to be rendered at a smaller font size (if the text doesn’t fit).

- `truncationMode` determines the truncation behavior, i.e. whether the beginning, middle, or end is truncated.

---

# Layout Modifiers

The layout of views is influenced by modifiers: these are wrapper views that change layout behavior, although they’re typically defined as extension methods on the View protocol.

## Frame

- There are two versions of the `.frame` modifier: one to specify fixed-size frames, and the other to specify flexible frames.

```swift
Text("Hello, world").frame(width: 100)
```

```swift
func layout(in proposed: ProposedSize) -> CGSize {
    let proposedWidth = width ?? proposed.width
    let proposedHeight = height ?? proposed.height
    let proposedChildSize = ProposedSize(width: width, height: height)
    let childSize = child.layout(proposedSize: proposedChildSize)
    return CGSize(width: width ?? childSize.width, height: height ?? childSize.height)
}
```

```swift
struct Knob: View {
    var body: some View {
        KnobShape()
        .frame(width: 32, height: 32)
    }

    func resizable() -> some View {
        KnobShape()
        .aspectRatio(1, contentMode: .fit)
        .frame(idealWidth: 32, idealHeight: 32)
    }
}
```

## Padding

- The padding modifier is one of the simplest around.

- We can specify the padding per edge (`top`, `bottom`, `leading`, and `trailing`).

## Overlay and Background

- The overlay and background modifiers are important parts of the layout system as well.

```swift
extension Overlay {
    func layout(in proposedSize: ProposedSize) -> CGSize {
        let backgroundSize = background.layout(proposedSize: proposedSize) _ = foreground.layout(proposedSize: ProposedSize(backgroundSize))
        // ...
        return backgroundSize
    }
}
```

```swift
Text("Hello").background(
    Capsule()
        .stroke()
        .padding(-5)
    )
```

```swift
Text("Hello, World!")
    .foregroundColor(.white)
    .background(Circle().fill(Color.blue))
```

```swift
Circle()
    .fill(Color.blue)
    .overlay(Text("Start")
    .foregroundColor(.white))
    .frame(width: 75, height: 75)
```

```swift
Circle()
    .fill(Color.blue)
    .overlay(Circle().strokeBorder(Color.white).padding(3))
    .overlay(Text("Start")
    .foregroundColor(.white))
    .frame(width: 75, height: 75)
```

## Drawing Modifiers

- SwiftUI has some more view modifiers that might seem like layout modifiers at first, but that actually don’t impact the layout

## Offset

- The offset modifier causes a view to be drawn at a different position onscreen (given by the horizontal and vertical offset) without affecting the view layout.

- We found offset to be especially useful during animations and interactions.

```swift
HStack {
    Circle().fill(Color.red)
    Circle().fill(Color.blue)
        .offset(y: -30)
    Circle().fill(Color.green)
}
.frame(width: 200, height: 60)
.border(Color.black)
```

## Matched Geometry Effect

A matchedGeometryEffect is used to give one or more views the same geometry properties as a single source view.

```swift
struct Sample: View {
    @Namespace var ns

    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.black)
                .frame(width: 100, height: 100)
                .matchedGeometryEffect(id: "ID", in: ns, isSource: true)
            Circle()
            .fill(Color.gray)
            .matchedGeometryEffect(id: "ID", in: ns, isSource: false)
            .border(Color.green)
        }
        .frame(width: 300, height: 100)
        .border(Color.black)
    }
}
```

## Clipping and Masking

- Clipping and masking can be helpful in combination with the modifiers.

- `.clipped()` the view is clipped to its bounding rectangle.

```swift
Rectangle()
    .rotation(.degrees(45))
    .fill(Color.red)
    .clipped()
    .frame(width: 100, height: 100)
```

- What sets mask apart from clipped is that mask takes any view and uses it to mask the underlying view.

## Stack Views

- In SwiftUI, stack views are an essential mechanism for building up complex layouts from individual views.

- Stack views come in three different flavors: they can lay out views horizontally (HStack), vertically (VStack), or on top of each other (ZStack).

```swift
HStack {
    Text("Hello, World")
    Rectangle()
        .fill(Color.red)
        .frame(minWidth: 200)
}
```

## Layout Priorities

There is one more way to control the layout of a stack: through layout priorities.

```swift
HStack(spacing: 0) {
    Text(longPath)
        .truncationMode(.middle)
        .lineLimit(1)
    Text("chapter1.md")
        .layoutPriority(1)
}
```

```swift
HStack(spacing: 0) {
    Rectangle()
        .fill(Color.red)
        .frame(minWidth: 50)
    Rectangle()
        .fill(Color.blue)
        .frame(maxWidth: 100)
        .layoutPriority(1)
    }
    .frame(width: 75)
```

- `.frame(width: 75)` for `Rectangle().layoutPriority(1)`

## Stack Alignment

- `HStack` specify `.center`, `.top`, `.bottom`

- `VStack` specify `.leading`, `.center`, `.trailing`

- `ZStack`

## Custom Alignment

- We can also create custom alignment guides or modify the behavior of alignment guides for individual views.

```swift
enum MyCenterID: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        return context.height / 2
    }
}
```

```swift
extension VerticalAlignment {
    static let myCenter: VerticalAlignment = VerticalAlignment(MyCenterID.self)
}
```

```swift
HStack(alignment: .myCenter) {
    Rectangle()
        .fill(Color.blue)
        .frame(width: 50, height: 50)
    Rectangle()
        .fill(Color.green)
        .frame(width: 30, height: 30)
}
```

```swift
HStack(alignment: .myCenter) {
    Rectangle()
        .fill(Color.blue)
        .frame(width: 50, height: 50)
    Rectangle()
        .fill(Color.green)
        .frame(width: 30, height: 30)
    Rectangle()
        .fill(Color.red)
        .frame(width: 40, height: 40)
        .alignmentGuide(.myCenter, computeValue: { dim in
            return dim[.myCenter] - 20 })
    }
    .border(Color.black)
```

## Grid Views

- Grid views come in two flavors for the two layout directions: `LazyHGrid` and `LazyVGrid`.

- There are three different kinds of columns available:
  - `Fixed` columns have a fixed width that will always be honored regardless of the available space.
  - `Flexible` columns can be come any width between the specified minimum and maximum values.
  - `Adaptive` columns are essentially flexible columns that can contain multiple items, and which specify the minimum and maximum widths of the individual items.

```swift
LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
    ForEach(items.indices) { idx in
        items[idx].frame(height: 50)
    }
}
.frame(width: 400)
```

- SwiftUI will fit as many items as possible into an adaptive column. In other words, it tends to pick the smallest possible width for the items (constrained by the minimum specified for the adaptive column).

- Without specifying any spacing explicitly, the grid will use the default spacing between rows, as well as default spacing between the items within the adaptive column. Spacing after each item in a row can be adjusted in the GridItem initializer.

- Note that the minimum value of an adaptive column does not specify the minimum width of the adaptive column itself. Adaptive columns always contain at least one item, even if there’s not enough space available for the adaptive column to honor the minimum item width.

```swift

LazyVGrid(columns: [
    GridItem(.flexible(minimum: 100)),
    GridItem(.flexible(minimum: 250)),
]) {
    ForEach(items.indices) { idx in
        items[idx].measured.frame(height: 50)
    }
}
.frame(width: 300) .border(Color.black)
```

- SwiftUI doesn’t treat the minimum and maximum widths of the columns as constraints that are guaranteed to be satisfied simultaneously if possible (as would be the case for UIKit’s auto layout constraints).

```swift
LazyVGrid(columns: [
    GridItem(.flexible(minimum: 100)),
    GridItem(.adaptive(minimum: 40)),
    GridItem(.flexible(minimum: 180)),
]) {
    ForEach(items3.indices) { idx in
        items3[idx].measured.frame(height: 50)
    }
}
.frame(width: 300) .border(Color.black)
```

## Safe Grid Layouts

- The aspect of the grid’s layout algorithm that can result in the most surprising behavior is that the column widths are being calculated twice.

- Flexible columns are trickier, especially if you apply minimum widths that might lead to a grid larger than its proposed width. On the other hand, flexible columns with a maximum width only are safe, since they cannot result in the grid rendering out of bounds unexpectedly.

## Organizing Layout Code

There are many options for organizing view layout code: we could create new View structs, write extensions on View, or create a ViewModifier.

```swift
extension View {
    func circle(foreground: Color = .white, background: Color = .blue) -> some View {
        Circle()
            .fill(background)
            .overlay(Circle().strokeBorder(foreground).padding(3))
            .overlay(self.foregroundColor(foreground))
            .frame(width: 75, height: 75)
    }
}
```

```swift
Text("Hello")
    .circle(foreground: .white, background: .gray)
```

We also could have written this as a custom View struct instead.

```swift
struct CircleWrapper<Content: View>: View {
    var foreground, background: Color
    var content: Content

    init(foreground: Color = .white, background: Color = .blue,
        @ViewBuilder content: () -> Content) {
            self.foreground = foreground
            self.background = background
            self.content = content()
        }

    var body: some View {
        Circle()
            .fill(background)
            .overlay(Circle().strokeBorder(foreground).padding(3))
            .overlay(content.foregroundColor(foreground))
            .frame(width: 75, height: 75)
        }
    }
```

```swift
CircleWrapper {
    Text("Hello")
}
```

There is a third option as well: we can create a ViewModi􏰀er.

```swift
struct CircleModifier: ViewModifier {
    var foreground = Color.white
    var background = Color.blue

    func body(content: Content) -> some View {
        Circle()
            .fill(background)
            .overlay(Circle().strokeBorder(foreground).padding(3))
            .overlay(content.foregroundColor(foreground)) .frame(width: 75, height: 75)
} }
```

```swift
Text("Hello").modifier(CircleModifier())
```

## Styling Buttons

```swift
struct CircleStyle: ButtonStyle {
    var foreground = Color.white
    var background = Color.blue

    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        Circle()
            .fill(background.opacity(con􏰀guration.isPressed ? 0.8 : 1))
            .overlay(Circle().strokeBorder(foreground).padding(3))
            .overlay(configuration.label.foregroundColor(foreground))
            .frame(width: 75, height: 75)
        }
    }
```

```swift
Button("Button", action: {}).buttonStyle(CircleStyle())
```

Another advantage of buttonStyle is that we can style multiple buttons at once.

```swift
HStack {
    Button("One", action: {})
    Button("Two", action: {})
    Button("Three", action: {})
}.buttonStyle(CircleStyle())
```

## Takeaways

- SwiftUI’s layout process operates top-down: the parent view proposes a size to its children, which in turn lay themselves out within this proposed size and return the actual size they need.

- The relationship between the proposed size and the actual size differs between views. For example, shapes and image views always use the entire proposed size, whereas text views only take as much space as they need to fit the content.

- Layout modifiers like `.frame` and `.padding` can be used to adjust the layout. Other modifiers, like `.offset` and `.rotation`, affect the drawing of the views but not the layout.

- Stack views are a common method for building complex layouts from individual views. We can customize their behavior with layout priorities and alignment guides.

- We should factor out common view code in extensions, custom views, or modifiers.
