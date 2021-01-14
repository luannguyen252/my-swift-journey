//
//  ContentView.swift
//  SwiftUIAlertActionSheet
//
//  Created by Alex Nagy on 18/10/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAlert = false
    @State private var showActionSheet = false
    @State private var showSheet = false
    
    var body: some View {
        VStack {
            Button(action: {
                print("Button tapped")
                self.showAlert.toggle()
            }, label: {
                Image("FormToggleSlider")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 200)
                .cornerRadius(10)
            }).alert(isPresented: $showAlert) { () -> Alert in
                Alert(title: Text("Form, toggle and slider"), message: Text("Video is coming soon..."), primaryButton: .default(Text("Subscribe"), action: {
                    print("subscribed")
                }), secondaryButton: .cancel())
            }
            
            Spacer()
            
            Button(action: {
                print("Button tapped")
                self.showActionSheet.toggle()
            }, label: {
                Image("subscribe")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            }).actionSheet(isPresented: $showActionSheet) {
                ActionSheet(title: Text("Subscribe now"), message: Text("Watch SwiftUI tutorials"), buttons: [
                    ActionSheet.Button.default(Text("Subscribe"), action: {
                        print("Subscribed!!!")
                    }),
                    ActionSheet.Button.destructive(Text("Unsubscribe")),
                    ActionSheet.Button.cancel()
                ])
            }
            
            
            Spacer()
            
            Button(action: {
                print("Button tapped")
                self.showSheet.toggle()
            }, label: {
                Image("SwiftUIAlert")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 200)
                .cornerRadius(10)
            }).sheet(isPresented: $showSheet, content: { SheetView() })
            
            
            Spacer()
            
        }
        .padding(.vertical, 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
