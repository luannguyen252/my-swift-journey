import SwiftUI

struct ContentView: View {
    let symbols = ["gfx-bell", "gfx-cherry", "gfx-seven", "gfx-coin", "gfx-grape", "gfx-strawberry"]
    
    let haptic = UINotificationFeedbackGenerator()
    
    @State private var reels = [0,1,2]
    @State private var isShowingInfoView = false
    @State private var betAmount = 10
    @State private var highestScore = 0
    @State private var coins = 100
    @State private var showGameOverPopup = false
    @State private var animatingSymbol = false
    @State private var aimatingPopUp = false

    func spinReels() {
        reels = reels.map { _ in symbols.firstIndex(of: symbols.randomElement()!)! }
        playSound(sound: "spin", ofType: "mp3")
        haptic.notificationOccurred(.success)
    }

    func checkWinnings() {
        if reels[0] == reels[1] && reels[1] == reels[2] {
            coins += betAmount * 10
            if coins > highestScore {
                highestScore = coins
                UserDefaults.standard.setValue(highestScore, forKey: "HighScore")
                playSound(sound: "high-score", ofType: "mp3")
            } else {
                playSound(sound: "win", ofType: "mp3")
            }
        } else {
            coins -= betAmount
            if coins == 0 {
                $showGameOverPopup.wrappedValue = true
            }
        }
    }
    
    func getHighScore() {
        if let highScore = UserDefaults.standard.object(forKey: "HighScore") as? Int {
            highestScore = highScore
        }
    }
    
    func updateBet(to amount: Int) {
        betAmount = amount
        playSound(sound: "casino-chips", ofType: "mp3")
        haptic.notificationOccurred(.success)
    }
    
    func resetGame() {
        highestScore = 0
        coins = 100
        updateBet(to: 10)
        playSound(sound: "chimeup", ofType: "mp3")
    }
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(gradient: Gradient(colors: [Color.colorPink, Color.colorPurple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            // Interface
            VStack(alignment: .center, spacing: 5) {
                // Header
                LogoView()
                Spacer()
                
                // Score
                HStack {
                    HStack {
                        Text("Your \nCoins".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                        
                        Text("\(coins)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    }
                    .modifier(ScoreContainerModifier())
                    
                    Spacer()
                    
                    HStack {
                        Text("\(highestScore)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        
                        Text("High \nCoins".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)
                    }
                    .modifier(ScoreContainerModifier())
                }
                
                // Slot Machine
                VStack(alignment: .center, spacing: 0) {
                    // Reel #1
                    ZStack {
                        ReelView()
                        Image(symbols[reels[0]])
                            .resizable()
                            .modifier(ImageModifier())
                            .opacity(animatingSymbol ? 1 : 0)
                            .offset(y: animatingSymbol ? 0 : -50)
                            .animation(.easeOut(duration: Double.random(in: 0.5 ... 0.7)))
                            .onAppear(perform: {
                                animatingSymbol.toggle()
                                playSound(sound: "riseup", ofType: "mp3")
                            })
                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        // Reel #2
                        ZStack {
                            ReelView()
                            Image(symbols[reels[1]])
                                .resizable()
                                .modifier(ImageModifier())
                                .opacity(animatingSymbol ? 1 : 0)
                                .offset(y: animatingSymbol ? 0 : -50)
                                .animation(.easeOut(duration: Double.random(in: 0.7 ... 0.9)))
                                .onAppear(perform: {
                                    animatingSymbol.toggle()
                                })
                        }
                        
                        Spacer()
                        
                        // Reel #3
                        ZStack {
                            ReelView()
                            Image(symbols[reels[2]])
                                .resizable()
                                .modifier(ImageModifier())
                                .opacity(animatingSymbol ? 1 : 0)
                                .offset(y: animatingSymbol ? 0 : -50)
                                .animation(.easeOut(duration: Double.random(in: 0.9 ... 1.1)))
                                .onAppear(perform: {
                                    animatingSymbol.toggle()
                                })
                        }
                    }
                    .frame(maxWidth: 500)
                    
                    // Spin Button
                    Button(action: {
                        withAnimation {
                            animatingSymbol = false
                        }
                        spinReels()
                        
                        withAnimation {
                            animatingSymbol = true
                        }
                        checkWinnings()
                    }) {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ImageModifier())
                    }
                }
                .layoutPriority(2)
                
                
                // Footer
                Spacer()
                
                HStack {
                    // BET 20
                    HStack(alignment: .center, spacing: 10) {
                        Button(action: {
                            updateBet(to: 20)
                        }) {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundColor(betAmount == 20 ? .colorYellow : .white)
                                .modifier(BetNumberModifier())
                        }
                        .modifier(BetCapsuleModifier())
                        
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(betAmount == 20 ? 1 : 0)
                            .offset(x: betAmount == 20 ? 0 : 20)
                            .modifier(CasinoChipsModifier())
                    }
                    
                    Spacer()
                    
                    // BET 10
                    HStack(alignment: .center, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(betAmount == 10 ? 1 : 0)
                            .offset(x: betAmount == 10 ? 0 : -20)
                            .modifier(CasinoChipsModifier())
                        
                        Button(action: {
                            updateBet(to: 10)
                        }) {
                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundColor(betAmount == 10 ? .colorYellow : .white)
                                .modifier(BetNumberModifier())
                        }
                        .modifier(BetCapsuleModifier())
                    }
                }
            }
            // Buttons
            .overlay(
                // Reset
                Button(action: {
                    resetGame()
                }, label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                })
                .modifier(ButtonModiFier()),
                alignment: .topLeading
            )
            .overlay(
                // Info
                Button(action: {
                    isShowingInfoView = true
                }, label: {
                    Image(systemName: "info.circle")
                })
                .modifier(ButtonModiFier()),
                alignment: .topTrailing
            )
            .padding()
            .frame(maxWidth: 720)
            .blur(radius: $showGameOverPopup.wrappedValue ? 5.0 : 0, opaque: false)
            
            if $showGameOverPopup.wrappedValue {
                ZStack {
                    Color.colorTransparentBlack
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 0) {
                        Text("GAME OVER")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.bold)
                            .padding()
                            .frame(minWidth: 0 , maxWidth: .infinity)
                            .background(Color.colorPink)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 16){
                            Image("gfx-seven-reel")
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 72)
                            
                            Text("Bad luck! you lost all your coins. \n Lets play again!")
                                .font(.system(.body, design: .rounded))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .layoutPriority(1)
                            
                            Button(action: {
                                showGameOverPopup = false
                                aimatingPopUp = false
                                coins = 100
                                betAmount = 10
                                playSound(sound: "game-over", ofType: "mp3")
                            }, label: {
                                Text("New game".uppercased())
                                    .font(.system(.body, design: .rounded))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.colorPink)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .background(
                                        Capsule()
                                            .strokeBorder(lineWidth: 1.75)
                                            .foregroundColor(.colorPink)
                                    )
                            })
                        }
                        
                        Spacer()
                        
                    }
                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: .colorTransparentBlack, radius: 6, x: 0, y: 8)
                    .opacity(aimatingPopUp ? 1 : 0)
                    .offset(y: aimatingPopUp ? 0 : -100)
                    .animation(Animation.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0))
                    .onAppear(perform: {
                        aimatingPopUp = true
                    })
                }
            }
            // Popup
        }
        .onAppear(perform: {
            getHighScore()
        })
        .sheet(isPresented: $isShowingInfoView, content: {
            InfoView()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 11 Pro Max")
        }
    }
}
