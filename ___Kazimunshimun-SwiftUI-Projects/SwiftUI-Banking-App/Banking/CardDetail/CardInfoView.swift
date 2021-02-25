//
//  CardInfoView.swift
//  Banking
//
//  Created by Anik on 1/8/20.
//

import SwiftUI

struct CardInfoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ProgressView()
            
            HStack(alignment: .firstTextBaseline, spacing: 0) {
                Text("$")
                    .font(.system(size: 30, weight: Font.Weight.bold, design: Font.Design.rounded))
                    .foregroundColor(ColorConstants.secondary)
                Text("5600")
                    .font(.system(size: 40, weight: Font.Weight.bold, design: Font.Design.rounded))
                    .foregroundColor(.white)
                    .padding(.leading, 10)
                Text(".90")
                    .font(.system(size: 20, weight: Font.Weight.bold, design: Font.Design.rounded))
                    .foregroundColor(ColorConstants.secondary)
            }
            
            HStack(alignment: .firstTextBaseline, spacing: 20) {
                VStack(alignment: .leading, spacing: 30) {
                    Image(systemName: "creditcard.fill")
                    Image(systemName: "banknote.fill")
                    Image(systemName: "dot.radiowaves.right")
                }
                .foregroundColor(ColorConstants.secondary)
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("Bank card")
                    Text("Bank account")
                    Text("Pay")
                }
                .foregroundColor(.white)
            }
        }
    }
}

struct ProgressView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 4.0)
                .fill(ColorConstants.border)
                .frame(width: 50, height: 50)
            
            Circle()
                .trim(from: 0.0, to: 3/5)
                .stroke(style: StrokeStyle(lineWidth: 4.0, lineCap: .round))
                .fill(ColorConstants.graphLine)
                .frame(width: 50, height: 50)
                .rotationEffect(Angle.degrees(-90))
            
            Text("3/5")
                .font(.system(size: 14.0))
                .bold()
                .foregroundColor(.white)
        }
    }
}
