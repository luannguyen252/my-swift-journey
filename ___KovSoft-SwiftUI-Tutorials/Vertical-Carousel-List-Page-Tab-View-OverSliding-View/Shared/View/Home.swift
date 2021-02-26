//
//  Home.swift
//  Scroll_Animation (iOS)
//
//  Created by Balaji on 25/02/21.
//

import SwiftUI

struct Home: View {
    // Page tab Bar has a bug that it bounces....
    // but we have solution for it
    // but it disables all scroll bounces in whole app...
    // Hope SwiftUI 3.0 will solve this...
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    @State var currentPage = 1
    
    var body: some View {
        
        // Page tab view again has a bug...
        // that dosent ignore top edge...
        // but we have solution for tha...
        
        ScrollView(.init()){
            
            TabView{
                
                GeometryReader{proxy in
                    
                    let screen = proxy.frame(in: .global)
                    
                    // Over Sliding Animation...
                    let offset = screen.minX
                    
                    let scale = 1 + (offset / screen.width)
                    
                    TabView(selection: $currentPage){
                        
                        ForEach(1...5,id: \.self){index in
                            
                            Image("img\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: getRect().width)
                                .cornerRadius(1)
                                .modifier(VerticalTabBarModifier(screen: screen))
                                .tag(index)
                        }
                    }
                    // Page Tab Bar...
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    // Vertical Tab Bar....
                    .rotationEffect(.init(degrees: 90))
                    // adjusting width...
                    .frame(width: screen.width)
                    
                    // OverSliding Effect...
                    // Limiting Scale...
                    .scaleEffect(scale >= 0.88 ? scale : 0.88,anchor: .center)
                    .offset(x: -offset)
                    // BlurEffect...
                    .blur(radius: (1 - scale) * 20)
                }
                
                DetailView(currentPage: $currentPage)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .background(Color.black.ignoresSafeArea())
        .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// Extending View to get rect...

extension View{
    
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}

// Edges...
var edges = UIApplication.shared.windows.first?.safeAreaInsets
