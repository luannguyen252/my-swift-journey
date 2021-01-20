import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Text("The App Wizard")
                    .opacity(0.2)
                    .foregroundColor(.white)
                Spacer().frame(height: 300)
            }
            Card()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

let screen = UIScreen.main.bounds

struct Card: View {
    @State var show: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        HStack {
                            Text("PREMIUM")
                                .font(.body)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .shadow(color: .black, radius: 3, x: 0.0, y: 0.0)
                            Spacer()
                            Text("DREAM BANK")
                                .font(.body)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .shadow(color: .black, radius: 3, x: 0.0, y: 0.0)
                        }
                        .offset(x: 10.0, y: 10.0)
                        
                        HStack {
                            Image("chip")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)
                                .shadow(color: .black, radius: 1, x: 0.0, y: 0.0)
                                .frame(width: 100, height: 100, alignment: .center)
                            Text("1150 2280 3319 6623")
                                .font(.headline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
                                .shadow(color: .black, radius: 3, x: 0.0, y: 0.0)
                        }
                    }
                    Spacer()
                }
                Spacer()
                
                HStack {
                    Text("SHREYAS BHIKE")
                        .font(.title2)
                        .fontWeight(.regular)
                        .foregroundColor(Color.white)
                        .shadow(color: .black, radius: 3, x: 0.0, y: 0.0)
                    Spacer()
                    
                    CardLogoRings().offset(x: -10.0, y: 5)
                }
            }
            .padding(show ? 30 : 20)
            .padding(.top, show ? 30 : 0)
            .frame(maxWidth: show ? .infinity : screen.width - 38, maxHeight: show ? .infinity : 240)
            .background(RadialGradient(gradient: Gradient(colors: [.purple, .blue]), center: .center, startRadius: 2, endRadius: 650))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
            .animation(.spring(response: 0.5, dampingFraction: 0.6))
            .onTapGesture {
                self.show.toggle()
            }
            .edgesIgnoringSafeArea(.all)
            BarFinalView().opacity(show ? 1 : 0 )
        }
    }
}

struct CardLogoRings: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 35, height: 35, alignment: .center)
                .foregroundColor(.yellow)
                .shadow(color: .black, radius: 1, x: 0.0, y: 0.0)
            
            Circle()
                .frame(width: 35, height: 35, alignment: .center)
                .foregroundColor(.red)
                .shadow(color: .black, radius: 1, x: 0.0, y: 0.0)
                .offset(x: 20)
        }
    }
}
