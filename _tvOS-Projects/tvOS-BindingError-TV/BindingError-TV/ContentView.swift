//
//  ContentView.swift
//  BindingError-TV
//
//  Created by Daniel Saidi on 2020-11-12.
//

import SwiftUI
import SwiftUIKit

struct ContentView: View {
    
    @StateObject var context = DemoContext()
    @StateObject var filter = MovieFilter()
    
    @State var isPresented = false
    
    var body: some View {
        HStack {
            VStack {
                Text("Demo-specific model:")
                SimpleSinglePicker(
                    selection: $context.selection,
                    options: DemoOption.allCases)
                    .frame(width: 300)
                Divider()
            }
            
            VStack {
                Text("Real single picker model:")
                SimpleSinglePicker(
                    selection: $filter.years,
                    options: filter.yearOptions)
                    .frame(width: 300)
                Divider()
                
            }
            
            VStack {
                Text("Real multi picker model:")
                SimpleMultiPicker(
                    selection: $filter.ratings,
                    options: filter.ratingOptions)
                    .frame(width: 300)
                Divider()
            }
            
            Button("Sheet", action: { isPresented = true })
            .sheet(isPresented: $isPresented, content: {
                SimplePickerScreen(title: Text("Pick"), okButtonText: "Disabled") {
                    SimpleSinglePicker(
                        selection: $filter.years,
                        options: filter.yearOptions)
                        .frame(width: 300)
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
