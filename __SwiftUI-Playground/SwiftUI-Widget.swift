import SwiftUI
import PlaygroundSupport

struct Content: View {
    @State var isExpanded = false
    @State var wifiEnabled = true
    @State var spacing: CGFloat = 12
    var body: some View {
        VStack(spacing: self.spacing) {
            HStack(spacing: self.spacing) {
                VStack {
                    Ellipse()
                        .foregroundColor(Color(UIColor.tertiarySystemGroupedBackground))
                        .overlay(Image(systemName: "airplane"))
                        .frame(width: 52, height: 52)
                    if self.isExpanded {
                        Text("Airplane").font(.caption).fontWeight(.semibold)
                    }
                }
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.15)) {
                        self.wifiEnabled.toggle() 
                    }
                    }) {
                    VStack {
                        Ellipse()
                            .foregroundColor(Color(self.wifiEnabled ? UIColor.systemBlue : UIColor.tertiarySystemGroupedBackground))
                            .overlay(Image(systemName: "wifi"))
                            .frame(width: 52, height: 52)
                        if self.isExpanded {
                            Text("WiFi").font(.caption).fontWeight(.semibold)
                        }
                    }
                }
            .buttonStyle(PlainButtonStyle())
            }
            
            HStack(spacing: self.spacing) {
                VStack {
                    Ellipse()
                        .foregroundColor(Color(UIColor.tertiarySystemGroupedBackground))
                        .overlay(Image(systemName: "bell.fill"))
                        .frame(width: 52, height: 52)
                    if self.isExpanded {
                    Text("Notifs").font(.caption).fontWeight(.semibold)
                    }
                }
                
                VStack {
                    Ellipse()
                        .foregroundColor(Color(UIColor.tertiarySystemGroupedBackground))
                        .overlay(Image(systemName: "moon.fill"))
                        .frame(width: 52, height: 52)
                    if self.isExpanded {
                    Text("DND").font(.caption).fontWeight(.semibold)
                    }
                }
            }
        }
    .padding(self.spacing)
    .background(Color(UIColor.secondarySystemBackground))
    .cornerRadius(24)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.25)) {
                self.isExpanded.toggle()
                
                if self.isExpanded {
                    self.spacing = 24
                } else {
                    self.spacing = 12
                }
            }
        }
    }
}

PlaygroundPage.current.setLiveView(Content())