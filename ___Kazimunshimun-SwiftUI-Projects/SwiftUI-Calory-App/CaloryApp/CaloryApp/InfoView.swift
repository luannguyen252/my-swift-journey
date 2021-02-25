//
//  InfoView.swift
//  CaloryApp
//
//  Created by Anik on 30/6/20.
//  Copyright © 2020 a7studio. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        ZStack {
            Rectangle()
            .foregroundColor(.clear)
            HStack {
                Spacer(minLength: 20)
                VStack(alignment: .leading) {
                    Spacer()
                    NumberDataView(name: "EATEN", value: "765", isGramPresent: false, nameFontSize: 12, valueFontSize: 42)
                    Spacer()
                    NumberDataView(name: "burned", value: "023", isGramPresent: false, nameFontSize: 12, valueFontSize: 42)
                    Spacer()
                    NumberDataView(name: "carbs", value: "343", isGramPresent: true, nameFontSize: 12, valueFontSize: 42)
                    Spacer()
                    NumberDataView(name: "protein", value: "124", isGramPresent: true, nameFontSize: 12, valueFontSize: 42)
                    Spacer()
                }
            }
            
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
