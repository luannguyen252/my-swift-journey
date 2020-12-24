//
//  InfoView.swift
//  CaloryApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct InfoView: View {
    // MARK: - BODY
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
                } //: VSTACK
            } //: HSTACK
        } //: ZSTACK
    }
}

// MARK: - PREVIEW
#if DEBUG
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
#endif
