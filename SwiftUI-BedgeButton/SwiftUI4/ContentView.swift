import SwiftUI

struct ContentView: View {
    @ObservedObject private var signUpViewModel = SignUpViewModel()
    
    var body: some View {
        CustomButton()
    }
}

struct CustomButton:View {
    @State var count = 0
    
    var body: some View {
        ZStack{
            Button(action: {
                self.count = self.count + 1
            }) {
                Image(systemName: "bell.fill")
                    .resizable()
                    .frame(width:30,height: 30)
            }
            .padding()
            .background(Color.gray)
            .foregroundColor(Color.green)
            .clipShape(Circle())
            
            if count != 0 {
                Text("\(count)")
                    .padding(5)
                    .background(Color.red)
                    .clipShape(Circle())
                    .foregroundColor(Color.white)
                    .offset(x: 17, y: -25)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
