# SwiftUI Code Snippets

![SwiftUI Code Snippets Location](./SwiftUICodeSnippetsLocation.png "SwiftUI Code Snippets Location")

## ZStack

```swift
ZStack {
    Color("Background")
        .edgesIgnoringSafeArea(.all)

    Text("ZStack Snippets")
        .foregroundColor(Color("Foreground"))
        .font(.largeTitle)
        .fontWeight(.heavy)
}
```

```swift
// 1. Linear Gradient
ZStack {
    LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)

    Text("Linear Gradient")
        .foregroundColor(.white)
        .font(.largeTitle)
        .fontWeight(.heavy)
}

// 2. Radial Gradient
ZStack {
    RadialGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), center: .center, startRadius: 10, endRadius: 620)
        .edgesIgnoringSafeArea(.all)

    Text("Radial Gradient")
        .foregroundColor(.white)
        .font(.largeTitle)
        .fontWeight(.heavy)
}
```
