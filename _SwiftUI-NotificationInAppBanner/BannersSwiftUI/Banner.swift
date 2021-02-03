import SwiftUI

struct BannerModifier: ViewModifier {
    struct BannerData {
        var title: String
        var detail: String
        var icon: String
        var type: BannerType
    }
    
    enum BannerType {
        case Info
        case Warning
        case Success
        case Error
        
        var tintColor: Color {
            switch self {
            case .Info:
                return Color("blue")
            case .Success:
                return Color("green")
            case .Warning:
                return Color("yellow")
            case .Error:
                return Color("red")
            }
        }
    }
    
    // Members for the Banner
    @Binding var data: BannerData
    @Binding var show: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if show {
                VStack {
                    HStack {
                        HStack(alignment: .top, spacing: 16) {
                            Image(systemName: data.icon)
                                .font(.system(size: 40))
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text(data.title)
                                    .foregroundColor(Color("dark"))
                                    .font(.custom("TTFirsNeue-Bold", size: 24))
                                
                                Text(data.detail)
                                    .foregroundColor(Color("dark2"))
                                    .font(.custom("TTFirsNeue-Regular", size: 18))
                            }
                        }
                        
                        Spacer()
                    }
                    .foregroundColor(Color("dark"))
                    .padding(16)
                    .background(data.type.tintColor)
                    .cornerRadius(8)
                    Spacer()
                }
                .padding()
                .animation(.easeInOut)
                .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                .onTapGesture {
                    withAnimation {
                        self.show = false
                    }
                }
                .onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            self.show = false
                        }
                    }
                })
            }
        }
    }
}

extension View {
    func banner(data: Binding<BannerModifier.BannerData>, show: Binding<Bool>) -> some View {
        self.modifier(BannerModifier(data: data, show: show))
    }
}

struct Banner_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Hello")
        }
    }
}
