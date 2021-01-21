import SwiftUI

struct ContentView: View {
    let para = "National Geographic Wild is a place for all things animals and for animal-lovers alike. Take a journey through the animal kingdom with us and discover things you never knew before, or rediscover your favorite animals!"

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                ScrollView {
                    GeometryReader { geometry in
                        ImageCarouselView(numberOfImages: 3) {
                            Image("eagle")
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .clipped()
                            
                            Image("tiger")
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .clipped()
                            
                            Image("wolf")
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .clipped()
                        }
                    }
                    .frame(height: 890, alignment: .center)
                }
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                    .frame(width: 200, height: 150, alignment: .center)
                
                VStack {
                    Image("finallogo")
                        .resizable()
                        .frame(width: 300, height: 120, alignment: .center)
                }
                
                Spacer()
                    .frame(width: 200, height: 150, alignment: .center)
                
                Text(para)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.all)
                    .opacity(0.8)
                
                Spacer()
                    .frame(width: 200, height: 80, alignment: .center)
          
                HStack {
                    Spacer()
                        .frame(width: 200, height: 100, alignment: .center)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 150, height: 65, alignment: .center)
                            .foregroundColor(.yellow)
                            .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                        
                        HStack {
                            Image(systemName: "play.fill")
                            
                            Spacer()
                                .frame(width: 20, height: 100, alignment: .center)
                            
                            Text("ENTER")
                                .font(.title)
                                .fontWeight(.light)
                                .foregroundColor(Color.black)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
