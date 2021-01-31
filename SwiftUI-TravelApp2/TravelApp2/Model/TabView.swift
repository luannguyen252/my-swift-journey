//
//  TabView.swift
//  TravelApp2
//
//  Created by Luan Nguyen on 23/12/2020.
//

import SwiftUI

struct TabView: View {
    // MARK: - PROPERTIES
    @State var tab = "Explore"
    @Namespace var animation
    @State var show = false
    @State var selected : Model = data[0]

    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                switch(tab) {
                    case "Explore": HomeView(animation: animation, show: $show, selected: $selected)
                    case "Liked": LikedView()
                    default: AccountView()
                }

                Spacer()

                HStack(spacing: 0) {
                    TabButton(title: "Explore", tab: $tab)
                    Spacer(minLength: 0)
                    TabButton(title: "Liked", tab: $tab)
                    Spacer(minLength: 0)
                    TabButton(title: "Account", tab: $tab)
                } //: HSTACK
                .padding(.top)
                //: FOR SMALLER SIZE IPHONES
                .padding(.bottom, UIApplication.shared.windows.first!.safeAreaInsets.bottom == 0 ? 16 : UIApplication.shared.windows.first!.safeAreaInsets.bottom)
                .padding(.horizontal, 32)
                .background(Color.white)
                .clipShape(RoundedShape(corners: [.topLeft,.topRight]))
            } //: VSTACK
            
            if show {
                Detail(selected: $selected, show: $show, animation: animation)
            }
        } //: ZSTACK
        .edgesIgnoringSafeArea(.all)
        .background(Color("bg").edgesIgnoringSafeArea(.all))
    }
}
