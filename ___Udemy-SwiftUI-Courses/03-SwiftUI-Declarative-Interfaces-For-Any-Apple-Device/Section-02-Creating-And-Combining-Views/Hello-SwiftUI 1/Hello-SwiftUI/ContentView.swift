

import SwiftUI

struct ContentView : View {
    var body: some View {
        
        VStack(alignment: .center) {
            
            Image("costa-rica")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(50)
                .padding(.all)
                //.clipShape(Circle())
            
            Text("First Line")
                .font(.largeTitle)
                .foregroundColor(.green)
            
            Text("Second Line")
                .font(.title)
                .foregroundColor(.orange)
            
            HStack {
                Text("Left Side")
                Text("Right Side")
                .padding(.all)
            }
        }
       
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
