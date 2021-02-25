//
//  DatePicker_InForm.swift
//  100Views
//
//  Created by Mark Moeykens on 7/20/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct DatePicker_InForm: View {
    @State private var dateInForm = Date()
    
    var body: some View {
        Form {
            Section(header: Text("DatePicker")
                .font(.largeTitle).padding())
            {
                Text("Used In Forms")
                    .font(.title).foregroundColor(.gray)
                    .padding()
                
                Text("The date picker looks different when used in a form. The first parameter called 'title' is used when in forms and lists.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .listRowBackground(Color.yellow)
                    .font(.title)
                
                DatePicker("DatePicker Collapsed (Default)",
                           selection: $dateInForm,
                           displayedComponents: .date)
                
                DatePicker("DatePicker Expanded (Selected)",
                           selection: $dateInForm,
                           displayedComponents: .date)
            }
        }
    }
}

#if DEBUG
struct DatePicker_InForm_Previews: PreviewProvider {
    static var previews: some View {
        DatePicker_InForm()
    }
}
#endif
