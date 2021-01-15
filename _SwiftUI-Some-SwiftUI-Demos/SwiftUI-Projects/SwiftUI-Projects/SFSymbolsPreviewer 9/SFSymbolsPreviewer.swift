//
//  SFSymbolsPreviewer.swift
//  SwiftUI-Projects
//
//  Created by Autumn on 2020/9/13.
//

import SwiftUI
#if os(iOS)
import GridStack
#endif

var weightList: [Font.Weight] = [.ultraLight, .thin, .light, .regular, .medium, .semibold, .bold, .heavy, .black]

#if os(iOS)
struct SFSymbolsPreviewer: View {
    
    @State var selectedWeight: Int = 0
    
    var body: some View {
        VStack {
            GridStack(minCellWidth: 130,
                      spacing: 0,
                      numItems: 100,
                      alignment: .leading) { index, width in
                NavigationLink(
                    destination: SymbolsDetail(symbol: symbols[index], weight: weightList[selectedWeight], colorR: Double.random(in: 0 ..< 1), colorG: Double.random(in: 0 ..< 1), colorB: Double.random(in: 0 ..< 1))) {
                    SymbolsItem(weight: selectedWeight, symbol: symbols[index])
                        .frame(width: width)
                }
                      }
            WeightConverter(weightListSelect: $selectedWeight)
        }
        .navigationBarTitle("SF Symbols")
    }
}

struct SFSymbolsPreviewer_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbolsPreviewer()
    }
}

struct SymbolsItem: View {
    
    let weight: Int
    let symbol: String
    
    var body: some View {
        
        VStack {
            Spacer().frame(height: 20)
            Image(systemName: symbol)
                .foregroundColor(.black)
                .font(.system(size: 40, weight: weightList[weight]))
                .frame(width: 60, height: 60, alignment: .center)
            
            Spacer()
            
            Text(symbol)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .lineLimit(10)
                .frame(height: 100, alignment: .center)
                .padding(.leading)
                .padding(.trailing)
            
            Spacer().frame(height: 20)
        }
    }
}



struct WeightConverter: View {
    
    @Binding var weightListSelect: Int
    
    var body: some View {
        
        HStack {
            Spacer()
            
            Button(action: {
                self.weightListSelect -= 1
            }, label: {
                Image(systemName: "minus.circle")
                    .font(.title)
            })
            .disabled(weightListSelect == 0)
            
            Spacer()
            
            Button(action: {
                self.weightListSelect += 1
            }, label: {
                Image(systemName: "plus.circle")
                    .font(.title)
            })
            .disabled(weightListSelect == weightList.count - 1)
            
            Spacer()
        }.padding()
    }
}

#endif
