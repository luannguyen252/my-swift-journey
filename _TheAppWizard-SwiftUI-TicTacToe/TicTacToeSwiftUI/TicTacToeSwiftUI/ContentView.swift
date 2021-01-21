import SwiftUI

extension Color {
    static let background = Color(UIColor(named: "colorBackground")!)
    static let colorui =  Color(UIColor(named: "Color1")!)
}

struct ContentView: View {
    @State var moves : [String] = Array(repeating: "", count: 9)
    @State var isPlaying = true // Player Active or Not
    @State  var gameover = false
    @State var msg = ""
    
    var body: some View {
        ZStack {
            (LinearGradient(gradient: Gradient(colors: [.background, .colorui, .background]), startPoint: .leading, endPoint: .trailing))
                .edgesIgnoringSafeArea(.all)
            
            // Title , Player and Game Section
            VStack {
                Spacer()
                    .frame(width: 100, height: 100, alignment: .center)
                
                // Title
                Image("name")
                    .resizable()
                    .frame(width: 350, height: 100, alignment: .center)
                
                // Game
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 380, height: 380, alignment: .center)
                    (LinearGradient(gradient: Gradient(colors: [.background, .colorui, .background]), startPoint: .leading, endPoint: .trailing))
                        .overlay(RoundedRectangle(cornerRadius: 25.0).stroke(Color.white.opacity(0.9), lineWidth: 2)
                                    .frame(width: 380, height: 380, alignment: .center))
                            
                    // Game Grid
                    VStack {
                        LazyVGrid(columns: Array(repeating : GridItem(.flexible(),spacing: 15) ,count : 3),spacing :15) {
                            // For each for 9 blocks of game
                            ForEach(0..<9, id : \.self) { index in
                                ZStack {
                                    // Card Flip Code
                                    Color.yellow.opacity(1)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.white, lineWidth: 4))
                                        .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                                    
                                    Color.background
                                        .opacity(moves[index] == "" ? 1 : 0)
                                    
                                    Text(moves[index])
                                        .font(.system(size: 55))
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color.red).opacity(0.8)
                                        .opacity(moves[index] != "" ? 1 : 0)
                                }
                                .frame(width: 110, height: 110, alignment: .center)
                                .cornerRadius(25)
                                .rotation3DEffect(
                                    .init(degrees : moves[index] != "" ? 180 : 0),
                                    axis : (x : 0.0 , y : 1.0 ,z : 0.0),
                                    anchor: .center,
                                    anchorZ : 0.0,
                                    perspective : 1.0
                                )
                                .onTapGesture(perform: {
                                    withAnimation(Animation.easeIn(duration: 0.5)) {
                                        if moves[index] == "" {
                                            moves[index] = isPlaying ? "X" : "O"
                                            // Not Fixed Yet
                                            // Variable X/O colors // Not Used
                                            if  moves[index] == "O" {  }
                                            if moves[index] == "O" {  }
                                            //-------------------------------//
                                            isPlaying.toggle()
                                        }
                                    }
                                })
                            }
                        }
                        .padding(30)
                    }
                    .onChange(of: moves, perform: { value in
                        checkWinner()
                    })
                    
                    .alert(isPresented: $gameover, content: {
                        Alert(title: Text("Winner"),message: Text(msg), dismissButton:
                                .destructive(Text("Play Again"),action: {
                                    // Reset Entire Game
                                    withAnimation(Animation.easeIn(duration: 0.5)) {
                                        moves.removeAll()
                                        moves = Array(repeating: "", count: 9)
                                        isPlaying = true
                                    }}))
                    })
                }
                
                // Bottom Names
                HStack {
                    Text("THE APP WIZARD")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .foregroundColor(Color.white)
                }
            }
        }
    }

    func checkWinner() {
        if checkMoves(player: "X") {
            // Trigger Message
            msg = "Player X is Winner !!!"
            gameover.toggle()
        } else if checkMoves(player: "O") {
            // Trigger Message
            msg = "Player O is Winner !!!"
            gameover.toggle()
        } else {
            // Check No Moves
            let status = moves.contains{(value) -> Bool in
                return value == ""
            }
            
            if !status {
                msg = "GAME OVER : MATCH TIED"
                gameover.toggle()
            }
        }
    }
    
    func checkMoves(player : String) -> Bool {
        // Horizontal Moves
        for i in stride(from: 0, to: 9, by: 3) {
            if moves[i] == player && moves[ i + 1 ] == player && moves[ i + 2] == player {
                return true
            }
        }
        
        // Vertical Moves
        for i in 0...2 {
            if moves[i] == player && moves[ i + 3 ] == player && moves[ i + 6] == player {
                return true
            }
        }
        
        // Check Diagonal Moves
        if moves[0] == player && moves[ 4 ] == player && moves[ 8 ] == player{
            return true
        }
        
        if moves[2] == player && moves[ 4 ] == player && moves[  6 ] == player {
            return true
        }
        
        return false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


