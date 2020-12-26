//
//  SideView.swift
//  InstaPhotoMacApp
//
//  Created by Luan Nguyen on 26/12/2020.
//

import SwiftUI

struct SideView: View {
    var screen = NSScreen.main!.visibleFrame
    @State var selected = "Explore"
    @Namespace var animation
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 8) {
                Image("instaphoto")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
                    .cornerRadius(8)
                
                Text("InstaPhoto")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Spacer()
            }
            .padding()
            .padding(.top, 16)
            
            VStack(spacing: 8) {
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                    .padding(4)
                    .background(
                        Circle()
                            .stroke(gradient, lineWidth: 2)
                    )
                    .clipShape(Circle())
                
                VStack(spacing: 4) {
                    Text("Luan Nguyen")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Text("@luannguyen252")
                        .foregroundColor(.gray)
                }
            }
            
            // FOLLOWERS
            HStack {
                VStack(spacing: 4) {
                    Text("5.5K")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text("Posts")
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                
                Divider()
                
                VStack(spacing: 4) {
                    Text("5.5M")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text("Followers")
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                
                Divider()
                
                VStack(spacing: 4) {
                    Text("50")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text("Following")
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
            }
            .frame(height: 50)
            
            // TAB BUTTONS
            Group {
                TabButton(image: "rectangle.grid.2x2.fill", title: "Explore", selected: $selected, animation: animation)
                    .padding(.top)
                
                TabButton(image: "magnifyingglass", title: "Feed", selected: $selected, animation: animation)
                
                TabButton(image: "bell.fill", title: "Notifications", selected: $selected, animation: animation)
                
                TabButton(image: "envelope.fill", title: "Inbox", selected: $selected, animation: animation)
                
                TabButton(image: "arrowtriangle.right.circle.fill", title: "Video", selected: $selected, animation: animation)
                
                TabButton(image: "gearshape.fill", title: "Settings", selected: $selected, animation: animation)
            }
            
            Spacer()
            
            Divider()
                .padding(.horizontal, 16)
            
            Spacer()
            
            TabButton(image: "arrow.up.forward.circle.fill", title: "Logout", selected: .constant(""), animation: animation)
                .padding(.bottom, 16)
        }
        .frame(maxWidth: (screen.width / 1.4) / 3.5, maxHeight: .infinity)
        .background(BlurWindow())
    }
}

#if DEBUG
struct SideView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
