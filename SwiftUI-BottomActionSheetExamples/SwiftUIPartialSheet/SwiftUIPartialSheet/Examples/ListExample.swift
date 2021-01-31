//
//  ListExample.swift
//  SwiftUIPartialSheet
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI
import PartialSheet

struct ListExample: View {
    @EnvironmentObject var partialSheetManager: PartialSheetManager

    var body: some View {
        List(0...12, id: \.self) { (index) in
            Button(action: {
                self.partialSheetManager.showPartialSheet({
                    print("dismiss sheet for item \(index)")
                }) {
                     Text("Modify item \(index)")
                }
            }, label: {
                Text("Item: \(index)")
            })
        }
        .navigationBarTitle(Text("List Example"))
    }
}

struct ListExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListExample()
        }
        .addPartialSheet()
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(PartialSheetManager())
    }
}
