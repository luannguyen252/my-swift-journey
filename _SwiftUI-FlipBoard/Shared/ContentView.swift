import SwiftUI

struct ContentView: View {
    @State var counter = 0
    let decreasingNumberAlphabet:[Character] = "9876543210~".flatMap { $0.description }

    var text:String{
        String(counter)
    }
    
    var body: some View {
        VStack{
            Button("increment"){
                withAnimation(.spring()){
                    counter += 7
                }
            }
            Text(text)
                .font(.system(size: 30))
            RollBoardView(text:text, emptyChar: "~", cells: 6, size: 50, alphabet: decreasingNumberAlphabet, fontDesing: .monospaced, fontColor: .green)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
