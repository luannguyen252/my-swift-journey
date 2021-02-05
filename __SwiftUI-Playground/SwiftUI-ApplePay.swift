import SwiftUI
import PlaygroundSupport

// constants
let deviceWidth: CGFloat = 320
let deviceHeight: CGFloat = 568
let hasFaceID = true // false for TouchID

struct Device: View {
    var body: some View {
        Checkout()
            .frame(width: deviceWidth, height: deviceHeight)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(16)
    }
}

struct Checkout: View {
    @State var isSheetOpen = false
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                VStack {
                    Spacer()
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            self.isSheetOpen = true 
                        }
                    }) {
                        ApplePayButton()
                    }
                    Spacer()
                }
                
                Rectangle()
                    .foregroundColor(Color(UIColor.black.withAlphaComponent(0.5)))
                    .opacity(self.isSheetOpen ? 1 : 0)
                
                if self.isSheetOpen && hasFaceID {
                    VStack {
                        SideButtonPrompt()
                            .padding(.top, 48)
                        Spacer()
                    }
                }
                
                ApplePaySheet(isSheetOpen: self.$isSheetOpen)
                    .offset(x: 0, y: self.isSheetOpen ? 0 : geometry.size.height)
            }
        }
    }
}

struct ApplePayButton: View {
    var body: some View {
        HStack {
            Text("Pay with Pay")
                .font(.headline)
                .foregroundColor(Color(UIColor.systemBackground))
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 24)
        .background(Color(UIColor.label))
        .cornerRadius(32)
    }
}

struct ApplePaySheet: View {
    @Binding var isSheetOpen: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Pay")
                    .font(.headline)
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        self.isSheetOpen = false
                    }
                }) {
                    Text("Cancel")
                }
            }
            .padding()
            
            Divider()
            
            HStack(alignment: .top, spacing: 16) {
                HStack {
                    Spacer()
                    Image(systemName: "creditcard.fill")
                }
                .frame(width: deviceWidth / 4)
                
                VStack(alignment: .leading) {
                    Text("DEBIT (•••• 9124)")
                    Text("NEW YORK, NY")
                }
                .font(.footnote)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .padding(.trailing)
                    .foregroundColor(Color(UIColor.systemBlue))
            }
            .padding(.vertical)
            
            Divider()
            
            HStack(alignment: .top, spacing: 16) {
                HStack {
                    Spacer()
                    Text("CONTACT")
                        .font(.footnote)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                }
                .frame(width: deviceWidth / 4)
                
                VStack(alignment: .leading) {
                    Text("JORDAN SINGER")
                    Text("IBUILDMYIDEAS.COM")
                }
                .font(.footnote)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .padding(.trailing)
                    .foregroundColor(Color(UIColor.systemBlue))
            }
            .padding(.vertical)
            
            Divider()
            
            HStack(spacing: 16) {
                HStack {
                    EmptyView()
                }
                .frame(width: deviceWidth / 4)
                
                Text("TOTAL")
                    .font(.footnote)
                Spacer()
                
                Text("$9.99")
                    .font(.system(size: 20))
                    .padding(.trailing)
            }
            .padding(.vertical)
            
            Divider()
            
            VStack(spacing: 16) {
                Image(systemName: hasFaceID ? "faceid" : "touchid")
                    .font(.system(size: 40))
                    .foregroundColor(Color(hasFaceID ? UIColor.systemBlue : UIColor.systemPink))
                
                Text(hasFaceID ? "Confirm with Side Button" : "Pay with Touch ID")
            }
            .padding(.vertical, 24)
            
        }
        .background(Color(UIColor.secondarySystemBackground))
    }
}

struct SideButtonPrompt: View {
    @State var sideButtonExpanded = false
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack(spacing: 12) {
            Spacer()
            Text("Double Click\nto Pay")
                .multilineTextAlignment(.trailing)
            
            Rectangle()
                .frame(width: sideButtonExpanded ? 16 : 12, height: 92)
                .cornerRadius(12, corners: [.topLeft, .bottomLeft])
        }
        .foregroundColor(.white)
        .onReceive(timer) { time in
            self.animate()
        }
    }
    
    func animate() {
        withAnimation(Animation.easeInOut(duration: 0.3).repeatCount(3)) {
            self.sideButtonExpanded.toggle()
        }
    }
}

// custom corner radius
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

PlaygroundPage.current.setLiveView(Device())