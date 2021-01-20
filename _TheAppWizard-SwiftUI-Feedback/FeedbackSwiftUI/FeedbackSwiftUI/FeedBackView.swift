import SwiftUI

struct FeedBackView: View {
    @State var feedback: Double = 0
    @State var angry = false
    @State var laugh = false
    @State var confuse = false
    @State var party = false
    @State var blown = false
    @State var heart = false
   
    var body: some View {
        ZStack {
            Color.clear.blur(radius: 25)
                
            VStack {
                Spacer()
                    .frame(width: 100, height: 40, alignment: .center)
                
                ZStack {
                    VStack {
                        Spacer()
                            .frame(width: 100, height: 150, alignment: .center)
                        
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 380, height: 200, alignment: .center)
                            .foregroundColor(Color.blue)
                            .shadow(color: .blue, radius: 10, x: 0.0, y: 0.0)
                            .opacity(0.6)
                    }
                    
                    VStack {
                        if(feedback == 0) {
                            ZStack {
                                Circle()
                                    .frame(width: 200, height: 200, alignment: .center)
                                    .foregroundColor(.white)
                                    .overlay(Circle().stroke(Color.yellow, lineWidth: 4))
                                    .shadow(radius: 5)
                                
                                Image("angry")
                                    .resizable()
                                    .frame(width: 200, height: 200, alignment: .center)
                                    .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
                                    .padding(.all)
                                    .scaleEffect(angry ? 1.2 : 1)
                                    .animation(Animation.easeInOut(duration: 0.5).delay(1).repeatForever(autoreverses: true))
                                    .onAppear(){
                                        self.angry.toggle()
                                    }
                            }
                        }
                        
                        if(feedback == 1) {
                            ZStack {
                                Circle()
                                    .frame(width: 200, height: 200, alignment: .center)
                                    .foregroundColor(.white)
                                    .overlay(Circle().stroke(Color.yellow, lineWidth: 4))
                                    .shadow(radius: 5)
                                
                                Image("laugh")
                                    .resizable()
                                    .frame(width: 200, height: 200, alignment: .center)
                                    .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
                                    .padding(.all)
                                    .scaleEffect(laugh ? 1.2 : 1)
                                    .animation(Animation.easeInOut(duration: 0.5).delay(1).repeatForever(autoreverses: true))
                                    .onAppear(){
                                        self.laugh.toggle()
                                    }
                            }
                        }
                        
                        if(feedback == 2) {
                            ZStack {
                                Circle()
                                    .frame(width: 200, height: 200, alignment: .center)
                                    .foregroundColor(.white)
                                    .overlay(Circle().stroke(Color.yellow, lineWidth: 4))
                                    .shadow(radius: 5)
                                
                                Image("confuse")
                                    .resizable()
                                    .frame(width: 200, height: 200, alignment: .center)
                                    .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
                                    .padding(.all)
                                    .scaleEffect(confuse ? 1.2 : 1)
                                    .animation(Animation.easeInOut(duration: 0.5).delay(1).repeatForever(autoreverses: true))
                                    .onAppear(){
                                        self.confuse.toggle()
                                    }
                            }
                        }
 
                        if(feedback == 3) {
                            ZStack {
                                Circle()
                                    .frame(width: 200, height: 200, alignment: .center)
                                    .foregroundColor(.white)
                                    .overlay(Circle().stroke(Color.yellow, lineWidth: 4))
                                    .shadow(radius: 5)
                                
                            Image("party")
                                .resizable()
                                .frame(width: 200, height: 200, alignment: .center)
                                .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
                                .padding(.all)
                                .scaleEffect(party ? 1.2 : 1)
                                .animation(Animation.easeInOut(duration: 0.5).delay(1).repeatForever(autoreverses: true))
                                .onAppear(){
                                    self.party.toggle()
                                }
                            }
                        }
                        
                        if(feedback == 4) {
                            ZStack {
                                Circle()
                                    .frame(width: 200, height: 200, alignment: .center)
                                    .foregroundColor(.white)
                                    .overlay(Circle().stroke(Color.yellow, lineWidth: 4))
                                    .shadow(radius: 5)
                                
                                Image("blown")
                                    .resizable()
                                    .frame(width: 200, height: 200, alignment: .center)
                                    .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
                                    .padding(.all)
                                    .scaleEffect(blown ? 1.2 : 1)
                                    .animation(Animation.easeInOut(duration: 0.5).delay(1).repeatForever(autoreverses: true))
                                    .onAppear(){
                                        self.blown.toggle()
                                    }
                            }
                        }
                        
                        if(feedback == 5) {
                            ZStack {
                                Circle()
                                    .frame(width: 200, height: 200, alignment: .center)
                                    .foregroundColor(.white)
                                    .overlay(Circle().stroke(Color.yellow, lineWidth: 4))
                                    .shadow(radius: 5)
                                
                                Image("heart")
                                    .resizable()
                                    .frame(width: 200, height: 200, alignment: .center)
                                    .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
                                    .padding(.all)
                                    .scaleEffect(heart ? 1.2 : 1)
                                    .animation(Animation.easeInOut(duration: 0.5).delay(1).repeatForever(autoreverses: true))
                                    .onAppear(){
                                        self.heart.toggle()
                                    }
                            }
                        }
                        
                        Spacer()
                            .frame(width: 100, height: 20, alignment: .center)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 340, height: 40, alignment: .center)
                                .foregroundColor(Color.blue)
                            
                            Slider(value: $feedback, in: 0...5, step: 1)
                                .frame(width: 340, height: 40, alignment: .center)
                                .accentColor(.blue)
                                .shadow(color: .blue, radius: 10, x: 0.0, y: 0.0)
                                .overlay(RoundedRectangle(cornerRadius: 25)
                                            .stroke(lineWidth: 2.0)
                                            .frame(width: 350, height: 50, alignment: .center)
                                            .foregroundColor(Color.yellow)
                                )
                        }
                    }
                }
                
                Spacer()
                    .frame(width: 100, height: 40, alignment:.center)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .padding()
    }
}

struct FeedBackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedBackView()
            .previewLayout(.sizeThatFits)
    }
}
