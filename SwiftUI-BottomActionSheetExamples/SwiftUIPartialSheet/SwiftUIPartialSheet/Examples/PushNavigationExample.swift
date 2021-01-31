//
//  PushNavigationExample.swift
//  SwiftUIPartialSheet
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI
import PartialSheet

struct PushNavigationExample: View {
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    @State var showNextView: Bool = false
    @State var isSheetShown = false

    var body: some View {
        ZStack {
            NavigationLink(destination: Text("Destination View"), isActive: $showNextView, label: {
                EmptyView()
            })

            Button(action: {
                self.partialSheetManager.showPartialSheet {
                    Button(action: {
                        // self.partialSheetManager.isPresented = false
                        self.isSheetShown = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.33) {
                            self.showNextView = true
                        }
                    }) {
                        Text("Navigation Link")
                    }
                }
            }) {
                Text("Show Partial Sheet")
            }
        }
        .navigationBarTitle(Text("Push Navigation"))
    }
}

struct PushNavigationExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PushNavigationExample()
        }
        .addPartialSheet()
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(PartialSheetManager())
    }
}
