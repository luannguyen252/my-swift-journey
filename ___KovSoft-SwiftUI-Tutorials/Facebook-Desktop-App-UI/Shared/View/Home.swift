//
//  Home.swift
//  FB Mac (iOS)
//
//  Created by Balaji on 14/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct Home: View {
    // Screen...
    var screen = NSScreen.main!.visibleFrame
    
    @State var selected = "house.fill"
    @Namespace var animation
    
    var body: some View {
        
        VStack{
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
                HStack{
                    
                    Text("facebook")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("fb"))
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        
                        HStack{
                            
                            Image("logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 35)
                                .clipShape(Circle())
                            
                            Text("Kavsoft")
                                .foregroundColor(.black)
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {}, label: {
                        
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                            .padding(10)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                    })
                    .buttonStyle(PlainButtonStyle())
                    .padding(.leading,8)
                    
                    Button(action: {}, label: {
                        
                        Image("messenger")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(10)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                        
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.vertical)
                .padding(.leading,10)
                .padding(.trailing)
                .padding(.top,12)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: 5)
                
                // Tab View....
                
                HStack{
                    
                    TabButton(image: "house.fill", selected: $selected, animation: animation)
                    
                    TabButton(image: "play.tv", selected: $selected, animation: animation)
                    
                    TabButton(image: "person.circle", selected: $selected, animation: animation)
                    
                    TabButton(image: "person.3.fill", selected: $selected, animation: animation)
                    
                    TabButton(image: "bell", selected: $selected, animation: animation)
                    
                    TabButton(image: "line.horizontal.3", selected: $selected, animation: animation)
                }
            }
            
            HStack{
                
                // Side Tabs Views....
                
                SideTabView()
                
    
                //Post View...
                
                PostView()
                
                // Side Contact Views...
                
                ContactView()
            }
            .frame(maxHeight: .infinity)
        }
        .ignoresSafeArea(.all, edges: .all)
        .frame(width: screen.width / 1.4, height: screen.height - 60)
        .background(Color("bg"))
        .preferredColorScheme(.light)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}













