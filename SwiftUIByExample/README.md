# SwiftUI by Example

## List

```
List {
    ForEach(menu) { section in
        Section(header: Text(section.name)) {
            ForEach(section.items) { item in
                Text(item.name)
            }
        }
    }
}
```

- [Working with lists](https://www.hackingwithswift.com/quick-start/swiftui/working-with-lists)
- [How to create a list of dynamic items](https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-list-of-dynamic-items)
- [How to embed a view in a navigation view](https://www.hackingwithswift.com/quick-start/swiftui/how-to-embed-a-view-in-a-navigation-view)
- [How to create views in a loop using ForEach](https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-views-in-a-loop-using-foreach)
- [How to add sections to a list](https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-sections-to-a-list)
- [How to make a grouped list](https://www.hackingwithswift.com/quick-start/swiftui/how-to-make-a-grouped-list)

## Custom Views

```
HStack {
    Image(item.thumbnailImage)

    VStack(alignment: .leading) {
        Text(item.name)

        Text("$\(item.price)")
    }
}
```

- [How to create and compose custom views](https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-and-compose-custom-views)
- [How to draw images using Image views](https://www.hackingwithswift.com/quick-start/swiftui/how-to-draw-images-using-image-views)
- [How to create stacks using VStack and HStack](https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-stacks-using-vstack-and-hstack)

## Others

- [How to style text views with fonts, colors, line spacing, and more](https://www.hackingwithswift.com/quick-start/swiftui/how-to-style-text-views-with-fonts-colors-line-spacing-and-more)
- [How to clip a view so only part is visible](https://www.hackingwithswift.com/quick-start/swiftui/how-to-clip-a-view-so-only-part-is-visible)
- [How to force views to one side inside a stack using Spacer](https://www.hackingwithswift.com/quick-start/swiftui/how-to-force-views-to-one-side-inside-a-stack-using-spacer)

## Stacks

```
var body: some View {
    VStack {
        ZStack(alignment: .bottomTrailing) {
            Image(item.mainImage)
            Text("Photo: \(item.photoCredit)")
                .padding(4)
                .background(Color.black)
                .font(.caption)
                .foregroundColor(.white)
                .offset(x: -5, y: -5)
        }
        Text(item.description)
            .padding()
        Spacer()
    }
    .navigationBarTitle(Text(item.name), displayMode: .inline)
}
```

- [How to layer views on top of each other using ZStack](https://www.hackingwithswift.com/quick-start/swiftui/how-to-layer-views-on-top-of-each-other-using-zstack)
- [How to adjust the position of a view using its offset](https://www.hackingwithswift.com/quick-start/swiftui/how-to-adjust-the-position-of-a-view-using-its-offset)

## Observable objects, environment objects, and @Published

```
@main
struct iDineApp: App {
    // MARK: - PROPERTIES
    var order = Order()

    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(order)
        }
    }
}
```

```
class Order: ObservableObject {
    @Published var items = [MenuItem]()

    ...
}
```

- [How to use @EnvironmentObject to share data between views](https://www.hackingwithswift.com/quick-start/swiftui/-how-to-use-environmentobject-to-share-data-between-views)
- [What’s the difference between @ObservedObject, @State, and @EnvironmentObject?](https://www.hackingwithswift.com/quick-start/swiftui/whats-the-difference-between-observedobject-state-and-environmentobject)

## Adding items to an order with @EnvironmentObject

- [How to create a tappable button](https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-tappable-button)

## Adding TabView and tabItem()

- [How to embed views in a tab bar using TabView](https://www.hackingwithswift.com/quick-start/swiftui/how-to-embed-views-in-a-tab-bar-using-tabview)

## Bindings and forms

- [Working with state](https://www.hackingwithswift.com/quick-start/swiftui/working-with-state)
- [How to create a picker and read values from it](https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-picker-and-read-values-from-it)]

## Two-way bindings in SwiftUI

- [Working with forms](https://www.hackingwithswift.com/quick-start/swiftui/working-with-forms)
- [Basic form design](https://www.hackingwithswift.com/quick-start/swiftui/basic-form-design)
- [How to create a toggle switch](https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-toggle-switch)
- [How to read text from a TextField](https://www.hackingwithswift.com/quick-start/swiftui/how-to-read-text-from-a-textfield)
- [How to animate changes in binding values](https://www.hackingwithswift.com/quick-start/swiftui/how-to-animate-changes-in-binding-values)
- [How to create a segmented control and read values from it](https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-segmented-control-and-read-values-from-it)

## Formatting interpolated strings in SwiftUI

- [How to format text inside text views](https://www.hackingwithswift.com/quick-start/swiftui/how-to-format-text-inside-text-views)

## Presenting an alert

- [Working with presentations](https://www.hackingwithswift.com/quick-start/swiftui/working-with-presentations)
- [How to show an alert](https://www.hackingwithswift.com/quick-start/swiftui/how-to-show-an-alert)

## Adding swipe to delete and EditButton

- [How to let users delete rows from a list](https://www.hackingwithswift.com/quick-start/swiftui/how-to-let-users-delete-rows-from-a-list)
- [How to enable editing on a list using EditButton](https://www.hackingwithswift.com/quick-start/swiftui/how-to-enable-editing-on-a-list-using-editbutton)
- [Enabling and disabling elements in forms](https://www.hackingwithswift.com/quick-start/swiftui/enabling-and-disabling-elements-in-forms)
