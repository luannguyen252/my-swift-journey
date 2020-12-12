//
//  SplashScreen.swift
//  AnimatedSplashScreen
//
//  Created by Luan Nguyen on 12/12/2020.
//

import SwiftUI

struct SplashScreen: View {
    // MARK: - PROPERTIES
    @State var show = false
    @State var phNo = ""
    
    // MARK: - BODY
    var body: some View {
        VStack {
            ZStack {
                Color("bg")
                    .ignoresSafeArea()
                
                VStack {
                    AnimatedView(show: $show)
                        .frame(height: UIScreen.main.bounds.height / 2)
                        .padding(.bottom, -35)
                    
                    VStack {
                        HStack {
                            VStack(alignment: .leading, spacing: 16, content: {
                                Text("Login")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                
                                Text("Enter your phone number to continue")
                                    .foregroundColor(.gray)
                            })
                            Spacer(minLength: 15)
                        } //: VSTACK
                        
                        VStack {
                            HStack(spacing: 15) {
                                Text("+84")
                                    .foregroundColor(.black)
                                
                                Rectangle()
                                    .fill(Color("bg"))
                                    .frame(width: 1, height: 18)
                                
                                TextField("", text: $phNo)
                            }
                            
                            Divider()
                                .background(Color("bg"))
                        } //: VSTACK
                        .padding(.vertical)
                        
                        Button(action: {}, label: {
                            Text("Verify Your Number")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical,10)
                                .frame(width: UIScreen.main.bounds.width - 60)
                                .background(Color("bg"))
                                .clipShape(Capsule())
                        })
                        
                        HStack {
                            Rectangle()
                                .fill(Color.black.opacity(0.3))
                                .frame(height: 1)
                            
                            Text("OR")
                                .fontWeight(.bold)
                                .foregroundColor(Color.black.opacity(0.3))
                            
                            Rectangle()
                                .fill(Color.black.opacity(0.3))
                                .frame(height: 1)
                        } //: HSTACK
                        .padding(.vertical,10)
                        
                        HStack(spacing: 20) {
                            Button(action: {}, label: {
                                HStack(spacing: 16) {
                                    Image("fb")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 25)
                                    
                                    Text("Facebook")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                .padding(.vertical, 16)
                                .frame(width: (UIScreen.main.bounds.width - 80) / 2)
                                .background(Color("fb"))
                                .clipShape(Capsule())
                            })
                            
                            Button(action: {}, label: {
                                HStack(spacing: 16) {
                                    Image("google")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 25)
                                    
                                    Text("Google")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                .padding(.vertical, 16)
                                .frame(width: (UIScreen.main.bounds.width - 80) / 2)
                                .background(Color("google"))
                                .clipShape(Capsule())
                            })
                        } //: HSTACK
                    } //: VSTACK
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding()
                    .frame(height: show ? nil : 0)
                    .opacity(show ? 1 : 0)
                } //: VSTACK
            } //: ZSTACK
        } //: VSTACK
    }
}
