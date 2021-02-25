import SwiftUI

/// https://developer.apple.com/videos/play/wwdc2020/10205/ - Design with iOS pickers, menus and actions

struct ColorPickerExample: View {
    // Using the Color Picker
    @State var color = Color.blue
    
    var body: some View {
        ColorPicker("Pick color", selection: $color)
        
        // Disable Opacity
        ColorPicker("Pick color", selection: $color, supportsOpacity: false)
    }
}

/*
 struct ContentView: View {
     @State var color = Color.blue
     @State var color2 = Color.purple

     var body: some View {
         VStack {
             ColorPicker("Color 1", selection: $color)
             ColorPicker("Color 2", selection: $color2)
             RoundedRectangle(cornerRadius: 30)
                 .fill(LinearGradient(gradient: Gradient(colors: [color, color2]), startPoint: .topLeading, endPoint: .bottomTrailing))
         }
         .padding()
     }
 }
 */

#if DEBUG
struct ColorPickerExample_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerExample()
    }
}
#endif
