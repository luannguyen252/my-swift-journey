//
//  DetailRow.swift
//  FoodDeliveryPart1
//
//  Created by Luan Nguyen on 02/01/2021.
//

import SwiftUI

struct DetailRow: View {
    // MARK: - PROPERTIES
    let food: Food
    
    // MARK: - BODY
    var body: some View {
        HStack {
            // Food title and price
            VStack(alignment: .leading) {
                Text(food.title)
                    .font(.headline)
                    .padding(.top, 10)
                
                Text("\(food.price, specifier: "%2.2f") $")
                    .font(.caption)
            }
            
            Spacer()
            
            // Order button
            Button(action: {
                print("Order received.")
            }) {
                Text("ORDER")
                    .foregroundColor(.white)
            }
            .frame(width: 80, height: 50)
            .background(Color.orange)
            .cornerRadius(10)
        }
        .padding(20)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct DetailRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailRow(food: foodData[0])
            .previewLayout(.sizeThatFits)
    }
}
#endif
