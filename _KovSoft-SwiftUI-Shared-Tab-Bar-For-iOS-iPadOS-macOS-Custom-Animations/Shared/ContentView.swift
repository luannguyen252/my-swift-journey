import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    // Hiding Tab Bar
    init() {
        // UITab bar is not availble for macOS
        #if os(iOS)
        UITabBar.appearance().isHidden = true
        #endif
    }
    
    // Selected Tab
    @State var selectedTab = "SwiftUI"
    
    // For Dark Mode
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        ZStack(alignment: getDevice() == .iPhone ? .bottom : .leading, content: {
            // Since Tab Bar hide option is not avaible so we cant use native tab bar in macOS
            #if os(iOS)
            TabView(selection: $selectedTab) {
                Color.red
                    .tag("SwiftUI")
                    .ignoresSafeArea(.all, edges: .all)
                
                Color.blue
                    .tag("Beginners")
                    .ignoresSafeArea(.all, edges: .all)
                
                Color.yellow
                    .tag("macOS")
                    .ignoresSafeArea(.all, edges: .all)
                
                Color.pink
                    .tag("Contact")
                    .ignoresSafeArea(.all, edges: .all)
            }
            #else
            ZStack {
                // Switch case for changing views
                switch(selectedTab){
                case "SwiftUI": Color.red
                case "Beginners": Color.blue
                case "macOS": Color.yellow
                case "Contact": Color.pink
                default: Color.clear
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            #endif
            
            if self.getDevice() == .iPad || self.getDevice() == .macOS {
                VStack(spacing: 8) {
                    InsideTabBarItems(selectedTab: $selectedTab)
                    
                    Spacer()
                }
                .background(scheme == .dark ? Color.black : Color.white)
            } else {
                // Custom Tab Bar
                HStack(spacing: 0) {
                    InsideTabBarItems(selectedTab: $selectedTab)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(scheme == .dark ? Color.black : Color.white)
            }
        })
        .ignoresSafeArea(.all, edges: getDevice() == .iPhone ? .bottom : .all)
        .frame(width: getDevice() == .iPad || getDevice() == .iPhone ? nil : getScreen().width / 1.6, height: getDevice() == .iPad || getDevice() == .iPhone ? nil : getScreen().height - 150)
    }
}

// Separating TabBar Items For Ease Of Use
struct InsideTabBarItems: View {
    @Binding var selectedTab: String
    
    var body: some View {
        Group {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
                .padding(.horizontal)
                .padding(.top,getDevice() == .iPhone ? 0 : 35)
                .padding(.bottom,getDevice() == .iPhone ? 0 : 15)
            
            TabBarButton(image: "swift", title: "SwiftUI", selectedTab: $selectedTab)
            TabBarButton(image: "book", title: "Beginners", selectedTab: $selectedTab)
            TabBarButton(image: "laptopcomputer", title: "macOS", selectedTab: $selectedTab)
            TabBarButton(image: "person.crop.circle.fill.badge.questionmark", title: "Contact", selectedTab: $selectedTab)
        }
    }
}

struct TabBarButton: View {
    var image: String
    var title: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut){selectedTab = title}
        }, label: {
            VStack(spacing: 8) {
                Image(systemName: image)
                    .font(.system(size: getDevice() == .iPhone ? 32 : 24))
                    // For Dark Mode Adoption
                    .foregroundColor(selectedTab == title ? .white : .primary)
                
                Text(title)
                    .font(.caption)
                    .fontWeight(.semibold)
                    // For Dark Mode Adoption
                    .foregroundColor(selectedTab == title ? .white : .primary)
            }
            .padding(.bottom, 8)
            // Total Four Tabs
            .frame(width: self.getDevice() == .iPhone ? (self.getScreen().width - 75) / 4 : 100, height: 55 + self.getSafeAreaBottom())
            .contentShape(Rectangle())
            // Bottom Up Effect, if iPad Or Mac OS Moving Effect will be from left
            .background(Color("purple").offset(x: selectedTab == title ? 0 : getDevice() == .iPhone ? 0 : -100,y: selectedTab == title ? 0 : getDevice() == .iPhone ? 100 : 0))
        })
        .buttonStyle(PlainButtonStyle())
    }
}

// Getting Screen Width, since were extending View so we can use directly in swiftui body by calling the functions
extension View {
    func getScreen() -> CGRect {
        #if os(iOS)
        return UIScreen.main.bounds
        #else
        return NSScreen.main!.visibleFrame
        #endif
    }
    
    // Safe Area Bottom
    func getSafeAreaBottom() -> CGFloat {
        #if os(iOS)
        return UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 16
        #else
        return 10
        #endif
    }
    
    // Getting Device Type
    func getDevice() -> Device {
        #if os(iOS)
        // Since There is No Direct For Getting iPad OS
        // Alternative Way
        if UIDevice.current.model.contains("iPad") {
            return .iPad
        } else {
            return .iPhone
        }
        #else
        return .macOS
        #endif
    }
}

enum Device {
    case iPhone
    case iPad
    case macOS
}
