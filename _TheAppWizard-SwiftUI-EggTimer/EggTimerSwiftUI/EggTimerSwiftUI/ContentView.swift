import SwiftUI

struct ContentView: View {
   // @State private var showImage = false
   @State var start = false
   @State var to: CGFloat = 0
   @State var count = 0
   @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
   
   var body: some View {
       // Background
       ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        
        VStack {
            Spacer()
                .frame(width: 100, height: 50, alignment: .center)
            Text("EGG TIMER SWIFTUI")
                .font(.title)
                .fontWeight(.thin)
                .foregroundColor(Color.white)
            
            Text("THE APP WIZARD")
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(Color.white)
            
            // Egg Spacer
            Spacer()
                .frame(width: 100, height: 100, alignment: .center)
            
            ZStack {
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke(Color.gray, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                    .frame(width: 370, height: 370)
                
                // Add Logic here for ring animation
                Circle()
                    .trim(from: 0, to: self.to)
                    .stroke(Color.red, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                    .frame(width: 320, height: 320)
                    .rotationEffect(.init(degrees: -90))
                     if(self.count >= 5) {
                        Circle()
                            .trim(from: 0, to: self.to)
                            .stroke(Color.yellow, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                            .frame(width: 320, height: 320)
                            .rotationEffect(.init(degrees: -90))
                       }
                      if(self.count >= 10) {
                        Circle()
                       .trim(from: 0, to: self.to)
                       .stroke(Color.green, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                       .frame(width: 320, height: 320)
                       .rotationEffect(.init(degrees: -90))
                     }
                
                VStack {
                    ZStack {
                        VStack {
                            Text("\(self.count)")
                                .font(.largeTitle)
                                .fontWeight(.black)
                                .foregroundColor(Color.white)
                            
                            ZStack {
                                Image("softegg")
                                    .resizable()
                                    .frame(width: 150, height: 180, alignment: .center)
                                
                                if(self.count >= 5) {
                                    Image("mediumegg")
                                        .resizable()
                                        .frame(width: 150, height: 180, alignment: .center)
                                }
                                
                                // >= After that count image changes
                                if(self.count >= 10) {
                                    Image("hardegg")
                                        .resizable()
                                        .frame(width: 150, height: 180, alignment: .center)
                                }
                            }
                        }
                    }
                }
            }
            
            Text("OF 15 SECONDS")
                .font(.title)
                .padding(.top)
                .foregroundColor(.white)
            
            Spacer()
                .frame(width: 100, height: 30, alignment: .center)
            
            HStack(spacing: 20) {
                Button(action: {
                    // Everything is in Seconds
                    // 15 = 15 seconds
                    // 30 = 30 seconds
                    // 45 = 45 seconds
                    // 60 = 60 seconds
                    if self.count == 15 {
                        self.count = 0
                        withAnimation(.default) {
                            self.to = 0
                        }
                    }
                    self.start.toggle()
                }) {
                    HStack(spacing: 15) {
                        Image(systemName: self.start ? "pause.fill" : "play.fill")
                            .foregroundColor(.white)
                        Text(self.start ? "Stop" : "Start")
                            .foregroundColor(.white)
                    }
                    .padding(.vertical)
                    .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .shadow(radius: 6)
                }
                
                Button(action: {
                    self.count = 0
                    withAnimation(.default) {
                        self.to = 0
                    }
                }) {
                    HStack(spacing: 15) {
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.red)
                        Text("Restart")
                            .foregroundColor(.red)
                    }
                    .padding(.vertical)
                    .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                    .background(
                        Capsule()
                            .stroke(Color.red, lineWidth: 3)
                    )
                    .shadow(radius: 6)
                }
            }
            .padding(.top, 55)
        }
       }
       .onAppear(perform: {
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { (_, _) in
            }
       })
       .onReceive(self.time) { (_) in
        if self.start {
            // Everything is in Seconds
            // 15 = 15 seconds
            // 30 = 30 seconds
            // 45 = 45 seconds
            // 60 = 60 seconds
            // I used 15 seconds
            if self.count != 15 {
                   self.count += 1
                   print("Boiling....")
                   withAnimation(.default){
                       self.to = CGFloat(self.count) / 15
                   }
               }
               else {
                   self.start.toggle()
                   // Add your Notification Code in Notify()
                   // self.Notify()
               }
           }
       }
   }
    // Functions // For Alarms
    func Notify() {  }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
       ContentView()
   }
}
