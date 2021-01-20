import SwiftUI

struct CustomButton: View{
    let text: String
    @State var isActive: Bool = false
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.horizontal,48)
            .padding(.vertical,16)
            .background(Color.white)
            .cornerRadius(100)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 5)
            .offset(x:0 , y: isActive ? 10 : 0)
            .animation(.easeOut(duration:0.2))
            .gesture(DragGesture(minimumDistance: 0)
                        .onChanged({_ in
                            self.isActive = true
                        })
                        .onEnded({_ in
                            self.isActive = false
                        }))
    }
}

struct ContentView: View {
    var body: some View {
        CustomButton(text : "HOVER");
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
