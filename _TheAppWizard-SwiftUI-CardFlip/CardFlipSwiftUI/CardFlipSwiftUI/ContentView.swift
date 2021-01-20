import SwiftUI

struct ContentView: View {
    @State private var animating = false
    @State private var isImageFlipped = false
    @State private var rotation: Double = 0

    @State private var showDetails = false

    // Card Details
    @State var username: String = ""
    @State var month: String = ""
    @State var year: String = ""

    // CVV
    @State var cvv: String = ""

    // Card Number
    @State var first: String = ""
    @State var second: String = ""
    @State var third: String = ""
    @State var fourth: String = ""
       
       var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("CARD FLIP ANIMATION")
                    .font(.title)
                    .fontWeight(.light)
                    .foregroundColor(Color.black)
                
                Text("CREATE YOUR CARD")
                    .font(.title3)
                    .fontWeight(.thin)
                    .foregroundColor(Color.black)
                
                Text("THE APP WIZARD")
                    .font(.footnote)
                    .fontWeight(.thin)
                    .foregroundColor(Color.black)
           
            // Card Back Side
            ZStack {
                if isImageFlipped {
                    Image("backbl")
                        .resizable()
                        .frame(width: 650, height: 380, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .shadow(color: .gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                        .scaleEffect(0.6)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    
                    VStack {
                        HStack {
                            Text(cvv)
                                .font(.title)
                                .fontWeight(.regular)
                                .foregroundColor(Color.red)
                                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))

                             Spacer()
                                .frame(width: 200, height: 100, alignment: .center)
                                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        }
                    }
                }
                
                // Card Front Side
                else {
                    Image("frontbl")
                        .resizable()
                        .frame(width: 650, height: 380, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .shadow(color: .gray, radius: 10, x: 10,y: 10)
                        .scaleEffect(0.6)
                    
                    ZStack {
                        VStack {
                            Spacer()
                                .frame(width: 60, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            HStack {
                                Text(first)
                                    .font(.title)
                                    .fontWeight(.thin)
                                    .foregroundColor(Color.black)
                                Spacer()
                                    .frame(width: 10, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Text(second)
                                    .font(.title)
                                    .fontWeight(.thin)
                                    .foregroundColor(Color.black)
                                Spacer()
                                    .frame(width: 10, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Text(third)
                                    .font(.title)
                                    .fontWeight(.thin)
                                    .foregroundColor(Color.black)
                                Spacer()
                                    .frame(width: 10, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Text(fourth)
                                    .font(.title)
                                    .fontWeight(.thin)
                                    .foregroundColor(Color.black)
                            }
                            
                            // Valid Month Year
                            HStack {
                                Text("VALID ")
                                    .font(.callout)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.black)
                                Spacer()
                                    .frame(width: 10, height: 20, alignment: .center)
                                // MONTH
                                Text(month)
                                    .font(.callout)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.black)
                                Spacer()
                                    .frame(width: 10, height: 20, alignment: .center)
                                Text("/")
                                    .font(.callout)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.black)
                                Spacer()
                                    .frame(width: 10, height: 20, alignment: .center)
                                // YEAR
                                Text(year)
                                    .font(.callout)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.black)
                                Spacer()
                                    .frame(width: 10, height: 40, alignment: .center)
                            }
                            
                            HStack {
                                Text(username)
                                    .font(.headline)
                                    .fontWeight(.thin)
                                    .foregroundColor(Color.black)
                                Spacer()
                                    .frame(width: 250, height: 20, alignment: .center)
                            }
                        }
                    }
               }
           }
           .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
           .onTapGesture {
               withAnimation(Animation.linear(duration: 0.3)) {
                   self.animating.toggle()
               }
           }
           .onAppear {
               Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                   if self.animating {
                       withAnimation(Animation.linear(duration: 0.01)) {
                           self.rotation += 3
                       }
                       if self.rotation == 90 || self.rotation == 270 {
                           self.isImageFlipped.toggle()
                       } else if self.rotation == 360 || self.rotation == 180 {
                           self.animating = false
                       }
                       if self.rotation == 360 {
                           self.rotation = 0
                       }
                   }
               }
           }
            
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .frame(width: 380, height: 380, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .shadow(color: .gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)

                    VStack {
                        Text("CARD DETAILS")
                            .font(.title)
                            .fontWeight(.thin)
                            .foregroundColor(Color.black)
                        
                        HStack {
                            Text("CARD OWNER :")
                                .fontWeight(.light)
                            TextField("NAME", text: $username)
                                .foregroundColor(Color.red)
                                .cornerRadius(3.0)
                                .background(Color.white)
                                .frame(width: 100, height: 30, alignment: .center)
                            Spacer()
                                .frame(width: 130, height: 50, alignment: .center)
                        }
                        
                        HStack {
                            Text("CARD NUMBER :")
                                .fontWeight(.light)
                            TextField("XXXX", text: $first)
                                .foregroundColor(Color.red)
                                .background(Color.white)
                                .frame(width: 50, height: 50, alignment: .center)
                            TextField("XXXX", text: $second)
                                .foregroundColor(Color.red)
                                .background(Color.white)
                                .frame(width: 50, height: 50, alignment: .center)
                            TextField("XXXX", text: $third)
                                .foregroundColor(Color.red)
                                .background(Color.white)
                                .frame(width: 50, height: 50, alignment: .center)
                            TextField("XXXX", text: $fourth)
                                .foregroundColor(Color.red)
                                .background(Color.white)
                                .frame(width: 50, height: 50, alignment: .center)
                        }
                        
                        HStack {
                            Text("MONTH / YEAR:")
                                .fontWeight(.light)
                            TextField("XX", text: $month)
                                .foregroundColor(Color.red)
                                .background(Color.white)
                                .frame(width: 40, height: 50, alignment: .center)
                            Text("/")
                                .font(.title)
                                .fontWeight(.thin)
                            TextField("XX", text: $year)
                                .foregroundColor(Color.red)
                                .background(Color.white)
                                .frame(width: 50, height: 50, alignment: .center)
                            Spacer()
                                .frame(width: 110, height: 50, alignment: .center)
                        }
                        
                        HStack {
                            Text("CARD CVV :")
                                .fontWeight(.light)
                            TextField("XXX", text: $cvv)
                                .foregroundColor(Color.red)
                                .background(Color.white)
                                .frame(width: 100, height: 50, alignment: .center)
                            Spacer()
                                .frame(width: 150, height: 50, alignment: .center)
                        }
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

