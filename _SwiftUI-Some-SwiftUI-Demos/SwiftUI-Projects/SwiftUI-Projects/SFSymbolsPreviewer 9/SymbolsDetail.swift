//
//  SymbolsDetail.swift
//  SwiftUI-Projects
//
//  Created by Autumn on 2020/9/13.
//

import SwiftUI

struct SymbolsDetail: View {
    
    let symbol: String
    let weight: Font.Weight
    
    @State var colorR: Double
    @State var colorG: Double
    @State var colorB: Double
    
    var body: some View {
        
        VStack {
            Spacer()
            Image(systemName: symbol)
                .foregroundColor(Color(red: colorR, green: colorG, blue: colorB))
                .frame(width: 200, height: 200, alignment: .center)
                .font(.system(size: 88, weight: weight))
            Spacer()
            Text(symbol)
                .font(.headline)
            Spacer()
            ValueSilder(colorR: $colorR, colorG: $colorG, colorB: $colorB)
        }
    }
}

struct SymbolsDetail_Previews: PreviewProvider {
    static var previews: some View {
        SymbolsDetail(symbol: symbols[1], weight: .light, colorR: 0.4, colorG: 0.3, colorB: 0.4)
    }
}
