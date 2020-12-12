//
//  SideBar.swift
//  PhotoMacApp
//
//  Created by Luan Nguyen on 12/12/2020.
//

import SwiftUI

struct SideBar: View {
    // MARK: - PROPERTIES
    @State var selected = "Home"
    @Namespace var animation

    // MARK: BODY
    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 22) {
                Group {
                    HStack {
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 45, height: 45)
                        
                        Text("Photo Mac App")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Spacer(minLength: 0)
                    } //: HSTACK
                    .padding(.top,35)
                    .padding(.leading,10)
                    
                    // Tab Button
                    TabButton(image: "house.fill", title: "Home", animation: animation, selected: $selected)
                    TabButton(image: "clock.fill", title: "Recents", animation: animation, selected: $selected)
                    TabButton(image: "person.2.fill", title: "Following", animation: animation, selected: $selected)
                    
                    HStack {
                        Text("Insights")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        Spacer()
                    } //: HSTACK
                    .padding()
                    
                    TabButton(image: "message.fill", title: "Messages", animation: animation, selected: $selected)
                    TabButton(image: "bell.fill", title: "Notifications", animation: animation, selected: $selected)
                } //: GROUP
                
                Spacer(minLength: 0)
                
                VStack(spacing: 8) {
                    Image("business")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Button(action: {}, label: {
                        Text("Unlock Business Tools")
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Text("Hurry! Up Now you can unlock our new business tools at your convinence")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,10)
                } //: VSTACK
                
                Spacer(minLength: 0)
                
                //: MARK - PROFILE VIEW
                HStack(spacing: 10) {
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())

                    VStack(alignment: .leading, spacing: 8, content: {
                        Text("Luan Nguyen")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Text("Last Login 12/12/20")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    })

                    Spacer(minLength: 0)

                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding(.vertical,10)
                .padding(.horizontal,8)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: -5)
                .padding(.horizontal)
                .padding(.bottom,20)
            }
            
            Divider().offset(x: -2)
        }
        .frame(width: 240) // Side Bar Default Size
    }
}
