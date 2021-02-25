//
//  CardView.swift
//  Juice
//
//  Created by Balaji on 03/11/20.
//

import SwiftUI

struct CardView: View {
    var item: Item
    @ObservedObject var tabData : TabViewModel
    var animation: Namespace.ID
    
    @State var isSmall = UIScreen.main.bounds.height < 750
    
    var body: some View {
        
        HStack(spacing: 10){
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text(item.title)
                    .font(isSmall ? .title2 : .title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .lineLimit(2)
                
                Text(item.price)
                    .font(isSmall ? .title : .largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .lineLimit(1)
                
                Button(action: {
                    
                    withAnimation(.spring()){
                        tabData.selectedItem = item
                        tabData.isDetail.toggle()
                    }
                    
                }) {
                    
                    Text("Buy Now")
                        .fontWeight(.heavy)
                        .foregroundColor(Color(item.image))
                        .padding(.vertical)
                        .padding(.horizontal,25)
                        .background(Color.white)
                        .cornerRadius(15)
                }
                .padding(isSmall ? 10 : 15)
            }
            .padding(.leading,10)
            .offset(y: 27)
            
            Spacer(minLength: 0)
            
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: item.image, in: animation)
                .frame(height: UIScreen.main.bounds.height / 3)
        }
        .padding()
        .background(
            Color(item.image)
                .cornerRadius(25)
                .padding(.top,55)
        )
    }
}

