import SwiftUI

/// https://developer.apple.com/videos/play/wwdc2020/10031/ - Stacks, Grids, and Outlines in SwiftUI

// Adaptive LazyVGrid
/*
 LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
     ForEach(0 ..< 20) { item in
         Rectangle()
             .frame(height: 100)
     }
 }
 */

// Grid and Item Spacing
/*
 LazyVGrid(
     columns: [GridItem(.adaptive(minimum: 80), spacing: 16)],
     spacing: 16) {

     ForEach(0 ..< 12) { item in
         RoundedRectangle(cornerRadius: 10)
             .fill(Color.blue)
             .frame(height: 100)
     }
 }
 .padding()
 */

// LazyHGrid
/*
 LazyHGrid(
     rows: [GridItem(.adaptive(minimum: 80), spacing: 16)],
     spacing: 12) {

     ForEach(0 ..< 20) { item in
         Rectangle().frame(width: 100)
     }
 }
 
 ScrollView(.horizontal) {
     LazyHGrid(
         rows: [GridItem(.adaptive(minimum: 80), spacing: 8)],
         spacing: 12) {

         ForEach(0 ..< 20) { item in
             Rectangle().frame(width: 300)
         }
     }
     .frame(height: 300)
 }
 */

// Fixed Column
/*
 LazyVGrid(
     columns: [
         GridItem(.fixed(100), spacing: 8),
         GridItem(.fixed(160), spacing: 8),
         GridItem(.fixed(80), spacing: 8)
     ], spacing: 12) {

     ForEach(0 ..< 20) { item in
         Rectangle()
             .frame(height: 80)
     }
 }
 */

// Repeating Columns
// Array(repeating: .init(.flexible(), spacing: 8), count: 4)

struct LazyGrid: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(
                rows: [GridItem(.adaptive(minimum: 80), spacing: 8)],
                spacing: 12) {

                ForEach(0 ..< 20) { item in
                    Rectangle().frame(width: 300)
                }
            }
            .frame(height: 300)
        }
    }
}

#if DEBUG
struct LazyGrid_Previews: PreviewProvider {
    static var previews: some View {
        LazyGrid()
    }
}
#endif
