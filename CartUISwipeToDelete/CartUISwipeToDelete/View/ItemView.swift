//
//  ItemView.swift
//  CartUISwipeToDelete
//
//  Created by Luan Nguyen on 13/12/2020.
//

import SwiftUI

struct ItemView: View {
    // MARK: - PROPERTIES
    @Binding var item: Item
    @Binding var items: [Item]

    // MARK: - BODY
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [Color("lightRed"),Color("darkRed")]), startPoint: .leading, endPoint: .trailing)
            
            // MARK: - DELETE BUTTON
            HStack {
                Spacer()
                Button(action: {
                    withAnimation(.easeIn) { deleteItem() }
                }) {
                    Image(systemName: "trash")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 90, height: 50)
                }
            } //: HSTACK
            
            HStack(spacing: 15) {
                // MARK: PRODUCT IMAGE
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 130, height: 130)
                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 10) {
                    // MARK: - PRODUCT NAME
                    Text(item.name)
                        .font(.title3)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("text"))
                    
                    // MARK: - PRODUCT DETAILS
                    Text(item.details)
                        .fontWeight(.regular)
                        .foregroundColor(Color("text").opacity(0.6))
                    
                    // MARK: - PRODUCT PRICE, PLUS AND MINUS BUTTON
                    HStack(spacing: 15) {
                        // MARK: - PRODUCT PRICE
                        Text(getPrice(value: item.price))
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(Color("text"))
                        
                        Spacer(minLength: 0)
                        
                        // MARK: - MINUS BUTTON
                        Button(action: {
                            if item.quantity > 1{item.quantity -= 1}
                        }) {
                            Image(systemName: "minus")
                                .font(.system(size: 16, weight: .heavy))
                                .foregroundColor(Color("text"))
                        }
                        
                        // MARK: - QUANTITY
                        Text("\(item.quantity)")
                            .fontWeight(.heavy)
                            .foregroundColor(Color("text"))
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background(Color("text").opacity(0.06))
                            .cornerRadius(8)
                        
                        // MARK: - PLUS
                        Button(action: {item.quantity += 1}) {
                            Image(systemName: "plus")
                                .font(.system(size: 16, weight: .heavy))
                                .foregroundColor(Color("text"))
                        }
                    } //: HSTACK
                } //: VSTACK
            } //: HSTACK
            .padding()
            .background(Color("bg1"))
            .contentShape(Rectangle())
            .offset(x: item.offset)
            .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
        }
    }
    
    // MARK: - ON CHANGED
    func onChanged(value: DragGesture.Value) {
        if value.translation.width < 0 {
            if item.isSwiped {
                item.offset = value.translation.width - 90
            }
            else {
                item.offset = value.translation.width
            }
        }
    }
    
    // MARK: - ON END
    func onEnd(value: DragGesture.Value) {
        withAnimation(.easeOut) {
            if value.translation.width < 0 {
                // MARK: - CHECKING
                if -value.translation.width > UIScreen.main.bounds.width / 2 {
                    item.offset = -1000
                    deleteItem()
                }
                else if -item.offset > 50{
                    //: UPDATING IS SWIPING
                    item.isSwiped = true
                    item.offset = -90
                }
                else {
                    item.isSwiped = false
                    item.offset = 0
                }
            }
            else {
                item.isSwiped = false
                item.offset = 0
            }
        }
    }
    
    // MARK: - REMOVING ITEM
    func deleteItem() {
        items.removeAll { (item) -> Bool in
            return self.item.id == item.id
        }
    }
}

// MARK: - GET PRICE
func getPrice(value: Float) -> String {
    let format = NumberFormatter()
    format.numberStyle = .currency
    return format.string(from: NSNumber(value: value)) ?? ""
}
