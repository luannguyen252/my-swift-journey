import SwiftUI

struct OnboardingView: View {
    
    @State private var step = 1
    @State var showResults = false
    
    var body: some View {
        ZStack {
            Color(0xc92477).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                
                Spacer()
                
                VStack {
                    Text("Art")
                        .bold()
                        .font(.system(size: 70))
                        .foregroundColor(Color("LightShade"))
                        .offset(y: 20)
                    Text("Snob")
                        .italic()
                        .font(.system(size: 40))
                        .foregroundColor(Color("LightShade"))
                }.offset(y: -40)
                
                GeometryReader { gr in
                    
                    HStack {
                        VStack(spacing: 40) {
                            Image("1")
                            Text("Stuck at home going crazy? Take a vacation from social media and view some classic artwork!")
                                .padding()
                                .fixedSize(horizontal: false, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }.frame(width: gr.frame(in: .global).width)
                        
                        VStack(spacing: 40) {
                            Image("2")
                            Text("Art Snob is a mobile art gallery where you can view famous works by famous artists!")
                                .padding()
                                .fixedSize(horizontal: false, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }.frame(width: gr.frame(in: .global).width)
                        
                        VStack(spacing: 40) {
                            Image("3")
                            Text("Click continue and dive in!")
                                .padding()
                                .fixedSize(horizontal: false, vertical: true)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
                        }.frame(width: gr.frame(in: .global).width)
                    }
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("LightShade"))
                    .font(.title)
                    .padding(.vertical, 60)
                    .frame(width: gr.frame(in: .global).width * 3)
                    .frame(maxHeight: .infinity)
                    .offset(x: self.step == 1 ? gr.frame(in: .global).width : self.step == 2 ? 0 : -gr.frame(in: .global).width)
                    .animation(Animation.interpolatingSpring(stiffness: 40, damping: 8))
                    .offset(y: 20)
                }
                
                NavigationLink(destination: GalleryView(), isActive: self.$showResults) {
                    Button(action: {
                        self.showResults = true
                    }) {
                        HStack {
                            Text("Continue")
                                .font(.system(size: 25))
                            Image(systemName: "chevron.right")
                        }
                        .padding(.horizontal)
                        .padding()
                        .background(Capsule().fill(Color("Accent2")))
                        .accentColor(Color("LightAccent"))
                        .opacity(step == 3 ? 1 : 0)
                        .animation(.none)
                        .scaleEffect(step == 3 ? 1 : 0.01)
                        .animation(Animation.interpolatingSpring(stiffness: 50, damping: 10, initialVelocity: 10))
                    }
                }
                
                HStack(spacing: 20) {
                    Button(action: {self.step = 1}) {
                        Image(systemName: "1.circle")
                            .padding()
                            .scaleEffect(step == 1 ? 1 : 0.65)
                    }
                    Button(action: {self.step = 2}) {
                        Image(systemName: "2.circle")
                            .padding()
                            .scaleEffect(step == 2 ? 1 : 0.65)
                    }
                    Button(action: {self.step = 3}) {
                        Image(systemName: "3.circle")
                            .padding()
                            .scaleEffect(step == 3 ? 1 : 0.65)
                    }
                }
                .animation(.spring(response: 0.4, dampingFraction: 0.5))
                .font(.largeTitle)
                .accentColor(Color("LightAccent"))
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
