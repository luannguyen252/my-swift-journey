
import SwiftUI

struct SeeAllGrid: View {
    
    var body: some View {
        
        List(1..<8) { n in
        HStack {
            Image("shoulders\(n)")
                .resizable()
                .clipped()
                .cornerRadius(5)
                .frame(minWidth: 80, idealWidth: 80, maxWidth: 80, minHeight: 80, idealHeight: 80, maxHeight: 80)
            VStack(alignment: .leading) {
                Text("Shoulders \(n)")
                    .fontWeight(.semibold)
                Text("Shoulders")
                    .font(.subheadline)
                }
            Spacer()
            Image(systemName: "chevron.right")
            }
        }
        .navigationBarTitle("Shoulders All over")
        // cleaner code!
        }
}

struct SeeAllGrid_Previews: PreviewProvider {
    static var previews: some View {
        SeeAllGrid()
    }
}
