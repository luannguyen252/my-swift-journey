import SwiftUI
import WebKit
import PlaygroundSupport

struct ContentView: View {
    @State var webView = WebView()
    @State var url = ""
    
    var body: some View {
        VStack {
            NavigationBar(url: $url, load: self.visitURL, refresh: self.refresh)
            
            self.webView
                .cornerRadius(8)
        }
        .padding()
        .accentColor(.primary)
    }
    
    func visitURL() {
        self.webView.visitURL(url: url)
    }
    
    func refresh() {
        self.webView.refresh()
    }
}

struct NavigationBar: View {
    @Binding var url: String
    @State var load: () -> Void
    @State var refresh: () -> Void
    
    var body: some View {
        HStack(spacing: 16) {
            TextField("Enter website", text: $url, onCommit: { self.load() })
                .keyboardType(.URL)
                .autocapitalization(.none)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(12)
                .frame(height: 36)
                .padding(.vertical)
            
            Button(action: { self.refresh() }) {
                Image(systemName: "arrow.clockwise")
                .font(.system(size: 24))
                .foregroundColor(.secondary)
            }
        }
    }
}

struct WebView: UIViewRepresentable {
    var webView = WKWebView()
    
    func makeUIView(context: Context) -> WKWebView {
        webView.allowsBackForwardNavigationGestures = true
        webView.load(URLRequest(url: URL(string: "https://google.com")!))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        // nothing to do
    }
    
    func visitURL(url: String) {
        var website = url
        
        if website.contains(" ") {
            // if URL contains spaces, search Google
            website = "https://google.com/search?q=" + url.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
        } else if !website.contains("http") {
            // add https:// to make valid URL
            website = "https://" + url
        }
        
        webView.load(URLRequest(url: URL(string: website)!))
    }
    
    func refresh() {
        webView.reload()
    }
}

PlaygroundPage.current.setLiveView(ContentView())