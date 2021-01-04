//
//  DatePickerExample.swift
//  SwiftUIPartialSheet
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI
import PartialSheet

struct DatePickerExample: View {
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                self.partialSheetManager.showPartialSheet({
                    print("DatePickerExample sheet dismissed")
                }) {
                    DatePickerSheetView()
                }
            }, label: {
                Text("Display the DatePickerExample Sheet")
            })
            .padding()
            
            Spacer()
        }
        .navigationBarTitle("DatePickerExample Example")
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct DatePickerExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DatePickerSheetView()
        }
        .addPartialSheet()
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(PartialSheetManager())
    }
}

struct DatePickerSheetView: View {
    @State private var date: Date = Date()
    
    var body: some View {
        VStack {
            VStack {
                Text("Settings Panel").font(.headline)
                DatePicker("Date", selection: $date)
            }
            .padding()
            .frame(height: 270)
        }
    }
}
