//
//  SendView.swift
//  FundTransfer2
//
//  Created by Anik on 29/9/20.
//

import SwiftUI

struct SendView: View {
    @State var amount: String = "30"
    var body: some View {
        VStack(spacing: 0) {
            Text("I want to fund transfer")
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .padding(.bottom, 16)
            
            HStack {
                Text("$")
                    
                TextField("", text: $amount)
                    .frame(width: 80)
            }
            .font(.system(size: 34, weight: .bold, design: .rounded))
            
            //dotted line
            Line()
                .stroke(style: StrokeStyle(lineWidth: 0.5, dash: [2, 3]))
                .frame(width: 200, height: 1)
                .padding(.vertical)
            
            Text("Only within your friends and family \nadded in pay list")
                .font(.system(size: 12, design: .rounded))
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
            
            Button(action: {
                
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 30.0)
                        .fill(Color.orangeColor)
                        .frame(width: 120, height: 60)
                    Text("Send")
                        .bold()
                }
            })
            
        }
        .foregroundColor(.white)
    }
}
