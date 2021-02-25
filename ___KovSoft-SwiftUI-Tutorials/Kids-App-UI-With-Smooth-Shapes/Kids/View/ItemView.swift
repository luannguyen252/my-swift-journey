//
//  ItemView.swift
//  Kids
//
//  Created by Balaji on 28/09/20.
//

import SwiftUI

struct ItemView: View {
    var item : Item
    @State var isSmallDevice = UIScreen.main.bounds.height < 750
    var body: some View {
        
        VStack(spacing: 12){
            
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width / 3, height: 150)
            
            HStack(spacing: 8){
                
                Spacer(minLength: 0)
                
                Text(item.title)
                    .font(isSmallDevice ? .system(size: 14) : .none)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.trailing)
                    .lineLimit(2)
                
                Text(item.price)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                    .padding(.horizontal,8)
                    .background(item.color)
                    .clipShape(CustomCorner(corner: [.topLeft,.topRight,.bottomLeft], size: 10))
            }
        }
        .padding(.top)
        .padding(.leading)
        .padding([.bottom,.trailing],5)
        .background(
            item.color.opacity(0.7)
                .clipShape(CustomCorner(corner: [.topLeft,.topRight,.bottomLeft], size: 25))
                .padding(.top,55)
        )
        // CUstom Shape...
    }
}
