import SwiftUI

struct MainPage: View {
    @State var sliderValue: Double = 0
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                VStack(spacing: 12) {
                    ZStack {
                        Image("taylorswift")
                            .resizable()
                            .frame(height: 350)
                            .cornerRadius(15)
                    }
                
                    Text("Everything Has Changed")
                        .font(.title)
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                    
                    HStack {
                        Text("Red")
                            .foregroundColor(.gray)
                        Text("Taylor Swift")
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Text("1.04")
                        Slider(value: $sliderValue, in: 0...20, step: 1)
                            .accentColor(Color.red)
                        Text("3.45")
                    }
                    .foregroundColor(Color.red)
                    
                    Spacer()
                        .frame(width: 100, height: 30, alignment: .center)
                }
                .padding()
                .frame(width: 390, height: 550, alignment: .center)
                .background(Color.black.opacity(0.09))
                .cornerRadius(15)
                .padding()
                
                // Music Buttons
                HStack {
                    Button(action: {
                }) {
                    HStack {
                        Image(systemName: "play.fill")
                            .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("Color1"))
                            .cornerRadius(35)
                    }
                }
                .shadow(color: .gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                    
                Button(action: {
                }) {
                    HStack{
                        Image(systemName: "pause.fill")
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("Color1"))
                            .cornerRadius(35)
                    }
                }
                .shadow(color: .gray, radius: 10, x: 10, y: 10)
                    
                Button(action: {
                }) {
                    HStack{
                    Image(systemName: "stop.fill")
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("Color1"))
                        .cornerRadius(35)
                        
                    }
                }
                .shadow(color: .gray, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                    
                Spacer()
                    .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                .padding(.trailing)
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    HStack(spacing: 15) {
                        Image("eminem")
                            .resizable().frame(width: 80, height: 80, alignment: .center)
                            .cornerRadius(15)
                        VStack(alignment: .leading, spacing: 12) {
                            Text("I'm Leaving Heaven")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Text("Eminem")
                                .foregroundColor(.gray)
                        }
                        Spacer(minLength: 0)
                    }
                    HStack(spacing: 15) {
                        Image("edsheeran")
                            .resizable().frame(width: 80, height: 80, alignment: .center)
                            .cornerRadius(15)
                        VStack(alignment: .leading, spacing: 12) {
                                Text("Perfect")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                 Text("Ed Sheeran")
                                    .foregroundColor(.gray)
                        }
                        Spacer(minLength: 0)
                    }
                    HStack(spacing: 15) {
                        Image("skylergrey")
                            .resizable().frame(width: 80, height: 80, alignment: .center)
                            .cornerRadius(15)
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Kill For You")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Text("Skyler Grey")
                                .foregroundColor(.gray)
                        }
                        Spacer(minLength: 0)
                    }
                }
                .padding()
            }
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
