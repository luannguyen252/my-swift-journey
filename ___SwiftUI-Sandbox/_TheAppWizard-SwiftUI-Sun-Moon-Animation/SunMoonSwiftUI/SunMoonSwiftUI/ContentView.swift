//
//  ContentView.swift
//  SunMoonSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 11/03/21.
//  The App Wizard
//  Instagram : theappwizard2408

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
        SunMoon()
            
            VStack{
                Text("The App Wizard")
                    .font(.title3)
                    .fontWeight(.thin)
                    .foregroundColor(Color.white)
                
                Spacer().frame(width: 100, height: 400, alignment: .center)
                    
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}























struct SunMoon: View {
    @State private var sunMoves = false
    @State private var mask = false
    
    @State private var animbg1 = false
    @State private var animbg2 = false
    
    @State private var blur = false
    @State private var reflection = false
    
    //Change
    let backgroundColor1 = RadialGradient(gradient: Gradient(colors: [.orange, .red]), center: .center, startRadius: 100, endRadius: 1000)
    
    let backgroundColor2 = Color.black
    



    var body: some View {
       
        ZStack {
            Color.black.opacity(1).edgesIgnoringSafeArea(.all)
            
            backgroundColor1.opacity(animbg1 ? 1 : 0)
                .animation(Animation.easeInOut(duration: 6).delay(0.5).repeatCount(1))
                            .onAppear(){
                                self.animbg1.toggle()
                                            }
                
                .edgesIgnoringSafeArea(.all)
            
            backgroundColor2.opacity(animbg2 ? 1 : 0)
                .animation(Animation.easeInOut(duration: 6).delay(1).repeatCount(1))
                            .onAppear(){
                              self.animbg2.toggle()
                                            }
                
                .edgesIgnoringSafeArea(.all)
            
            
             Text("DAY")
                .font(.title2)
                .foregroundColor(.white)
                .offset(x: -150,y: 30)
            
            Text("NIGHT")
                .font(.title2)
                .foregroundColor(.white)
                .offset(x: 150,y: 30)
            
            ZStack {
                
                Circle()
                    .trim(from: 1/2, to: 1)
                    .stroke(style: StrokeStyle(lineWidth: 1.5, dash: [10, 10]))
                    .frame(width:   300, height: 300)
                    .foregroundColor(.white)
                
                Image("sun")
                    .resizable()
                    .frame(width: 80, height: 80, alignment: .center)
                    .font(.title)
                    .foregroundColor(.yellow)
                    .offset(x: -150)
                    .rotationEffect(.degrees(sunMoves ? 170 : 0))
                    .animation(Animation.easeInOut(duration: 5.5).delay(2).repeatForever(autoreverses: false))
                    .onAppear(){
                        self.sunMoves.toggle()
                }
                    
                ZStack {
                    Rectangle()
                      .frame(width:   300, height: 150)
                      .foregroundColor(.yellow)
                        .opacity(0.2)
                      .scaleEffect(x: mask ? 0.9 : 0, y: 1, anchor: .leading)
                      .offset(y: -75)
                        .animation(Animation.easeInOut(duration: 5.5).delay(2).repeatForever(autoreverses: false))
                        .onAppear(){
                            self.mask.toggle()
                    }
                    
                   
                       
                    
                    
                }.frame(width: 300, height: 300)
                .clipShape(Circle())
                  
                Rectangle()
                    .frame(width: 400, height: 2)
                    .foregroundColor(.white)
                    .opacity(0.5)
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.white)
                    .offset(x: -150)
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.white)
                    .offset(x: 150)
                
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 300, height: 300, alignment: .center)
                    .offset( y: 145)
                    .foregroundColor(.yellow)
                    .opacity(0.03)
                    .clipShape(Circle())
                    .opacity(reflection ? 1 : 0)
                    .animation(Animation.easeInOut(duration: 4).delay(0.2).repeatForever())
                                    .onAppear(){
                                        self.reflection.toggle()
                                                    }
                
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 400, height: 500, alignment: .center)
                    .offset( y: 200)
                    .blur(radius: 100)
                    .foregroundColor(.yellow)
                    .opacity(blur ? 0.09 : 0.1)
                    .animation(Animation.easeInOut(duration: 4).delay(0.2).repeatForever())
                                    .onAppear(){
                                        self.blur.toggle()
                                                    }
                   
            }
            
        }
        
        
    }
}

//
