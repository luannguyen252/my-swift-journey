import SwiftUI

struct ContentView: View {
    @State var filters: [String] = [
        "SwiftUI",
        "User Experience",
        "iOS",
        "Mobile Development",
        "ReactJS",
        "Design Systems",
        "🔥",
    ]

    var body: some View {
        ZStack {
            Color("dark").ignoresSafeArea(.all, edges: .all)
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(filters, id: \.self) { filter in
                        Badge(name: filter, color: Color("pink2"), type: .removable({
                            withAnimation {
                                self.filters.removeAll { $0 == filter }
                            }
                        }))
                        .transition(.opacity)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .statusBar(hidden: true)
    }
}

// Badge
struct Badge: View {
    var name    :   String
    var color   :   Color       =   .blue
    var type    :   BadgeType   =   .normal
    
    enum BadgeType {
        case normal
        case removable(()->())
    }
    
    var body: some View {
        HStack{
            // Badge Label
            Text(name)
                .font(.custom("Chivo-Bold", size: 16))
                .foregroundColor(Color("white"))
            
            // Add 'x' if removable, and setup tap gesture
            switch type {
                case .removable( let callback):
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 8, height: 8, alignment: .center)
                        .font(Font.caption.bold())
                        .foregroundColor(Color("white"))
                        .onTapGesture {
                            callback()
                        }
                default:
                    EmptyView()
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(color)
        .cornerRadius(20)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
