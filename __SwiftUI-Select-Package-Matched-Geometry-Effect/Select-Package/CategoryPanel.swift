import SwiftUI

struct CategoryPanel: View {
    @Environment(\.colorScheme) var colorScheme
    @Namespace private var animation
    @Binding var selected   : Int
    let index               : Int
    let name                : String
    let price               : String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(name)
                    .font(.custom("TTFirsNeue-Bold", size: 18))
                    .padding(.bottom, 4)
                
                Spacer()
                
                Image(systemName: selected == index ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 24, height: 24, alignment: .center)
                    .foregroundColor(selected == index ? Color("pink2") : Color("light"))
            }
            
            Text("1 package, with $\(price) including")
                .font(.custom("TTFirsNeue-Regular", size: 14))
                .padding(.bottom, 2)
            
            Text("SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.")
                .fixedSize(horizontal: false, vertical: true)
                .font(.custom("TTFirsNeue-Regular", size: 14))
                .foregroundColor(Color("dark4"))
            
            if (index == 1) {
                HStack(alignment: .center) {
                    Image(systemName: "star.fill")
                        .font(.system(size: 16))
                        .foregroundColor(Color("yellow"))
                    
                    Text("Recommenced".uppercased())
                        .font(.custom("TTFirsNeue-Bold", size: 12))
                        .foregroundColor(Color("dark4"))
                }
                .padding(.vertical, 2)
            }
            
            if (selected == index) {
                Divider()
                
                VStack(alignment: .leading) {
                    ServiceLabel(namespace: animation, name: "avatar1", description: "SwiftUI uses a declarative syntax.")
                    ServiceLabel(namespace: animation, name: "avatar2", description: "SwiftUI is a user interface toolkit.")
                    ServiceLabel(namespace: animation, name: "avatar4", description: "SwiftUI as easy as dragging and dropping.")
                    ServiceLabel(namespace: animation, name: "avatar5", description: "SwiftUI was built on decades of experience.")
                    ServiceLabel(namespace: animation, name: "avatar6", description: "SwiftUI is truly native.")
                }
            } else {
                HStack {
                    ServiceIcon(namespace: animation, name: "avatar1", size: 32)
                    ServiceIcon(namespace: animation, name: "avatar2", size: 32)
                    ServiceIcon(namespace: animation, name: "avatar4", size: 32)
                    ServiceIcon(namespace: animation, name: "avatar5", size: 32)
                    ServiceIcon(namespace: animation, name: "avatar6", size: 32)
                }
            }
        }
        .padding(12)
        .background(colorScheme == .dark ? Color(.tertiarySystemGroupedBackground) : Color("white"))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(selected == index ? Color("pink2") : colorScheme == .dark ? Color.clear : Color("white"), lineWidth: 2)
        )
        .padding(.horizontal, 16)
        .shadow(color: Color("dark").opacity(colorScheme == .dark ? 0.6 : 0.1), radius: 6, x: 0.0, y: 0.0)
        .onTapGesture {
            withAnimation {
                selected = index
            }
        }
    }
}
