//
//  SideView.swift
//  Instagram Desktop
//
//  Created by Balaji on 23/12/20.
//

import SwiftUI

struct SideView: View {
    
    var screen = NSScreen.main!.visibleFrame
    
    @State var selected = "Explore"
    @Namespace var animation
    
    var body: some View {
        VStack(spacing: 15){
            
            HStack(spacing: 10){
                
                Image("instagram")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                
                Text("Instagram")
                    .font(.custom("Billabong", size: 30))
                
                Spacer()
            }
            .padding()
            .padding(.top,20)
            
            Image("pic")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 65, height: 65)
                .clipShape(Circle())
                .padding(5)
                .background(
                
                    Circle()
                        .stroke(gradient,lineWidth: 2)
                )
                .clipShape(Circle())
            
            Text("iJustine")
                .font(.title)
                .foregroundColor(.white)
            
            Text("@ijustine")
                .foregroundColor(.gray)
            
            // Followers....
            
            HStack{
                
                VStack(spacing: 8){
                    
                    Text("1.2K")
                        .foregroundColor(.white)
                    
                    Text("Posts")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                
                Divider()
                
                VStack(spacing: 8){
                    
                    Text("1.8M")
                        .foregroundColor(.white)
                    
                    Text("Followers")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                
                Divider()
                
                VStack(spacing: 8){
                    
                    Text("22")
                        .foregroundColor(.white)
                    
                    Text("Following")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
            }
            .frame(height: 50)
            
            // Tab Buttons....
            
            Group{
                
                TabButton(image: "rectangle.3.offgrid", title: "Explore", selected: $selected, animation: animation)
                    .padding(.top)
                
                TabButton(image: "magnifyingglass", title: "Feed", selected: $selected, animation: animation)
                
                TabButton(image: "bell", title: "Notifications", selected: $selected, animation: animation)
                
                TabButton(image: "paperplane", title: "Direct", selected: $selected, animation: animation)
                
                TabButton(image: "play.tv", title: "IGTV", selected: $selected, animation: animation)
                
                TabButton(image: "gear", title: "Settings", selected: $selected, animation: animation)
            }
            
            Spacer()
            
            Divider()
                .padding(.horizontal,20)
            
            Spacer()
            
            TabButton(image: "arrow.down.forward.square", title: "Logout", selected: .constant(""), animation: animation)
                .padding(.bottom,20)
        }
        .frame(maxWidth: (screen.width / 1.4) / 3.5, maxHeight: .infinity)
        .background(BlurWindow())
    }
}

struct SideView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
