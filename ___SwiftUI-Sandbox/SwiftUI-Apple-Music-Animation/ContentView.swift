import SwiftUI

struct AppleMusicAnimation: View {
    @State var show = false
    @Namespace var namespace
    
    var body: some View {
        VStack {
            Spacer()
            VStack (spacing: 15) {
                HStack (spacing: 15) {
                    
                    Image("photos").resizable().aspectRatio(contentMode: .fit).frame(width: self.show ? 350 : 50, height: self.show ? 350 : 50).padding(.top, self.show ? 40 : 0)
                    
                    if !self.show {
                        VStack (alignment: .leading, spacing: 4) {
                            Text("Title")
                        }.matchedGeometryEffect(id: "Title", in: self.namespace)
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "play.fill").font(.title).foregroundColor(.black)
                        }.matchedGeometryEffect(id: "Play", in: self.namespace)
                        
                        Button(action: {}) {
                            Image(systemName: "forward.fill").font(.title).foregroundColor(.black)
                        }
                    }
                }
                
                if self.show {
                    VStack {
                        HStack {
                            Spacer()
                            VStack {
                                Text("Title").font(.title).fontWeight(.semibold)
                                Text("Artist").font(.headline).foregroundColor(Color(UIColor.systemBlue))
                            }.matchedGeometryEffect(id: "Title", in: self.namespace)
                            Spacer()
                        }
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "play.fill").font(.title).foregroundColor(.black)
                        }.matchedGeometryEffect(id: "Play", in: self.namespace)
                        
                        Spacer()
                    }
                }
                
                
            }.padding(.all).background(Color.white.shadow(radius: 3)).onTapGesture {
                withAnimation(Animation.easeOut(duration: 0.4)) {
                    self.show.toggle()
                }
            }
        }.background(Color.black.opacity(0.05)).edgesIgnoringSafeArea(.all)
    }
}