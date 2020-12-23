//
//  ContentView.swift
//  DarkModeTest
//
//  Created by Luan Nguyen on 23/12/2020.
//

import SwiftUI

// MARK: - DARK MODE ENABLE
extension UIViewController {
    var isDarkModeEnabled: Bool {
        return traitCollection.userInterfaceStyle == .dark
    }
}

struct ContentView: View {
    // MARK: - PROPERTIES
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color(UIColor(named: "accentColor")!)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Now, is")
                            .font(.system(size: 32, weight: .black))
                            .foregroundColor(Color(UIColor(named: "labelColor")!))
                            .multilineTextAlignment(.leading)
                        
                        Text(colorScheme == .light ? "Light" : "Dark")
                            .font(colorScheme == .light ? Font.system(size: 40, weight: .light) : Font.system(size: 40, weight: .heavy))
                            .foregroundColor(Color(UIColor(named: "labelColor")!).opacity(0.75))
                            .multilineTextAlignment(.leading)
                            .padding(.top, 20)
                            .frame(width: 250)
                    } //: VSTACK
                    .padding(.trailing, 80)
                } //: HSTACK
               
                Spacer()
                
                Text("a little work with 🔛")
                    .foregroundColor(Color(UIColor(named: "labelColor")!).opacity(0.5))
                    .font(.system(size: 17, weight: .regular))
                    .italic()
                    .padding(.top, 16)
                    .padding(.bottom, 16)
            } //: VSTACK
        } //: ZSTACK
    }
}

#if DEBUG
// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .light)

            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
}
#endif
