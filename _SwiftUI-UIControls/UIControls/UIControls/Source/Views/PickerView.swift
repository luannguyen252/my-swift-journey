//
//  PickerView.swift
//  UIControls
//
//  Created by Sud on 6/19/19.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import SwiftUI

enum Country: String, CaseIterable, Hashable {
    case none
    case china
    case india
    case uk
    case us
}

struct PickerView : View {
    @State var selectedValue = Country.none
    
    var body: some View {
        VStack {
            Text("Selected country - \(selectedValue.rawValue)").padding(.top)
            Divider()
            Picker(selection: $selectedValue, label: Text("")) {
                ForEach(Country.allCases, id: \.self) { country in
                    HStack {
                        Spacer()
                        Text(country.rawValue).tag(country)
                        Spacer()
                    }
                }
            }
            List {
                Section {
                    Picker(selection: $selectedValue, label: Text("Select a country")) {
                        ForEach(Country.allCases, id: \.self) { country in
                            Text(country.rawValue).tag(country)
                        }
                    }
                }
            }
        }
        .navigationBarTitle(Text("Picker"))
    }
}

#if DEBUG
struct PickerView_Previews : PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
#endif
