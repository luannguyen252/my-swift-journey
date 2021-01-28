import SwiftUI

struct ContentView: View {
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            BackCard()
                .animation(.spring())
                .offset(y: viewState.height > 50 ? -100 : 0)
                .gesture(
                    TapGesture()
                        .onEnded{
                            self.viewState = .zero
                    }
            )
            
            Card()
                .offset(y:viewState.height)
                .animation(.spring())
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.viewState = value.translation
                    }
                    .onEnded { value in
                        if self.viewState.height > 200 {
                            self.viewState = CGSize(width: 0, height: 800)
                        } else {
                            self.viewState = CGSize.zero
                        }
                    }
                )
        }
        .edgesIgnoringSafeArea(.all)
        .padding(.top, 50)
        .background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackCard:View {
    var body:some View {
        VStack {
            Color.orange
        }
        .cornerRadius(20)
        .offset(y: -30)
    }
}

struct Card:View {
    var body:some View {
        ZStack {
            Color.blue
            VStack(alignment: .leading) {
                Text("Build an app with SwiftUI")
                    .frame(width: 200)
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .padding()
                Spacer()
                Image("large-wave").resizable().aspectRatio(contentMode: .fit)
            }
        }
        .cornerRadius(20)
        .padding(0)
    }
}
