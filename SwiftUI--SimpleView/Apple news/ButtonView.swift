
import SwiftUI

struct ButtonView: View {
    var body: some View {
        Button(action: {
            print("Stuff")
        }) {
          ZStack {
            Rectangle()
                .foregroundColor(.pink)
                
             .cornerRadius(8)
                .frame(height: 55)
                .padding(.horizontal, 28)
            
            Text("Continue")
                .foregroundColor(.white)
                .font(.system(size: 24))
                .fontWeight(.bold)
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
