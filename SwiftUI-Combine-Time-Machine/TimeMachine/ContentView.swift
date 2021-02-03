//
//  ContentView.swift
//  TimeMachine
//
//  Created by Erez Mizrahi on 08/12/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import SwiftUI
import WebKit
import Combine

struct ContentView: View {
    @State var url: String = ""
    @State var timestamp = Date()

    @State var isOpen: Bool = false

    @ObservedObject var exceuter: Executer
    
    
    
    
    
    
    var body: some View {
        NavigationView {
            
            Group {
                if isOpen {
                    WebViewRepresentor(urlString: $url,
                                       timeStamp: $timestamp,
                                       executer: self.exceuter)
                } else {
                    VStack {
                        Header()
                        
                        Group {
                            TextField("Enter URL", text: $url)
                        }
                        .padding(.init(top: 16, leading: 32, bottom: 18, trailing: 32))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        
                        DatePicker("Please Enter Date", selection: $timestamp, displayedComponents: .date)
                            .labelsHidden()
                        
                        NavigationLink(destination: WebViewRepresentor(urlString: $url,
                                                                       timeStamp: $timestamp,
                                                                       executer: self.exceuter)) {
                            Text("Search!")
                                .fontWeight(.bold)
                                .font(.subheadline)
                                .padding()
                                .background(Color.init(UIColor(hexString: "#ae6a01")))
                                .cornerRadius(30)
                                .foregroundColor(.white)
                                .padding(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color.init(UIColor(hexString: "#ae6a01")), lineWidth: 3)
                            )
                        }
                        
                        
                    }
                }
            }.navigationBarTitle(Text("Search For Old Sites"), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(exceuter: Executer())
    }
}


struct WebViewRepresentor: View {
    @Binding var urlString: String
    @Binding var timeStamp: Date
    @ObservedObject var executer: Executer
    
    @State private var isFinishedLoading: Bool = false
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYYMMDDhhmmss"
        return formatter
    }
    
    
    var body: some View {
        Group {
            if executer.urlSite == nil {
                       Text("Loading...")
                   } else {

            WebView(urlString: executer.urlSite?.url ?? "")
        }
    }.onAppear {
        self.executer.getData(urlString: self.urlString, timestamp: self.dateFormatter.string(from: self.timeStamp))
    }
        .onDisappear {
            self.executer.urlSite = nil
        }
}
}


struct WebView : UIViewRepresentable {
    
    let urlString: String
    let webView = WKWebView()
   
    
     func makeUIView(context: Context) -> WKWebView  {
//        let contentController = WKUserContentController()
//           let script = "var el = document.getElementById('wm-ipp-inside'); if (el) el.parentNode.removeChild(el);"
//        let scriptInjection = WKUserScript(source: script as String, injectionTime: WKUserScriptInjectionTime.atDocumentEnd, forMainFrameOnly: false)
//           contentController.addUserScript(scriptInjection)
//           let config = WKWebViewConfiguration()
//           config.userContentController = contentController
  
        guard let url = URL(string: urlString) else { return WKWebView()}
         let request = URLRequest(url: url)
        webView.load(request)
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
    
}


extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

struct Header: View {
    var body: some View {
        Group {
            Image(uiImage: UIImage(named: "furniture")!)
                .resizable()
                .scaledToFit()
                .shadow(radius: 10)
            
            Rectangle()
                .frame(height: 1)
                .padding(.leading, 16)
                .padding(.trailing, 16)
                .blur(radius: 0.4)
                .opacity(0.4)
                .foregroundColor(Color.init(UIColor(hexString: "#ae6a01")))
            
            Text("Welcome to the Time Machine!")
                .font(.title)
                .foregroundColor(.primary)
                .shadow(radius: 2)
                .padding(.top,16)
            Text("lets see how it used to look like...")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

extension Date {
    var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }

    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}
