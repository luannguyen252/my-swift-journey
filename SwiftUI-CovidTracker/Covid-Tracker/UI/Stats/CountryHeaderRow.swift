//
//  CountryHeaderRow.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 11.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import SwiftUI

struct CountryHeaderRow: View {
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .center) {
                Text(verbatim: "Country")
                    .font(.subheadline)
                    .frame(width: geometry.size.width / 3)
                Divider()
                Text(verbatim: "Active cases")
                    .font(.subheadline)
                    .frame(width: geometry.size.width / 3 * 2)
            }
            .padding(.trailing, 8)
        }
    }
}

struct CountryHeaderRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryHeaderRow()
    }
}
