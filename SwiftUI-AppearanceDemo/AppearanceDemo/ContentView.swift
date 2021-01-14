

import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                List {
                    ForEach(0..<7) {
                        index in
                        NavigationLink(destination: DetailView(text: "Details \(index+1)")) {
                            Image(systemName: "\(index+1).circle.fill")
                                .foregroundColor(Color.accentColor)
                                .imageScale(.large)
                            Text("Item")
                                .font(Font.body.weight(.medium).monospacedDigit())
                        }
                        .listRowBackground(Color.green)
                    }
                }
                .navigationBarTitle("Demo")
                .navigationBarTitleDisplayMode(.large)
                
            }
            .tabItem {
                Image(systemName: "doc.plaintext.fill")
                Text("View 1")
            }
            Text("Second View")
                .tabItem {
                    Image(systemName: "questionmark.diamond.fill")
                    Text("View 2")
                }
        }
    }
}


// MARK: - Detail View
struct DetailView: View {
    var text: String
    var body: some View {
        Text(text)
            .navigationBarTitle(text)
            .navigationBarTitleDisplayMode(.inline)
    }
}


// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}


// MARK: - Navigation Bar Appearance
extension UINavigationController {
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        // Documentation: https://developer.apple.com/documentation/uikit/uinavigationbarappearance
        
        let largeCustomFont = UIFont(name: "Didot", size: 64.0) ?? UIFont.systemFont(ofSize: UIFont.systemFontSize)
        let smallCustomFont = UIFont(name: "Georgia", size: 23.0) ?? UIFont.systemFont(ofSize: UIFont.systemFontSize)
        
        // Standard
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithDefaultBackground()
        standardAppearance.backgroundColor = UIColor.systemPurple
        standardAppearance.titleTextAttributes = [.foregroundColor : UIColor.systemYellow,
                                                  .font : smallCustomFont]
        
        let barButtonAppearance = UIBarButtonItemAppearance()
        barButtonAppearance.configureWithDefault(for: .plain)
        barButtonAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.systemIndigo]
        standardAppearance.backButtonAppearance = barButtonAppearance
        
        navigationBar.standardAppearance = standardAppearance
        
        
        // Compact
        let compactAppearance = UINavigationBarAppearance()
        compactAppearance.configureWithDefaultBackground()
        compactAppearance.backgroundColor = UIColor.systemBlue
        navigationBar.compactAppearance = compactAppearance
        
        
        // Scroll Edge
        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.configureWithDefaultBackground()
        scrollEdgeAppearance.backgroundColor = UIColor.systemYellow
        scrollEdgeAppearance.largeTitleTextAttributes = [.foregroundColor : UIColor.systemPurple,
                                                         .font : largeCustomFont]
        navigationBar.scrollEdgeAppearance = scrollEdgeAppearance
        
    }
    
}


// MARK: - Tab Bar Appearance
extension UITabBarController {
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        // Documentation: https://developer.apple.com/documentation/uikit/uitabbarappearance
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = .systemBlue
        
        let itemAppearance = UITabBarItemAppearance()
        itemAppearance.configureWithDefault(for: .inline)
        
        itemAppearance.normal.iconColor = UIColor.white
        itemAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.white]
        
        itemAppearance.selected.iconColor = UIColor.systemYellow
        itemAppearance.selected.titleTextAttributes = [.foregroundColor : UIColor.systemYellow]
        
        tabBarAppearance.stackedLayoutAppearance = itemAppearance
        
        tabBar.standardAppearance = tabBarAppearance
        
    }
    
}
