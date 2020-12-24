//
//  CardView.swift
//  FundTransferApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct CardView: View {
    // MARK: - BODY
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
                } //: HSTACK
                
                Text("$9844.00")
                    .font(.system(size: 30, weight: .heavy))
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 50)
                    
                    HStack {
                        Text("Your Transaction")
                            
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                    } //: HSTACK
                    .foregroundColor(.black)
                    .padding(.horizontal)
                } //: ZSTACK
            } //: VSTACK
            .padding(.horizontal)
            .foregroundColor(.white)
        } //: ZSTACK
    }
}
