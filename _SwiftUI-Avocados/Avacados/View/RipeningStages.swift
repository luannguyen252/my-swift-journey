//
//  RipeningStages.swift
//  Avacados
//
//  Created by Sandesh on 16/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

struct RipeningStages: View {
    var ripeningStages: [Ripening] = ripeningData
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                Spacer()
                HStack(alignment: .center, spacing: 25){
                    ForEach(ripeningStages) {item in
                        RipeningView(ripening: item)
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 25)
                Spacer()
            }
        }
    }
}

struct RipeningStages_Previews: PreviewProvider {
    static var previews: some View {
        RipeningStages()
    }
}
