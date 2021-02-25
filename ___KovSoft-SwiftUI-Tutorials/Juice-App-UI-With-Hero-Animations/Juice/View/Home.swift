//
//  Home.swift
//  Juice
//
//  Created by Balaji on 03/11/20.
//

import SwiftUI

struct Home: View {
    
    @State var items = [
        
        Item(title: "Besom Lemon Juice", price: "$25.99", discount: "7%", image: "p1"),
        Item(title: "Besom Pine Juice", price: "$15.99", discount: "25%", image: "p2"),
        Item(title: "Besom Orange Juice", price: "$20.99", discount: "10%", image: "p3"),
    ]
    
    @ObservedObject var tabData : TabViewModel
    var animation: Namespace.ID
    
    var body: some View {
        
        VStack{
            
            ZStack{
                
                HStack{
                    
                    Button(action: {}) {
                        
                        Image(systemName: "line.horizontal.3.decrease")
                            .font(.system(size: 24, weight: .heavy))
                            .foregroundColor(.primary)
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        
                        Image(systemName: "bag")
                            .font(.system(size: 24, weight: .heavy))
                            .foregroundColor(.primary)
                    }
                }
                
                Text("Besom")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
            }
            .padding()

            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 20){
                    
                    ForEach(items){item in
                        
                        // Card View....
                        
                        CardView(item: item, tabData: tabData,animation: animation)
                    }
                }
                .padding()
            }
        }
    }
}

// Model And Model Data....
