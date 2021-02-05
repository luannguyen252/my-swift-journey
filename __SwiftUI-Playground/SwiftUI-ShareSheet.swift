import SwiftUI
import PlaygroundSupport

struct ShareSheet: View {
    var body: some View {
        VStack(spacing: 0) {
            SheetHeaderView()
                .padding()
            
            Divider()
            
            ScrollView {
                PeopleListView()
                Divider()
                AppListView()
                ShareOptionsListView()
            }
        }
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(16)
    }
}

struct SheetHeaderView: View {
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "photo.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .foregroundColor(.secondary)
            
            VStack(alignment: .leading) {
                Text("Photo")
                    .font(.headline)
                Text("Share options")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .foregroundColor(Color(UIColor.systemFill))
        }
    }
}

struct PeopleListView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 24) {
                PersonView(name: "Jordan")
                PersonView(name: "Sarah")
                PersonView(name: "Reggie")
                PersonView(name: "Mason")
                PersonView(name: "Monica")
                PersonView(name: "Darren")
                PersonView(name: "Sadie")
            }
            .padding()
        }
    }
}

struct PersonView: View {
    var name: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Circle()
                    .frame(width: 64, height: 64)
                    .foregroundColor(Color(UIColor.systemFill))
                    .overlay(
                        Text(name.prefix(1))
                        .font(.system(size: 24, weight: .semibold, design: .rounded))
                )
                
                AppView(color: .green, icon: "message.fill")
                .scaleEffect(0.35)
                .offset(x: 20, y: 20)
            }
            
            Text(name)
                .font(.caption)
        }
    }
}

struct AppListView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 24) {
                AppView(name: "AirDrop", color: .blue, icon: "airplayaudio")
                AppView(name: "Messages", color: .green, icon: "message.fill")
                AppView(name: "Mail", color: .blue, icon: "envelope.fill")
                AppView(name: "Notes", color: .yellow, icon: "square.and.pencil")
                AppView(name: "Calendar", color: .red, icon: "calendar")
                AppView(name: "Music", color: .pink, icon: "music.note")
                AppView(name: "Camera", color: .gray, icon: "camera.fill")
            }
            .padding()
        }
    }
}

struct AppView: View {
    var name: String?
    var color: Color
    var icon: String
    
    var body: some View {
        VStack {
            Image(systemName: "app.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 64, height: 64)
                .foregroundColor(color)
                .overlay(
                    Image(systemName: icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
            )
            
            if name != nil {
                Text(name ?? "")
                    .font(.caption)
            }
        }
    }
}

struct ShareOptionsListView: View {
    var body: some View {
        VStack(spacing: 16) {
            ShareOptionView(label: "Copy", icon: "scissors")
                .background(Color(UIColor.tertiarySystemBackground))
                .cornerRadius(12)
            
            VStack(spacing: 0) {
                ShareOptionView(label: "Save to Files", icon: "folder")
                Divider()
                ShareOptionView(label: "Add People", icon: "person.crop.circle.fill")
                Divider()
                ShareOptionView(label: "Export", icon: "square.and.arrow.up")
            }
            .background(Color(UIColor.tertiarySystemBackground))
            .cornerRadius(12)
        }
        .padding()
    }
}

struct ShareOptionView: View {
    var label: String
    var icon: String
    
    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
        }
        .padding()
    }
}

PlaygroundPage.current.setLiveView(ShareSheet())