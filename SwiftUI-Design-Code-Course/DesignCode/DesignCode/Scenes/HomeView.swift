//
//  Home.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/22/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var coursesStore: CoursesStore

    @State private var isShowingSidebar = false
    @State private var isShowingProfile = false
    
    var body: some View {
        
        
        ZStack(alignment: .topLeading) {
            NavigationView {

                ScrollView {
                    VStack(alignment: .leading, spacing: 4) {
                        VStack(alignment: .leading) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Courses")
                                    .font(.title)
                                    .fontWeight(.bold)

                                Text("\(coursesStore.courses.count) Courses")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.secondary)
                            }
                            .padding(.leading)
                            .padding(.top)
                            .padding(.bottom, -16)

                            CoursesListView()
                                .blur(radius: isShowingSidebar ? 20 : 0)
                                .scaleEffect(isShowingProfile ? 0.95 : 1)
                                .animation(.default)
                                .padding(.bottom)
                                .padding(.top, -14)
                        }

                        
                        VStack(alignment: .leading, spacing: 4) {
                             Text("Cerfificates")
                                 .font(.title)
                                .fontWeight(.bold)
                                .padding(.leading, 26)
                            
                            CertificatesListView()
                                .environmentObject(CertificatesStore())

                         }
                    }
                }
                .navigationBarTitle("SwiftUI")
                .navigationBarItems(
                    leading: Button(action: {
                        self.isShowingSidebar.toggle()
                    }) {
                        Image(systemName: "list.dash")
                            .imageScale(.large)
                    }
                    .padding()
                )
            }
            

            HeaderButtonsView(
                isShowingSidebar: $isShowingSidebar,
                isShowingProfile: $isShowingProfile
            )
                .animation(.interpolatingSpring(mass: 1, stiffness: 111, damping: 36, initialVelocity: 15))
                .offset(y: isShowingProfile ? 0 : 42)


            SettingsSidebar(isShowing: $isShowingSidebar)
                .padding(.trailing, 60)
                .edgesIgnoringSafeArea(.vertical)
        }
    }
}


private struct HeaderButtonsView: View {
    @Binding var isShowingSidebar: Bool
    @Binding var isShowingProfile: Bool
    
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
            }) {
                Image(systemName: "bell")
            }
            .buttonStyle(FloatingCircleButtonStyle())
            .accessibility(label: Text("Open the settings menu."))
            
            Button(action: {
                self.isShowingProfile.toggle()
            }) {
                Image(systemName: "gear")
            }
            .buttonStyle(FloatingCircleButtonStyle())
            .accessibility(label: Text("Open account settings."))
            
        }
        .imageScale(.large)
        .foregroundColor(.black)
    }
}





struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(CoursesStore())
    }
}
