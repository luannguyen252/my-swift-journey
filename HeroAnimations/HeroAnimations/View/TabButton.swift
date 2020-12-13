//
//  TabButton.swift
//  HeroAnimations
//
//  Created by Luan Nguyen on 13/12/2020.
//

import SwiftUI

struct TabButton: View {
    // MARK: - PROPERTIES
    var title: String
    @Binding var selectedTab: String
    var animation: Namespace.ID
    
    // MARK: - BODY
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selectedTab = title
            }
        }, label: {
            VStack(alignment: .leading, spacing: 8, content: {
                Text(title)
                    .fontWeight(.heavy)
                    .foregroundColor(selectedTab == title ? Color("text") : Color("text").opacity(0.6))
                
                if selectedTab == title {
                    Capsule()
                        .fill(Color("text"))
                        .frame(width: 40, height: 4)
                        .matchedGeometryEffect(id: "Tab", in: animation)
                }
            })
            .frame(width: 100)
        })
    }
}
