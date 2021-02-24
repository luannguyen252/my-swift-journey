Usage:

```swift
struct Popup_Previews: PreviewProvider {
    static var previews: some View {
        Color.clear
            .modifier(Popup(isPresented: true, // <--- Add the popup view modifier
                            content: { Color.yellow.frame(width: 100, height: 100) }))
            .previewDevice("iPod touch")
    }
}
```