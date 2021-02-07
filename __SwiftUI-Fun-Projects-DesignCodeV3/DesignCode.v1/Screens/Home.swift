//
//  HomeView.swift
//  DesignCode.v1
//
//  Created by Tee Becker on 10/29/20.
//

import SwiftUI

struct Home: View {
    
    @State var showProfile = false
    @State var viewState = CGSize.zero
    @State var showContent = false
    @EnvironmentObject var user: UserStore
    
    var body: some View {
        ZStack {
            
            // setting background of ZStack
            Color("background2")
                .edgesIgnoringSafeArea(.all)
            
            HomeView(showProfile: $showProfile,
                     showUpdate: .constant(false),
                     showContent: $showContent)
//                .padding(.top, 44) // size of top status bar
                .offset(x: 0, y: showProfile ? -450 : 0)
                .rotation3DEffect(
                    .degrees(showProfile ? Double(viewState.height / 10) - 10 : 0), axis: (x: 10.0, y: 0.0, z: 0.0) )
                .scaleEffect(showProfile ? 0.9 : 1)
                .animation(.spring(response: 0.5, dampingFraction: 0.64, blendDuration: 0))
//                .edgesIgnoringSafeArea(.all)
            
            MenuView(showProfile: $showProfile)
                .background(Color.black.opacity(0.01)) // if set to 0, will not be responsive
                .offset( y: showProfile ? 0 : 1000)
                .offset( y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.64, blendDuration: 0))
                .onTapGesture(count: 1, perform: {
                    showProfile.toggle()
                })
                .gesture(
                    DragGesture().onChanged{ (value) in
                        viewState = value.translation
                    }
                    .onEnded({ value in
                        if viewState.height > 50{
                            showProfile = false
                        }
                        viewState = .zero
                    })
                )
            
            if user.showLogin{
                ZStack {
                    
                    LoginView()
                    
                    VStack {
                        HStack {
                            Spacer()
            
                            Image(systemName: "xmark")
                                .frame(width: 36, height:36)
                                .foregroundColor(.white)
                                .background(Color.black.clipShape(Circle()))
                        }
                        Spacer()
                    }
                    .padding()
                    .onTapGesture(count: 1, perform: {
                        user.showLogin = false
                    })
                }
            }
            
            if showContent{
                BlurView(style: .systemMaterial).edgesIgnoringSafeArea(.all)
                //                Color.white.edgesIgnoringSafeArea(.all)
                CertificatesView()
                // note we are in a Z stack, therefore any Views called will be on top of each other
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Image(systemName: "xmark")
                            .frame(width: 36, height:36)
                            .foregroundColor(.white)
                            .background(Color.black.clipShape(Circle()))
                    }
                    Spacer()
                }
                .offset(x: -16, y: 16)
                .onTapGesture(count: 1, perform: {
                    showContent = false
                })
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            //to preview in dark mode
//            .environment(\.colorScheme, .dark)
            .environmentObject(UserStore())
        
    }
}


struct AvatarButtonView: View {
    // Cannot have a value, needs to be dynamic and shared across multiple views
    @Binding var showProfile: Bool
    @EnvironmentObject var user: UserStore
    
    var body: some View {
        
        VStack{
            if !user.isLogged{
                Button(action: {
                    showProfile.toggle()
                }){
                    Image("Avatar")
                        .renderingMode(.original)  // get rid of color tint underneath the image
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
                .padding(5)
            } else{
                Button(action: {
                    user.showLogin.toggle()
                }){
                    Image(systemName: "person")
                        .foregroundColor(.primary)
                        .font(.system(size: 16, weight: .medium))
                        .frame(width: 36, height: 36)
                        .background(Color("background3"))
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1) // first shadow
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10 )
                }
            }
        }
    }
}


struct AlertButtonView: View {
    // created a State for the showUpdate and set default to false
    @State var showUpdate = false
    
    var body: some View {
        Button(action: {
            // passed in showUpdate
            showUpdate.toggle()
        }){
            Image(systemName: "bell")
                //                .renderingMode(.original)  // get rid of color tint
                .foregroundColor(.primary)
                .font(.system(size: 16, weight: .medium))
                .frame(width: 36, height: 36)
                .background(Color("background3"))
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1) // first shadow
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10 )
            
        }
        
        // when button is pressed, i want to summon MenuView()
        // modal presentation:
        .sheet(isPresented: $showUpdate){
            UpdateList()
        }
    }
}

let screen = UIScreen.main.bounds
