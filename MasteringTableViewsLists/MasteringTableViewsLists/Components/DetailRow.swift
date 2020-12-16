//
//  DetailRow.swift
//  MasteringTableViewsLists
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct DetailRow: View {
    // MARK: - PROPERTIES
    var food: Food
    
    // MARK: - BODY
    var body: some View {
        HStack {
            // MARK: - TITLE AND CAPTION
            VStack(alignment: .leading) {
                Text(food.title)
                    .font(.headline)
                    .padding(.top, 10)
                    Text("\(food.price) $")
                        .font(.caption)
                } //: VSTACK
            
            // MARK: - ADD SPACING
            Spacer()
            
            // MARK: - BUTTON
            Button(action: {
                print("Order received")
            }) {
                Text("ORDER")
                    .foregroundColor(.white)
            }
            .frame(width: 80, height: 50)
            .background(Color.orange)
            .cornerRadius(10.0)
        } //: HSTACK
        .padding(20)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct DetailRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailRow(food: foodData[0])
    }
}
#endif
