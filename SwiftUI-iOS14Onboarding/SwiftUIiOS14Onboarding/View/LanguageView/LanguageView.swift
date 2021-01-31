//
//  LanguageView.swift
//  SwiftUIiOS14Onboarding
//
//  Created by Luan Nguyen on 01/01/2021.
//

import SwiftUI

struct LanguageView: View {
    // MARK: - PROPERTIES
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: - BODY
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "globe")
                        .font(.system(size: 72))
                        .foregroundColor(Color("AccentColor"))
                    Spacer()
                }
                .padding(.vertical)
            }
            .listRowInsets(EdgeInsets())
            .listRowBackground(
                colorScheme == .light ?
                    Color(UIColor.secondarySystemBackground) :
                    Color(UIColor.systemBackground)
            )
            
            Section {
                ForEach(languages, id: \.self) { language in
                    NavigationLink(destination: CountryRegionView()) {
                        Text(language)
                            .font(.headline)
                            .padding(.vertical, 16)
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

#if DEBUG
struct LanguageView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageView()
    }
}
#endif
