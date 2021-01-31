//
//  ViewModifierExample.swift
//  SwiftUIPartialSheet
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI
import PartialSheet

struct ViewModifierExample: View {
    @State var isSheetShown = false
    @State var viewContent = "Initial content"
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                self.isSheetShown = true
            }, label: {
                Text("Display the ViewModifier sheet")
            })
            .padding()
            
            Spacer()
        }
        .navigationBarTitle("ViewModifier Example")
        .navigationViewStyle(StackNavigationViewStyle())
        .partialSheet(isPresented: $isSheetShown) {
            ViewModifierView(content: self.$viewContent)
                .padding(.vertical, 50)
        }
    }
}

struct ViewModifierExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ViewModifierExample()
        }
        .addPartialSheet()
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(PartialSheetManager())
    }
}

struct ViewModifierView: View {
    @Binding var content: String
    
    var body: some View {
        VStack {
            Text(content)
            
            Button(action: {
                self.content = "Inner content"
            }, label: {
                Text("Change content")
            })
        }
    }
}
