//
//  ContentView.swift
//  BreathIn Out
//  Created by Shreyas Vilaschandra Bhike on 24/09/20.
//  Copyright © 2020 Shreyas Vilaschandra Bhike. All rights reserved.
//


// Content View File Uploaded In HealthSwiftUI
//github.com/theappwizard



import SwiftUI

struct ContentView: View {
    
    @State private var breathIn = false
    @State private var breathOut = false
    @State private var hold = true
    @State private var circuLarMotion = false
    @State private var displayHold = false
    @State private var displayBreathOut = false
    @State private var hideBreathOut = false
    @State private var hideBreathIn = false
    @State private var hideHold = false
    @State private var displaySecondHold = false
    @State private var hideSecondHold = false
    
    let screenBackground = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    
    var body: some View {
        ZStack {
            ZStack {
                screenBackground
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    Text("HEALTH : BREATH IN - OUT")
                        .font(.largeTitle)
                        .fontWeight(.ultraLight)
                        .foregroundColor(Color.white)
                ZStack {

                    Circle() // Tin color
                        .stroke(lineWidth: 5)
                        .frame(width: 370, height: 370)
                        .foregroundColor(Color.gray)
                    
                    Circle()
                        .trim(from: 0, to: 1/4)
                        .stroke(lineWidth: 5)
                        .frame(width: 370, height: 370)
                        .foregroundColor(Color.green)
                        .rotationEffect(.degrees(-90))
                    
                    Circle()
                        .trim(from: 0, to: 1/4)
                        .stroke(lineWidth: 5)
                        .frame(width: 370, height: 370)
                        .foregroundColor(Color.green)
                        .rotationEffect(.degrees(90))
                    
                    Capsule() // Bottom
                        .trim(from: 1/2, to: 1)
                        .frame(width: 20, height: 25)
                        .foregroundColor(Color.green)
                        .offset(y: 187)
                    
                    Capsule()  // Top
                        .trim(from: 1/2, to: 1)
                        .frame(width: 20, height: 25)
                        .foregroundColor(Color.green)
                        .rotationEffect(.degrees(180))
                        .offset(y: -187)
                        
                    Capsule()  // Top
                        .trim(from: 1/2, to: 1)
                        .frame(width: 20, height: 25)
                        .foregroundColor(Color.green)
                        .rotationEffect(.degrees(-90))
                        .offset(x: 187)
                    
                    Capsule()  // Top
                        .trim(from: 1/2, to: 1)
                        .frame(width: 20, height: 25)
                        .foregroundColor(Color.green)
                        .rotationEffect(.degrees(90))
                        .offset(x: -187)
                    
                
                   
                    ZStack {
                        Circle()  // Path
                            .stroke()
                            .frame(width: 360, height: 360)
                            .opacity(0)
                        
                        Capsule()  // Rotating capsule
                            .trim(from: 1/2, to: 1)
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.yellow)
                            .offset(y: 187)
                            .rotationEffect(.degrees(circuLarMotion ? 360 : 0))
                            .onAppear() {
                                withAnimation(Animation.linear(duration: 16)) {
                                self.circuLarMotion = true
                                }
                                
                                
                        }
                        
                        
                    }
                    
                }.frame(width: 360, height: 360)
                    .scaleEffect(breathIn ? 1 : 0.8)
                    .scaleEffect(hold ? 1 : 1)
                    .scaleEffect(breathOut ? 0.8 : 1)
                }
                    .onAppear() {
                        withAnimation(Animation.linear(duration: 4)){
                        self.breathIn.toggle()
                        
                            
                        }
                        
                        withAnimation(Animation.linear(duration: 4).delay(4)){
                        self.hold.toggle()
                        }
                        
                        withAnimation(Animation.linear(duration: 4).delay(8)){
                        self.breathOut.toggle()
                        
                        }
                        
                        withAnimation(Animation.linear(duration: 4).delay(12)){
                        self.hold.toggle()
                       
                        }
                        
                }
                ZStack {
                    
                    
                    ZStack{
                    Text("BREATH OUT")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .foregroundColor(Color.white)
                        .scaleEffect(1)
                        .opacity(displayBreathOut ? 1 : 0)
                        .opacity(hideBreathOut ? 0 : 1)
                        .onAppear(){
                            withAnimation(Animation.easeInOut(duration: 0.4).delay(8)) {
                                 self.displayBreathOut.toggle()
                            }
                            
                            withAnimation(Animation.easeInOut(duration: 0.4).delay(12)) {
                                 self.hideBreathOut.toggle()
                            }
                    }
                    
                    Text("HOLD")
                        .font(.largeTitle)
                        .fontWeight(.thin) // Second hold
                        .foregroundColor(Color.white)
                        .scaleEffect(1)
                        .opacity(displaySecondHold ? 1 : 0)
                        .opacity(hideSecondHold ? 0 : 1)
                        .onAppear(){
                            withAnimation(Animation.easeInOut(duration: 0.4).delay(12)) {
                                 self.displaySecondHold.toggle()
                            }
                            
                            withAnimation(Animation.easeInOut(duration: 0.4).delay(16)) {
                                 self.hideSecondHold.toggle()
                            }
                    }
                    
                    Text("HOLD")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .foregroundColor(Color.white)
                        .scaleEffect(1)
                        .opacity(displayHold ? 1 : 0)
                        .opacity(hideHold ? 0 : 1)
                        .onAppear(){
                            withAnimation(Animation.easeInOut(duration: 0.4).delay(4)) {
                                 self.displayHold.toggle()
                            }
                            withAnimation(Animation.easeInOut(duration: 0.4).delay(8)) {
                                 self.hideHold.toggle()
                            }
                    }
                    
                    Text("BREATH IN")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .foregroundColor(Color.white)
                        .padding()
                        .opacity(hideBreathIn ? 0 : 1)
                        .animation(Animation.easeInOut(duration: 0.4).delay(4))
                        .onAppear(){
                            self.hideBreathIn.toggle()
                    }
                        
                    
                }
            }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
