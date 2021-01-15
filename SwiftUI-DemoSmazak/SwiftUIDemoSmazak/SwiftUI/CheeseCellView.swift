//
//  CheeseCellView.swift
//  SwiftUIDemoSmazak
//
//  Created by Marek Přidal on 03/09/2019.
//  Copyright © 2019 Marek Přidal. All rights reserved.
//

import SwiftUI

struct CheeseCellView: View {
    let cheese: Cheese
    
    var body: some View {
        HStack {
            Group {
                Image(systemName: cheese.type == .standard ? "heart.fill" : "heart.slash")
                    .padding()
                    .background(Circle().fill(Color.red))
            }
            .padding(.trailing, 15)
            VStack(alignment: .leading) {
                Text(cheese.formattedDate)
                    .font(.system(size: 13))
                    .fontWeight(.medium)
                    .padding(.bottom, 5)
                Text(cheese.localizedName)
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .padding(.bottom, 5)
                Text(cheese.formattedWeight)
                    .textStyle(SmallRedTextStyle())
                    .padding(.bottom, 5)
            }
            .layoutPriority(1.0)
            Spacer()
            Text(cheese.formattedPrice)
        }
    }
}

struct CheeseCellView_Previews: PreviewProvider {
    static var previews: some View {
        CheeseCellView(cheese: Cheese(currencyCode: "CZK", date: Date(), price: 150, type: .ermine, weight: 170))
    }
}
