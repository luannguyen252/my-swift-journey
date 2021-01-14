//
//  StoreView.swift
//  TabBarTutorial
//
//  Created by Alpar Matyas on 10/09/2019.
//  Copyright © 2019 Alpar Matyas. All rights reserved.
//

import SwiftUI

struct StoreView: View {
    var body: some View {
        VStack(spacing: 50) {
            StoreItem(image: "image2", text1: "Rebeloper Store", text2: "The Ultimate In-app Purchases Guide for iOS and Swift")
            Divider()
            StoreItem(image: "image3", text1: "YouTube Channel Resources", text2: "Code Better and Get More Downloads")
        }
            
        .padding(20)
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}

struct StoreItem : View {
    
    var image : String
    var text1 : String
    var text2 : String
    
    var body : some View {
        return
            VStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                VStack(alignment: .leading) {
                    Text(text1)
                        .font(.title)
                    //                    .lineLimit(2)
                    Text(text2)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
        }
    }
}
