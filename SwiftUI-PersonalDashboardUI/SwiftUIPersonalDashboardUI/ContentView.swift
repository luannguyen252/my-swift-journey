//
//  ContentView.swift
//  SwiftUIPersonalDashboardUI
//
//  Created by Luan Nguyen on 05/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State var segmented = 0
    @State var search = ""
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [(Color("color0")),(Color("color1"))]), startPoint: .topTrailing, endPoint: .topLeading))
                        .frame(width: 414, height: 266).cornerRadius(10)
                    
                    HStack {
                        Image(systemName: "eye.fill")
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text("Home")
                            .bold()
                            .font(.title)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Image(systemName: "bell.fill")
                            .foregroundColor(.white)
                    }
                    .padding(.top, -70)
                    .padding()
                }
                
                VStack {
                    Text("€6.500")
                        .bold()
                        .foregroundColor(.white)
                        .font(.system(size: 50))
                        .offset(x: -10, y: -170)
                    
                    Text("Yesterday's earnings")
                        .foregroundColor(Color.init(.lightGray))
                        .offset(x: -10, y: -170)
                }
                
                ZStack {
                    HStack(spacing: 20) {
                        ZStack {
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 160, height: 70)
                                .cornerRadius(10)
                            
                            VStack {
                                Text("€4.618,50")
                                    .bold()
                                
                                Text("Total assets")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        ZStack {
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 160, height: 70)
                                .cornerRadius(10)
                            
                            VStack {
                                Text("€80.618")
                                    .bold()
                                
                                Text("Accumulated income")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .position(x: 205,y: -110)
                    .shadow(radius: 6)
                }
                
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 400)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    
                    VStack(alignment: .leading, spacing: 30) {
                        Text("Interest rate")
                            .bold()
                        
                        HStack {
                            Text("5.50")
                            
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 250, height:  1)
                        }
                        
                        HStack {
                            Text("6.60")
                                .foregroundColor(.gray)
                            
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 250, height:  1)
                        }
                        
                        HStack {
                            Text("7.70")
                                .foregroundColor(.gray)
                            
                            Rectangle().fill(Color.gray)
                                .frame(width: 250, height:  1)
                        }
                        
                        HStack {
                            Text("8.80")
                                .foregroundColor(.gray)
                            
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 250, height:  1)
                        }
                        
                        HStack {
                            Text("9.90")
                                .foregroundColor(.gray)
                            
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 250, height:  1)
                        }
                    }
                    .offset(x: -20, y: -40)
                    
                    HStack {
                        Text("Mon")
                            .foregroundColor(.gray)
                        
                        Text("Tue")
                            .foregroundColor(.gray)
                        
                        Text("Wed")
                            .foregroundColor(.gray)
                        
                        Text("Thu")
                            .foregroundColor(.gray)
                        
                        Text("Fri")
                            .foregroundColor(.gray)
                        
                        Text("Sat")
                            .foregroundColor(.gray)
                        
                        Text("Sun")
                    }
                    .position(x: 208,y: 310)
                }
                .position(x: 209,y: -11)
               
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 340, height: 70)
                        .cornerRadius(10)
                        .shadow(radius: 8)
                    
                    HStack(spacing: 80) {
                        Text("SELL")
                            .bold()
                            .font(.title)
                        
                        Divider()
                            .background(Color.black)
                            .frame(height: 50)
                        
                        Text("BUY")
                            .bold()
                            .font(.title)
                            .foregroundColor(Color.init(.systemRed))
                    }
                }
                .position(x: 209,y: 59)
            }
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                    }
                }
                .tag(0)
            
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.fill")
                    }
                }
                .tag(1)
        }
        .accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
