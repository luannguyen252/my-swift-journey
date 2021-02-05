import SwiftUI
import PlaygroundSupport

struct Desktop: View {
    var body: some View {
        ZStack {
//              Image(uiImage: #imageLiteral(resourceName: "IMG_6281.JPG"))
            Color(UIColor.systemBlue)
            macOS()
        }
    }
}

struct macOS: View {
    var body: some View {
        ZStack {
            ZStack {
                Window(title: "System Preferences") {
                    SystemPreferences()
                }
                .draggable()
                
                Window(title: "Finder") {
                    Finder()
                }
                .draggable()
            }
            
            VStack {
                Menu()
                Spacer()
                Dock()
            }
        }
    }
}

struct Window<Content: View>: View {
    @State var title: String
    let viewBuilder: () -> Content
    
    var body: some View {
        VStack {
            Toolbar(title: title)
            viewBuilder()
            Spacer()
        }
        .frame(width: 420, height: 320)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(UIColor.systemFill), lineWidth: 0.5)
        )
            .shadow(color: Color(UIColor.black.withAlphaComponent(0.5)), radius: 16, x: 0, y: 8)
    }
}

struct Menu: View {
    var body: some View {
        HStack(spacing: 16) {
            Text("")
            Text("Finder").fontWeight(.semibold)
            Text("File")
            Text("Edit")
            Text("View")
            Text("Window")
            Text("Go")
            Text("Help")
            Spacer()
            Text("9:41")
        }
        .padding(.horizontal)
        .frame(height: 32)
        .background(Color(UIColor.systemBackground.withAlphaComponent(0.8)))
    }
}

struct Dock: View {
    var body: some View {
        HStack {
            DockIcon(icon: "safari.fill", backgroundColor: UIColor.systemBlue)
            DockIcon(icon: "message.fill", backgroundColor: UIColor.systemGreen)
            DockIcon(icon: "music.note", backgroundColor: UIColor.systemPink)
            DockIcon(icon: "gear", backgroundColor: UIColor.systemGray)
            Divider().frame(height: 40)
            DockIcon(icon: "folder.fill", backgroundColor: UIColor.systemGray2)
        }
        .padding()
        .background(Color(UIColor.systemBackground.withAlphaComponent(0.8)))
        .cornerRadius(24)
        .padding()
        .shadow(color: Color(UIColor.black.withAlphaComponent(0.2)), radius: 8, x: 0, y: 4)
    }
}

struct DockIcon: View {
    @State var icon: String
    @State var backgroundColor: UIColor
    
    var body: some View {
        Image(systemName: "app.fill")
            .font(.system(size: 56))
            .foregroundColor(Color(backgroundColor))
            .overlay(
                Image(systemName: icon)
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(Color(UIColor.white))
        )
    }
}

struct Finder: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                HStack {
                    Spacer()
                    FinderFolder(label: "Applications", icon: "folder.fill")
                    Spacer()
                    FinderFolder(label: "Desktop", icon: "macwindow")
                    Spacer()
                    FinderFolder(label: "Documents", icon: "folder.fill")
                    Spacer()
                }
                HStack {
                    Spacer()
                    FinderFolder(label: "Downloads", icon: "arrow.down.circle.fill")
                    Spacer()
                    FinderFolder(label: "Library", icon: "folder.fill")
                    Spacer()
                    FinderFolder(label: "Music", icon: "music.note")
                    Spacer()
                }
                HStack {
                    Spacer()
                    FinderFolder(label: "Movies", icon: "video.fill")
                    Spacer()
                    FinderFolder(label: "Pictures", icon: "photo.fill")
                    Spacer()
                    FinderFolder(label: "Public", icon: "folder.fill")
                    Spacer()
                }
            }
            .padding()
        }
    }
}

struct FinderFolder: View {
    @State var label: String
    @State var icon: String
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundColor(Color(UIColor.systemBlue.withAlphaComponent(0.5)))
            Text(label)
                .font(.callout)
                .foregroundColor(Color(UIColor.label))
        }
    .frame(width: 92)
    }
}

struct Toolbar: View {
    @State var title: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 24) {
                Stoplights()
                HStack(spacing: 16) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color(UIColor.secondaryLabel))
                    Image(systemName: "chevron.right")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color(UIColor.tertiaryLabel))
                }
                Text(title)
                    .font(.headline)
                
                Spacer()
                
                Image(systemName: "magnifyingglass")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(Color(UIColor.secondaryLabel))
            }
            .padding()
            Divider()
        }
    }
}

struct Stoplights: View {
    var body: some View {
        HStack(spacing: 8) {
            Circle()
                .frame(width: 12, height: 12)
                .foregroundColor(Color(UIColor.systemRed))
            
            Circle()
                .frame(width: 12, height: 12)
                .foregroundColor(Color(UIColor.systemYellow))
            
            Circle()
                .frame(width: 12, height: 12)
                .foregroundColor(Color(UIColor.systemGreen))
        }
    }
}


struct SystemPreferences: View {
    var body: some View {
        VStack(spacing: 4) {
            HStack {
                User(name: "Jordan Singer")
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            
            Divider().background(Color(UIColor.systemFill))
            
            VStack(spacing: 24) {
                HStack {
                    Spacer()
                    Group {
                        Setting(title: "Update", icon: "gear")
                        Spacer()
                        Setting(title: "Network", icon: "network", color: UIColor.systemBlue)
                        Spacer()
                        Setting(title: "Sound", icon: "speaker.wave.2.fill")
                        Spacer()
                        Setting(title: "Battery", icon: "battery.100", color: UIColor.systemGreen)
                    }
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Group {
                        Setting(title: "Keyboard", icon: "keyboard")
                        Spacer()
                        Setting(title: "Printer", icon: "printer.fill")
                        Spacer()
                        Setting(title: "Displays", icon: "display", color: UIColor.systemBlue)
                        Spacer()
                        Setting(title: "Date", icon: "calendar.badge.clock", color: UIColor.systemRed)
                    }
                    Spacer()
                }
            }
            .padding(.vertical, 24)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct User: View {
    @State var name: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 48))
                .foregroundColor(Color(UIColor.systemGray))
            
            VStack(alignment: .leading, spacing: 2) {
                Text(name).font(.headline)
                Text("Apple ID, iCloud, Media & App Store").font(.subheadline)
            }
        }
    }
}

struct Setting: View {
    @State var title: String
    @State var icon: String
    @State var color: UIColor = UIColor.systemGray
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 28))
                .foregroundColor(Color(color))
            
            Text(title)
                .font(.system(.callout))
                .foregroundColor(Color(UIColor.systemGray))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(2)
        }
        .frame(width: 72)
    }
}

struct DraggableView: ViewModifier {
    @State var offset = CGPoint(x: 0, y: 0)
    
    func body(content: Content) -> some View {
        content
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged { value in
                    self.offset.x += value.location.x - value.startLocation.x
                    self.offset.y += value.location.y - value.startLocation.y
            })
            .offset(x: offset.x, y: offset.y)
    }
}

extension View {
    func draggable() -> some View {
        return modifier(DraggableView())
    }
}

PlaygroundPage.current.setLiveView(Desktop())
