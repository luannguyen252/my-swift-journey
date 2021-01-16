//
//  ContentView.swift
//  SwiftUI-Gallery
//
//  Created by Luan Nguyen on 16/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                VStack(spacing: 16) {
                    NavigationLink(destination: HelloWorld()) {
                        Text("HelloWorld")
                    }
                    
                    NavigationLink(destination: ActionSheetView()) {
                        Text("ActionSheetView")
                    }

                    NavigationLink(destination: AlertModalView()) {
                        Text("AlertModalView")
                    }
                    
                    NavigationLink(destination: CircleImageView()) {
                        Text("CircleImageView")
                    }
                    
                    NavigationLink(destination: FormView()) {
                        Text("FormView")
                    }
                    
                    NavigationLink(destination: ListBackgroundColorView()) {
                        Text("ListBackgroundColorView")
                    }
                }
                VStack(spacing: 16) {
                    NavigationLink(destination: MapView()) {
                        Text("MapView")
                    }
                    
                    NavigationLink(destination: NavigationList()) {
                        Text("NavigationList")
                    }
                    
                    NavigationLink(destination: OffsetView()) {
                        Text("OffsetView")
                    }
                    
                    NavigationLink(destination: SegmentedControl()) {
                        Text("SegmentedControl")
                    }
                    
                    NavigationLink(destination: ShareSheet()) {
                        Text("ShareSheet")
                    }
                    
                    NavigationLink(destination: SignUpForm()) {
                        Text("SignUpForm")
                    }
                }
                VStack(spacing: 16) {
                    NavigationLink(destination: SocialImageCard()) {
                        Text("SocialImageCard")
                    }
                    
                    NavigationLink(destination: StepperView()) {
                        Text("StepperView")
                    }
                    
                    NavigationLink(destination: TabBarView()) {
                        Text("TabBarView")
                    }
                    
                    NavigationLink(destination: ZStackExample()) {
                        Text("ZStackExample")
                    }
                }
            }
            .navigationBarTitle("SwiftUI Gallery")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
