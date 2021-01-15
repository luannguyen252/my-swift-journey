//
//  AppStoreCard.swift
//  SwiftUI-Projects
//
//  Created by 帝云科技 on 2020/9/15.
//

import SwiftUI

struct AppStoreCard: View {
    var body: some View {
        CardListView()
            .edgesIgnoringSafeArea(.all)
    }
}


struct CardListView: View {
    
    var body: some View {
        ScrollView {
            ForEach(0...10, id: \.self) { _ in
                CardCellView()
            }
        }
    }
}

struct AppStoreCard_Previews: PreviewProvider {
    static var previews: some View {
        AppStoreCard()
    }
}
