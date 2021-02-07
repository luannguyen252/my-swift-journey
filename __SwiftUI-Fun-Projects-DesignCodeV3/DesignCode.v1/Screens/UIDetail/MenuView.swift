//
//  MenuView.swift
//  DesignCode.v1
//
//  Created by Tee Becker on 10/29/20.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var user: UserStore
    @Binding var showProfile: Bool
    
    var body: some View {
         
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                Text("Meng - 28% completed")
                    .foregroundColor(Color("secondary"))
                    .font(.caption)
                    .bold()
                    
                
                // white part of the bar
                Color.white.frame(width: 38, height: 6)
                    .cornerRadius(3)
                    
                    // gray frame of the white bar
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.08))
                    .cornerRadius(3)
                    .padding()
                    
                    //final outside layer of bar
                    .frame(width: 150, height: 24)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(12)
                
                TextRow(SFSymbolName: "gear", text: "Account")
                TextRow(SFSymbolName: "creditcard", text: "Billing")
                TextRow(SFSymbolName: "person.crop.circle", text: "Sign out")
                    .onTapGesture(count: 1, perform: {
                        UserDefaults.standard.set(false, forKey: "isLogged")
                        user.isLogged = false
                        showProfile = false
                    })
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(BlurView(style: .systemMaterial)
//                LinearGradient(gradient: Gradient(colors: [Color("background3"), Color("background3")]), startPoint: .top, endPoint: .bottom)
            )
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color(.black).opacity(0.2), radius: 20, x: 0, y: 20)
            .padding(.horizontal, 30)
            .overlay(Image("Avatar")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle()).offset(x: 0, y: -150)
            )
            
        }
        .padding(.bottom, 30)
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(showProfile: .constant(true))
            .environmentObject(UserStore())
    }
}


struct TextRow: View {
    var SFSymbolName: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: SFSymbolName)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(Color("secondary"))
            
            Text(text)
                .font(.system(size: 20))
                .bold()
                .frame(width: 120, alignment: .leading)
        }
    }
}
