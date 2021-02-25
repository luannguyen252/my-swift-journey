import SwiftUI

struct CardView: View {
    var item: AppItem
    @State var show = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack(spacing: 16) {
            Image(item.name)
                .resizable()
                .frame(width: 64, height: 64)
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.name)
                            .font(.system(size: 18))
                            .fontWeight(.heavy)
                            .foregroundColor(colorScheme == .dark ? Color("light") : Color("dark"))
                        
                        Text(item.source)
                            .font(.system(size: 12))
                            .foregroundColor(colorScheme == .dark ? Color("light") : Color("dark"))
                    }
                    
                    Spacer(minLength: 16)

                    VStack {
                        Button(action: {show.toggle()}) {
                            Text(show ? "Open" : "GET")
                                .font(.system(size: 14))
                                .fontWeight(.heavy)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .foregroundColor(Color("dark"))
                                .background(Color("purple"))
                                .clipShape(Capsule())
                        }
                        
                        Text("In App Purchases")
                            .font(.system(size: 12))
                            .foregroundColor(colorScheme == .dark ? Color("light") : Color("dark"))
                    }
                }
                
                Divider()
            }
        }
        .padding(.horizontal)
    }
}
