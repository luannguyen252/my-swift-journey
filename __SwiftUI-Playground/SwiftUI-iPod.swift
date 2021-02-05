import SwiftUI
import PlaygroundSupport

struct iPod: View {
    var body: some View {
        VStack(spacing: 40) {
            Screen()
            ClickWheel()
            Spacer()
        }
        .padding(.top, 24)
        .frame(width: 368, height: 540)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(32)
        .shadow(color: Color(UIColor.black.withAlphaComponent(0.15)), radius: 24, x: 0, y: 2)
        .overlay(
            RoundedRectangle(cornerRadius: 32)
                .stroke(Color.clear, lineWidth: 8)
                .shadow(color: Color(UIColor.black.withAlphaComponent(0.3)), radius: 12, x: 0, y: 0)
                .clipShape(
                    RoundedRectangle(cornerRadius: 32)
            )
        )
    }
}

struct Screen: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.black)
            .frame(width: 320, height: 240)
            .overlay(
                HStack(spacing: 0) {
                    VStack(spacing: 0) {
                        StatusBar()
                        Menu()
                    }
                    .frame(width: 156)
                    .background(Color.white)
                    
                    Color.gray
//                      Image(uiImage: #imageLiteral(resourceName: "IMG_0488.PNG"))
//                          .resizable()
//                          .aspectRatio(contentMode: .fill)
                        .frame(width: 156)
                        .clipShape(Rectangle())
                        .shadow(color: Color(UIColor.black.withAlphaComponent(0.3)), radius: 12, x: 0, y: 0)
                }
                .frame(height: 232)
                .cornerRadius(8)
                .padding(4)
        )
    }
}

struct StatusBar: View {
    var body: some View {
        HStack {
            Text("iPod")
                .fontWeight(.semibold)
            Spacer()
            Image(systemName: "play.fill")
                .foregroundColor(.blue)
            Image(systemName: "battery.100")
                .foregroundColor(.green)
        }
        .font(.caption)
        .padding(.vertical, 4)
        .padding(.horizontal, 6)
        .foregroundColor(.secondary)
        .background(Color(UIColor.secondarySystemBackground))
    }
}

struct Menu: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text("Music")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(.vertical, 4)
                .padding(.horizontal, 6)
                .foregroundColor(.white)
                .background(Color.blue)
                .padding(-6)
                .padding(.bottom, 6)
                
                Text("Videos")
                Text("Photos")
                Text("Podcasts")
                Text("Extras")
                Text("Settings")
                Text("Shuffle Songs")
                Spacer()
            }
            .padding(6)
            .foregroundColor(.black)
            .font(.headline)
        }
        .background(Color.white)
    }
}

struct ClickWheel: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(height: 192)
                .shadow(color: Color(UIColor.black.withAlphaComponent(0.05)), radius: 4, x: 0, y: 0)
                .overlay(
                    Circle()
                        .fill(Color(UIColor.secondarySystemBackground))
                        .frame(width: 80, height: 80)
                        .overlay(
                            Circle()
                                .stroke(Color(UIColor.black.withAlphaComponent(0.1)), lineWidth: 0.5)
                    )
                        .overlay(
                            Circle()
                                .stroke(Color.clear, lineWidth: 2)
                                .shadow(color: Color(UIColor.black.withAlphaComponent(0.05)), radius: 2, x: 0, y: 1)
                                .clipShape(
                                    Circle()
                            )
                    )
            )
            
            VStack(spacing: 0) {
                Text("MENU")
                    .fontWeight(.semibold)
                Spacer()
                HStack {
                    Image(systemName: "backward.end.alt.fill")
                    Spacer()
                    Image(systemName: "forward.end.alt.fill")
                }
                Spacer()
                Image(systemName: "playpause.fill")
            }
            .padding()
            .frame(width: 192, height: 192)
            .foregroundColor(Color(UIColor.tertiaryLabel))
            .font(.footnote)
        }
    }
}

PlaygroundPage.current.setLiveView(iPod())
