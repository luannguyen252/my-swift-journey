//
//  SFSymbolsPreviewer2.swift
//  SwiftUI-Projects
//
//  Created by 帝云科技 on 2020/9/14.
//

import SwiftUI
#if os(iOS)
import QGrid
#endif

struct Symbols: Identifiable {
    var id: Int
    var value: String
    
    static func map() -> [Symbols] {
        symbols.map {
            Symbols(id: symbols.firstIndex(of: $0)!, value: $0)
        }
    }
}

#if os(iOS)
struct SFSymbolsPreviewer2: View {
    
    @State var selectedWeight: Int = 0
    
    var body: some View {
        let symbols = Symbols.map()
        VStack {
            QGrid(symbols, columns: 4) {
                SymbolsItem(weight: selectedWeight, symbol: $0.value)
            }
            WeightConverter(weightListSelect: $selectedWeight)
        }
    }
}

struct SFSymbolsPreviewer2_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbolsPreviewer2()
    }
}
#endif
