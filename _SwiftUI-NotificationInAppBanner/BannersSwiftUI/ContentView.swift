import SwiftUI

struct ContentView: View {
    @State var showBanner:Bool = false
    @State var bannerData: BannerModifier.BannerData = BannerModifier.BannerData(
        title: "SwiftUI", // Good Night
        detail: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.",
        icon: "swift", // moon.stars.fill
        type: .Warning
    )
    
    var body: some View {
        ZStack {
            if #available(iOS 14.0, *) {
                Color("dark").ignoresSafeArea(.all, edges: .all)
            } else {
                // Fallback on earlier versions
            }
            
            VStack(alignment: .center, spacing: 24) {
                Spacer()
                
                Button(action: {
                    self.bannerData.type = .Info
                    self.showBanner = true
                }) {
                    Text("Info")
                        .padding(.vertical, 16)
                        .padding(.horizontal, 48)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.custom("TTFirsNeue-Bold", size: 24))
                        .foregroundColor(Color("dark"))
                        .background(Capsule().fill(Color("blue")))
                }
                Button(action: {
                    self.bannerData.type = .Success
                    self.showBanner = true
                }) {
                    Text("Success")
                        .padding(.vertical, 16)
                        .padding(.horizontal, 48)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.custom("TTFirsNeue-Bold", size: 24))
                        .foregroundColor(Color("dark"))
                        .background(Capsule().fill(Color("green")))
                }
                Button(action: {
                    self.bannerData.type = .Warning
                    self.showBanner = true
                }) {
                    Text("Warning")
                        .padding(.vertical, 16)
                        .padding(.horizontal, 48)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.custom("TTFirsNeue-Bold", size: 24))
                        .foregroundColor(Color("dark"))
                        .background(Capsule().fill(Color("yellow")))
                }
                Button(action: {
                    self.bannerData.type = .Error
                    self.showBanner = true
                }) {
                    Text("Error")
                        .padding(.vertical, 16)
                        .padding(.horizontal, 48)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.custom("TTFirsNeue-Bold", size: 24))
                        .foregroundColor(Color("dark"))
                        .background(Capsule().fill(Color("red")))
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
            
            .banner(data: $bannerData, show: $showBanner)
        }
        .statusBar(hidden: true)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
