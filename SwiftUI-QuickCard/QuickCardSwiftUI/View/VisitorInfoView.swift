//
//  VisitorInfoView.swift
//  QuickCardSwiftUI
//
//  Created by Umer Khan on 24/10/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import SwiftUI

struct VisitorInfoView: View {
    
    @State var user: User
    @State var isChartHidden: Bool = true
    @State var isChartLoaded: Bool = false
    
    var body: some View {
        
        VStack {
            CardView(user: user)
                
                .gesture(
                    TapGesture()
                        .onEnded {
                            withAnimation(.easeInOut, {
                                self.isChartHidden.toggle()
                            })
                        }
                )
            
            if !isChartHidden {
                GeometryReader { proxy in
                    HStack(alignment: .bottom) {
                        
                        BarView(color: .gray,
                                width: proxy.size.width * 0.16,
                                height: self.isChartLoaded ? proxy.size.height / CGFloat(self.user.visit.views) : 0.0,
                                label: "Views")
                        
                        BarView(color: .gray,
                                width: proxy.size.width * 0.16,
                                height: self.isChartLoaded ? proxy.size.height / CGFloat(self.user.visit.events) : 0.0,
                                label: "Events")
                        
                        BarView(color: .gray,
                                width: proxy.size.width * 0.16,
                                height: self.isChartLoaded ? proxy.size.height / CGFloat(self.user.visit.badges) : 0.0,
                                label: "Badges")
                        
                        BarView(color: .gray,
                                width: proxy.size.width * 0.16,
                                height: self.isChartLoaded ? proxy.size.height / CGFloat(self.user.visit.actions) : 0.0,
                                label: "Actions")
                        
                        BarView(color: .gray,
                                width: proxy.size.width * 0.16,
                                height: self.isChartLoaded ? proxy.size.height / CGFloat(self.user.visit.duration) : 0.0,
                                label: "Duration")
                        
                    }
                    .frame(height: 0.5 * proxy.size.height)
                    .animation(.easeInOut(duration: 1.0))
                    .onAppear {
                        self.isChartLoaded.toggle()
                    }
                    
                }
                .transition(.move(edge: .bottom))
                .onDisappear {
                    self.isChartLoaded.toggle()
                }
                
            }
        }
    }
}

struct VisitorInfoView_Previews: PreviewProvider {
    static var previews: some View {
        VisitorInfoView(user: User(firstName: "Umer", lastName: "Khan", title: "Junior Software Engineer", email: "umerkhan@codesorbit.com", companyUrl: "www.codesorbit.com", address: "Industrial Area Islamabad", visit: Visit(views: 4, events: 8, badges: 5, actions: 3, duration: 6)))
    }
}
