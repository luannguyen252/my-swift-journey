import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                Text("Floating Action Button")
                    .font(.title)
                    .fontWeight(.thin)
                    .foregroundColor(.black)
                
                Text("The App Wizard")
                    .font(.callout)
                    .fontWeight(.thin)
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            FloatingMenu()
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
