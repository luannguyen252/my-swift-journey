//
//  CardView.swift
//  FundTransferApp
//
//  Created by Anik on 24/9/20.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.cardLinear)
                .frame(height: 220)
            
            VStack(alignment: .leading, spacing: 15) {
                HStack(alignment: .top) {
                    Text("Hello, Dimest \nBalance")
                        .font(.system(size: 20, weight: .bold))
                        
                    Spacer()
                    
                    Text("P")
                        .font(.system(size: 30, weight: .heavy))
                        .italic()
                }
                
                Text("$9844.00")
                    .font(.system(size: 30, weight: .heavy))
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 50)
                    
                    HStack {
                        Text("Your Transaction")
                            
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                    }
                    .foregroundColor(.black)
                    .padding(.horizontal)
                }
            }
            .padding(.horizontal)
            .foregroundColor(.white)
        }
    }
}
