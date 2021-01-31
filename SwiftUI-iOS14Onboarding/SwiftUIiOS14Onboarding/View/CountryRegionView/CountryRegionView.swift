//
//  CountryRegionView.swift
//  SwiftUIiOS14Onboarding
//
//  Created by Luan Nguyen on 01/01/2021.
//

import SwiftUI

struct CountryRegionView: View {
    // MARK: - PROPERTIES
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: - BODY
    var body: some View {
        List {
            Section {
                VStack(spacing: 24) {
                    HStack {
                        Spacer()
                        Image(systemName: "location.circle")
                            .font(.system(size: 72))
                            .foregroundColor(Color("AccentColor"))
                        Spacer()
                    }
                    
                    Text("Select Your Country or Region")
                        .font(.system(size: 32, weight: .bold))
                        .multilineTextAlignment(.center)
                }
                .padding()
            }
            .listRowInsets(EdgeInsets())
            .listRowBackground(
                colorScheme == .light ?
                    Color(UIColor.secondarySystemBackground) :
                    Color(UIColor.systemBackground)
            )
            
            Section {
                NavigationLink(destination: QuickStartView()) {
                    Text("United States")
                        .font(.headline)
                        .padding(.vertical, 16)
                }
            }
            
            Section {
                ForEach(countriesAndRegions, id: \.self) { countryOrRegion in
                    NavigationLink(destination: QuickStartView()) {
                        Text(countryOrRegion)
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
struct CountryRegionView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRegionView()
    }
}
#endif
