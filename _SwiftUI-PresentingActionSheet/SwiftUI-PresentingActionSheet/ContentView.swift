import SwiftUI

struct ContentView: View {
    @State private var showAlertSheet: Bool = false
    @State private var color = "green"
    
    var body: some View {
        Text("Hello, SwiftUI")
            .frame(width: 300, height: 150, alignment: .center)
            .foregroundColor(Color("dark"))
            .background(Color(color))
            .cornerRadius(16)
            .onTapGesture {
                showAlertSheet = true
            }
            .actionSheet(isPresented: $showAlertSheet, content: {
                ActionSheet(title: Text("Colors"), message: Text("Select color for background"), buttons: [
                    .default(Text("Green"), action: {
                        self.color = "green"
                    }),
                    .default(Text("Yellow"), action: {
                        self.color = "yellow"
                    }),
                    .default(Text("Pink"), action: {
                        self.color = "pink"
                    }),
                    .default(Text("Blue"), action: {
                        self.color = "blue"
                    }),
                    .cancel()
                ])
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
