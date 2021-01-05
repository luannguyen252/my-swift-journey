//
//  ProfileView.swift
//  SwiftUIPersonalDashboardUI
//
//  Created by Luan Nguyen on 05/01/2021.
//

import SwiftUI

struct InfoView: Identifiable {
    var id: Int
    let name, career, address, phone, youtube, email, website, instagram: String
}

struct ProfileView: View {
    var info: [InfoView] = [
        .init(
            id: 0,
            name: "Luan Nguyen",
            career: "UX Engineer",
            address: "Private",
            phone: "(+84) 123 4567 8910",
            youtube: "luannguyen252",
            email: "luannt@apple.com",
            website: "www.luannguyen.design",
            instagram: "@luannguyen252"
        )
    ]
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [(Color("color2")),(Color("color3"))]), startPoint: .topTrailing, endPoint: .topLeading))
                    .frame(width: 414, height: 266).cornerRadius(10)

                VStack(spacing: -10) {
                    Image("profile")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .cornerRadius(75)

                    VStack {
                        Text("Luan Nguyen")
                        .bold()
                        .font(.title)
                        .foregroundColor(.white)

                        Text("UX Engineer")
                    }
                }

                Button(action: {
                    print("Button Pressed!")
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 23))
                        .foregroundColor(.white)
                }
                .offset(x: 180, y: -60)

                Button(action: {
                    print("Button Pressed!")
                }) {
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 23))
                        .foregroundColor(.white)
                }
                .offset(x: -170, y: -60)
            }
                
            Form {
                ForEach(info, id: \.id) { inf in
                    Section(header: Text("Personal information:").bold().font(.title)) {
                        VStack {
                            HStack {
                                Text("Name:")
                                    .bold()
                                
                                Text(inf.name)
                                    .foregroundColor(.secondary)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                            }
                        }
                        
                        HStack {
                            Text("Email:")
                                .bold()
                            
                            Text(inf.email)
                                .foregroundColor(.secondary)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        
                        HStack {
                            Text("Phone:")
                                .bold()
                            
                            Text(inf.phone)
                                .foregroundColor(.secondary)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        
                        HStack {
                            Text("Address:")
                                .bold()
                            
                            Text(inf.address)
                                .foregroundColor(.secondary)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        
                        HStack {
                            Text("Career:")
                                .bold()
                            
                            Text(inf.career)
                                .foregroundColor(.secondary)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        
                        HStack {
                            Text("Instagram:")
                                .bold()
                            
                            Text(inf.instagram)
                                .foregroundColor(.secondary)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        
                        HStack {
                            Text("Youtube:")
                                .bold()
                            
                            Text(inf.youtube)
                                .foregroundColor(.secondary)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        
                        HStack {
                            Text("Website:")
                            .bold()
                            
                        Text(inf.website)
                            .foregroundColor(.secondary)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                    }
                }
            }
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
