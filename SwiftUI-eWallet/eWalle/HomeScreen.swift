//
//  HomeScreen.swift
//  eWalle
//
//  Created by MR.Robot 💀 on 07/07/2020.
//  Copyright © 2020 Joselson Dias. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {
    @State var homeState = false
    @State var homeButtonDrag = CGSize.zero
    
    var body: some View {
        ZStack {
            
            HStack {
                VStack {
                    HStack {
                        Image("Joselson")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .offset(x: 15, y: 15)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Joselson Dias")
                                .fontWeight(.semibold)
                            Text("London, U.K.")
                        }
                        .offset(x: 15, y: 15)
                    }
                    .frame(width: 260, height: 155)
                    .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .cornerRadius(40)
                    .offset(x: 30)
                    Spacer()
                }
                Spacer()
            }
            .offset(x: -60, y: -10)
            
            
            HStack {
                VStack(alignment: .leading, spacing: 30) {
                    
                    HStack {
                        Text("Home")
                            .font(Font.custom("Avenir Next", size: 24))
                        
                        Rectangle()
                            .fill(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                            .frame(width: 20, height: 35)
                            .offset(x: -112)
                    }
                    Text("Profile")
                        .fontWeight(.semibold)
                        .font(Font.custom("Avenir Next", size: 19))
                    Text("Accounts")
                        .fontWeight(.semibold)
                        .font(Font.custom("Avenir Next", size: 19))
                    Text("Transactions")
                        .fontWeight(.semibold)
                        .font(Font.custom("Avenir Next", size: 19))
                    Text("Stats")
                        .fontWeight(.semibold)
                        .font(Font.custom("Avenir Next", size: 19))
                    Text("Setings")
                        .fontWeight(.semibold)
                        .font(Font.custom("Avenir Next", size: 19))
                    Text("Help")
                        .fontWeight(.semibold)
                        .font(Font.custom("Avenir Next", size: 19))
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image("logout-icon")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 33)
                        Text("Logout")
                            .foregroundColor(Color.black)
                            .font(Font.custom("Avenir Next", size: 29))
                    }
                    .offset(y: 90)
                    
                    Text("Version 2.1.0")
                    .offset(y: 140)
                }
                .padding(.horizontal, 30)
                Spacer()
            }
            
            //Logo and button
            VStack {
                VStack {
                    HStack {
                        Image("logo")

                        Text("eWalle")
                            .font(.title)
                            .fontWeight(.semibold)
                        Spacer()
                        Button(action: {self.homeState.toggle()}) {
                            Image("Union")
                                .renderingMode(.original)
                        }
                    }
                    .padding(.horizontal, 25)
                }


                //Account Overview
                VStack {
                    HStack {
                        Text("Account Overview")
                            .fontWeight(.semibold)
                            .font(Font.custom("Avenir Next", size: 19))
                            .padding(.vertical, 10)
                        Spacer()
                    }


                    HStack() {
                        VStack(alignment: .leading) {
                            Text("20,600")
                                .fontWeight(.semibold)
                                .font(.system(size: 28))
                                .padding(.vertical, 11)
                            Text("Current Balance")
                        }
                        .padding()
                        Spacer()

                        Button(action: {}) {
                            Image("+")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 18, height: 18)
                        }
                        .frame(width: 70, height: 70)
                        .background(Circle())
                        .foregroundColor(Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)))
                        .padding(.horizontal, 25)
                    }
                    .frame(width: 355, height: 136)
                    .background(Color(#colorLiteral(red: 0.9460065038, green: 0.9460065038, blue: 0.9460065038, alpha: 1)))
                    .cornerRadius(12)
                }
                .frame(width: 365)
                .padding(.vertical, 10)

                //Send money
                VStack {
                    HStack {
                        Text("Send Money")
                            .fontWeight(.semibold)
                            .font(Font.custom("Avenir Next", size: 19))
                            .padding(.horizontal, 27)
                            .padding(.vertical, 13)
                        Spacer()
                        Image("Group 75")
                        .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 31, height: 31)
                            .padding(.horizontal, 29)
                    }

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack() {
                            Button(action: {}) {
                                Image("+")
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 18, height: 18)
                            }
                            .frame(width: 70, height: 70)
                            .background(Circle())
                            .foregroundColor(Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)))
                            .padding(.horizontal,18)

                            ForEach(usersSection) { item in

                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                    UserProfileSection(section: item)
                                }
                            }
                            Spacer()
                        }
