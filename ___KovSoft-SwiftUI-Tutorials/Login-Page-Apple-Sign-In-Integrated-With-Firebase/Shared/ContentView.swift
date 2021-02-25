//
//  ContentView.swift
//  Shared
//
//  Created by Balaji on 19/02/21.
//

// Don't Forget to add Google-info.plist
// Also Don't Forget Apple Login Requires Developer's Liscence

import SwiftUI

struct ContentView: View {
    @AppStorage("log_status") var log_Status = false
    var body: some View {

        ZStack{
            if log_Status{
                Home()
            }
            else{
                Login()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
