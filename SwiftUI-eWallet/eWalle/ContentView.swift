//
//  ContentView.swift
//  eWalle
//
//  Created by MR.Robot 💀 on 05/07/2020.
//  Copyright © 2020 Joselson Dias. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State var segueToHome: Bool = false
        
    var body: some View {
        ZStack {
            
            HStack {
                Image("artwork")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, alignment: .leading)
                    .frame(maxHeight: .infinity)
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
                       
            HStack {
                Spacer()
                HStack {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Image("logo")
                            Spacer()
                        }
                        
                        Text("eWalle")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("Open An Account For Digital E-Wallet Solutions.Instant Payouts")
                            .font(.system(size: 20))
                            .foregroundColor(Color(#colorLiteral(red: 0.4922940422, green: 0.4922940422, blue: 0.4922940422, alpha: 1)))
                            .multilineTextAlignment(.leading)
                        
                        Text("Join for free")
                            .foregroundColor(Color(#colorLiteral(red: 0.4922940422, green: 0.4922940422, blue: 0.4922940422, alpha: 1)))
                    }
                    .frame(width: 248)
                    .padding(.trailing, 10)
                    .padding(.leading, 160)
                    Spacer()
                }
            }
            
            
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    Spacer()
                               
                    Button(action: {self.segueToHome.toggle()}) {
                        Text("Sign In")
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                        Image(systemName: "arrow.right")
                            .renderingMode(.original)
                    }
                    .frame(width: 230, height: 55, alignment: .center)
                    .background(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                    .cornerRadius(10)

                    
                    
                    Button(action: {}) {
                    Text("Create an account")
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                    }
                    .frame(width: 250, height: 50, alignment: .center)
                }
            }
            .frame(width: 300, height: 800, alignment: .leading)
            .offset(x: 99)
            
            VStack {
                HomeScreen()
                .background(Color.white)
            }
            .offset(x: self.segueToHome ? 0 : 600)
            .animation(.linear)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