//                        .frame(width: 413)
                    }
                }
                Spacer()

                VStack {
                    HStack {
                        Text("Services")
                            .fontWeight(.semibold)
                            .font(Font.custom("Avenir Next", size: 19))
                            .padding(.horizontal, 27)
                            .padding(.vertical, 13)
                        Spacer()
                        Image("Vector-1")
                        .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 31, height: 31)
                            .padding(.horizontal, 29)
                    }

                    HStack {
                        ForEach(servicesSection) { item in
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                servicesView(services: item)
                            }
                        }
                    }


                    HStack {
                          ForEach(servicesSecondRow) { item in
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                servicesView(services: item)
                            }
                        }
                    }
                    Spacer()
                }
                .padding(.vertical, -5)


            }
            .padding(.top, 45)
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(radius: 20)
            .rotationEffect(Angle(degrees: homeState ? -15 : 0))
            .offset(x: homeState ? 300 : 0)
            .animation(.spring())
            .gesture(DragGesture().onChanged{ value in
                self.homeButtonDrag = value.translation
                self.homeState = false
            })
            .animation(.easeOut)
//            .edgesIgnoringSafeArea(.all)
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.9030360431, green: 0.9030360431, blue: 0.9030360431, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct UserProfileSection: View {
    var section: Section
    
    var body: some View {
        VStack() {
            section.profileImage
                .renderingMode(.original)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            Text(section.userName)
                .padding(.top, 5)
                .foregroundColor(Color.black)
        }
        .frame(width: 130, height: 150)
        .background(Color(#colorLiteral(red: 0.9460065038, green: 0.9460065038, blue: 0.9460065038, alpha: 1)))
        .cornerRadius(12)
    }
}

struct servicesView: View {
    var services: Services
    
    var body: some View {
        VStack {
            VStack() {
                Image(services.icon)
                    .renderingMode(.original)
                .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
            }
            .frame(width: 70, height: 70)
            .background(Color(#colorLiteral(red: 0.9460065038, green: 0.9460065038, blue: 0.9460065038, alpha: 1)))
            .cornerRadius(12)
            
            Text(services.serviceTitle)
                .frame(width: 83)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                
        }
        .padding(.horizontal, 4)
    }
}

struct Section: Identifiable {
    var id = UUID()
    var userName: String
    var profileImage: Image
}

let usersSection = [
    Section(userName: "Joselson", profileImage: Image("Joselson")),
    Section(userName: "Tokyo", profileImage: Image("Tokyo")),
    Section(userName: "Josh", profileImage: Image("Josh")),
    Section(userName: "Jessica", profileImage: Image("Jessica")),
    Section(userName: "Angelica", profileImage: Image("Angelica"))
]

struct Services: Identifiable {
    var id = UUID()
    var icon: String
    var serviceTitle: String
}

let servicesSection = [
    Services(icon: "Group-70", serviceTitle: "Send Money"),
    Services(icon: "Group-72", serviceTitle: "Receive Money"),
    Services(icon: "Group-73", serviceTitle: "Mobile Payment"),
    Services(icon: "Vector-2", serviceTitle: "Electricity Bill")
]

let servicesSecondRow = [
    Services(icon: "Group-74", serviceTitle: "Cashback Offer"),
    Services(icon: "Group-12", serviceTitle: "Movie Tickets"),
    Services(icon: "Vector-3", serviceTitle: "Flight Tickets"),
    Services(icon: "Union-2", serviceTitle: "More Options")
]
