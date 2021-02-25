import SwiftUI

struct ContentView: View {
    @State var counter = 0
    
    var body: some View {
        ZStack {
            Color("dark").ignoresSafeArea(.all, edges: .all)
            
            VStack {
                Spacer(minLength: 0)
                
                if counter > 0 {
                    VStack(spacing: 0) {
                        Text("You've tapped")
                            .font(.custom("TTFirsNeue-Bold", size: 40))
                            .foregroundColor(Color("light"))
                        Text("\(counter)")
                            .font(.custom("TTFirsNeue-Bold", size: 40))
                            .foregroundColor(Color("pink2"))
                        Text("times.")
                            .font(.custom("TTFirsNeue-Bold", size: 40))
                            .foregroundColor(Color("light"))
                    }
                } else {
                    Text("You've not yet tapped.")
                        .font(.custom("TTFirsNeue-Bold", size: 40))
                        .foregroundColor(Color("light"))
                        .multilineTextAlignment(.center)
                }
                
                Spacer(minLength: 0)
                
                Spacer(minLength: 0)
                
                Spacer(minLength: 0)
                
                Button(action: {
                    counter += 1
                }, label: {
                    Text("Tap Me")
                        .padding(.vertical, 24)
                        .padding(.horizontal, 40)
                        .font(.custom("TTFirsNeue-Bold", size: 24))
                        .foregroundColor(Color("dark"))
                        .background(Capsule().fill(Color("pink2")))
                })
                
                Spacer(minLength: 0)
            }
            .debug()
        }
        .statusBar(hidden: true)
    }
}

extension View {
    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
