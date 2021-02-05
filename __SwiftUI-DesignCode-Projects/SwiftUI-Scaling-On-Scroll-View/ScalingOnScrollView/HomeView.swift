import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Scroll Animation")
                        .font(.custom("TTFirsNeue-Bold", size: 40))
                        .foregroundColor(Color("light"))
                    Text("Scaling Items When User Scrolls")
                        .font(.custom("TTFirsNeue-Regular", size: 18))
                        .foregroundColor(Color("dark4"))
                }
                
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color("dark").shadow(color: Color("light").opacity(0.05), radius: 5, x: 0, y: 5))
            .zIndex(0)

            GeometryReader { mainView in
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(items, id: \.name) { thisItem in
                            GeometryReader { item in
                                ItemView(item: thisItem)
                                    .scaleEffect(scaleValue(mainFrame: mainView.frame(in: .global).minY, minY: item.frame(in: .global).minY),anchor: .bottom)
                                    .opacity(Double(scaleValue(mainFrame: mainView.frame(in: .global).minY, minY: item.frame(in: .global).minY)))
                            }
                            .frame(height: 144)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 24)
                }
                .zIndex(1)
            }
        }
        .background(Color("dark3").edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.top)
        .statusBar(hidden: true)
    }
    
}

extension HomeView {
    /// - Parameters:
    ///   - mainFrame: Zoom View Size
    ///   - minY: Minimum Y Value
    /// - Returns: Zoom Factor
    func scaleValue(mainFrame : CGFloat, minY : CGFloat)-> CGFloat {
        withAnimation(.easeOut) {
            let scale = (minY - 25) / mainFrame
            
            if scale > 1 {
                return 1
            }
            else {
                return scale
            }
        }
    }
}
