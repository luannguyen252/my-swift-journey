import SwiftUI

struct ContentView: View {
    @State private var selectedOption: String = ""
    
    var body: some View {
        VStack(spacing: 40) {
            Text("\(selectedOption)")
                .font(.custom("TTFirsNeue-Bold", size: 32))
            
            //HStack(spacing: 16) {
            Menu("Select Option") {
                Button("Option 1") {
                    selectedOption = "Option 1 Selected"
                }
                .font(.custom("TTFirsNeue-Bold", size: 16))
                
                Button("Option 2") {
                    selectedOption = "Option 2 Selected"
                }
                .font(.custom("TTFirsNeue-Bold", size: 16))
                
                Button("Option 3") {
                    selectedOption = "Option 3 Selected"
                }
                .font(.custom("TTFirsNeue-Bold", size: 16))
            }
            .font(.custom("TTFirsNeue-Bold", size: 16))
            //}
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
