import SwiftUI

struct PackageView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var selected = 1
    
    var body: some View {
        ZStack {
            if (colorScheme == .dark) {
                Color(.secondarySystemGroupedBackground)
                    .ignoresSafeArea(.all, edges: .all)
            } else {
                Color(.tertiarySystemGroupedBackground)
                    .ignoresSafeArea(.all, edges: .all)
            }
            
            VStack {
//                HStack {
//                    Spacer()
//
//                    Button(action: {
//                        print("Close is pressed.")
//                    }, label: {
//                        Image(systemName: "xmark.circle.fill")
//                            .padding([.trailing])
//                            .font(.system(size: 32))
//                            .foregroundColor(Color(colorScheme == .dark ? "light" : "dark").opacity(0.25))
//                    })
//                }
//                .padding(.bottom, 16)
                
                HStack {
                    Image(uiImage: #imageLiteral(resourceName: "profile"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40, alignment: .center)
                        .clipShape(Circle())
                    Text("Luan Nguyen")
                        .font(.custom("TTFirsNeue-Bold", size: 24))
                        .foregroundColor(Color(colorScheme == .dark ? "light" : "dark"))
                }
                .padding(.top, 16)
                .padding(.bottom, 4)
                
                Text("SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.")
                    .font(.custom("TTFirsNeue-Regular", size: 16))
                    .foregroundColor(Color(colorScheme == .dark ? "light" : "dark"))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 32)
                    .padding(.bottom, 16)
                
                CategoryPanel(selected: $selected, index: 0, name: "Individual", price: "14,95")
                    .padding(.bottom, 4)
                
                CategoryPanel(selected: $selected, index: 1, name: "Familiar", price: "19,95")
                    .padding(.top, 4)
                
                Spacer()
                
                Text("1 package, with $\(selected == 0 ? "14,95" : "19,95") including")
                    .font(.custom("TTFirsNeue-Regular", size: 14))
                    .foregroundColor(Color("dark4"))
                
                Button(action: {
                    print("Button is pressed.")
                }) {
                    Text("Get Started")
                        .font(.custom("TTFirsNeue-Bold", size: 18))
                        .padding(.horizontal, 64)
                        .padding(.vertical)
                        .foregroundColor(Color("white"))
                        .background(Color("pink2"))
                        .cornerRadius(16)
                }
            }
        }
    }
}

#if DEBUG
struct PackageView_Previews: PreviewProvider {
    static var previews: some View {
        PackageView()
    }
}
#endif
