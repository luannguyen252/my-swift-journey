//
//  DessertView_pre.swift
//  Chapter08
//
//  Created by Jayant Varma on 19/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct DessertView_pre: View {
    let model: DessertViewModel
    
    init(_ model: DessertViewModel){
        self.model = model
    }
    
    var body: some View {
        HStack {
            Text("\(model.image)")
            VStack {
                Text("\(model.name)")
                Text("\(model.ratings)")
            }
        }
    }
}

struct DessertView_pre_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            Group {
                DessertView_pre(.icecream)
                    .previewDevice("iPhone SE")
                DessertView_pre(.icecream)
                    .previewDevice("iPhone XS")
            }
            
            Group {
                DessertView_pre(.icecream)
                    .previewLayout(.device)
                DessertView_pre(.icecream)
                    .previewLayout(.sizeThatFits)
                DessertView_pre(.icecream)
                    .previewLayout(.fixed(width:200, height: 200))
            }
        }
    }
}
