import SwiftUI

struct IteratingOverAnArray: View {
    var authors = ["Luan Nguyen", "Steve Jobs", "Tim Cook", "Bill Gates"]
    
    var body: some View {
        // Iterating in a View
        VStack {
            ForEach(authors, id: \.self) { author in
                Text(author)
            }
        }
    }
}

#if DEBUG
struct IteratingOverAnArray_Previews: PreviewProvider {
    static var previews: some View {
        IteratingOverAnArray()
    }
}
#endif
