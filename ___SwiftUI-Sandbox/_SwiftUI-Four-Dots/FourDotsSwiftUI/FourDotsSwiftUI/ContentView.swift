//
//  ContentView.swift
//  FourDotsSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 18/02/21.
//  The App Wizard
//  Instagram : theappwizard2408

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
                FinalView()
         
            }
        }
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


























struct FinalView: View {
    @State private var buttontoggle = false
    @State var opac = false
    var body: some View {
        ZStack{
            Color("dark").edgesIgnoringSafeArea(.all)
        ZStack {
            Button(action: {
                            self.buttontoggle.toggle()
                        }) {
                            ButtonTap()
                        }

            if buttontoggle {
                Circle()
                    .foregroundColor(Color("dark"))
                    .opacity(opac ? 0 : 1)
                   
                ButtonView()
               
            }
        }
      }
    }
}

struct ButtonTap: View {
    var body: some View {
        ZStack{
//            Circle()
//                .trim(from: 0, to: 1)
//                .stroke(Color.white, style: StrokeStyle(lineWidth: 10, lineCap: .round)).opacity(0.1)
//                .frame(width: 80, height: 80, alignment: .center)
//                .shadow(color: .black, radius: 6, x: 0.0, y: 0.0)
//                .rotationEffect(.degrees(180))
            
            
            
            Circle()
                .trim(from: 0.247, to: 0.25)
                .stroke(Color("blue"), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .frame(width: 80, height: 80, alignment: .center)
                .shadow(color: .black, radius: 6, x: 0.0, y: 0.0)
                .rotationEffect(.degrees(180))
                
           
            
           
            Circle()
                .trim(from: 0.247, to: 0.25)
                .stroke(Color("pink"), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .frame(width: 80, height: 80, alignment: .center)
                .shadow(color: .black, radius: 6, x: 0.0, y: 0.0)
                .rotationEffect(.degrees(90))
               
           

            
           
            Circle()
                .trim(from: 0.247, to: 0.25)
                .stroke(Color("yellow"), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .frame(width: 80, height: 80, alignment: .center)
                .shadow(color: .black, radius: 6, x: 0.0, y: 0.0)
                .rotationEffect(.degrees(0))
                
             
            
            
              Circle()
                .trim(from: 0.247, to: 0.25)
               .stroke(Color("green"), style: StrokeStyle(lineWidth: 10, lineCap: .round))
               .frame(width: 80, height: 80, alignment: .center)
               .shadow(color: .black, radius: 6, x: 0.0, y: 0.0)
               .rotationEffect(.degrees(-90))
               
           
        }
    }
}


struct ButtonView: View {
    
    @State var search = ""
    @State var opac = false
    @State var opacline = false
   
    
    var body: some View {
        ZStack{
       
            MagAnim()
            
            TextField("Search", text: self.$search)
                 .foregroundColor(.white)
                 .font(.system(size: 56.0))
                  .offset( x: 200)
                  .opacity(opac ? 1 : 0)
                    .animation(Animation.easeInOut(duration: 1).delay(1.5).repeatCount(1))
                            .onAppear(){
                                self.opac.toggle()
                            }
            
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: opacline ? 230 :  0, height: 5, alignment: .center)
                .offset( x: 70 , y : 40)
                .foregroundColor(.gray).opacity(0.4)
                .opacity(opacline ? 1 : 0)
                .animation(Animation.easeInOut(duration: 1).delay(1.5).repeatCount(1))
                          .onAppear(){
                              self.opacline.toggle()
                          }
            
            
            
            
        }
    }
}




struct MagAnim: View {
    @State var rotatecircle = false
    @State var magnifyoff = false
   
    var body: some View {
        ZStack{
          
            MagnifyGlass()
                .rotationEffect(.degrees(rotatecircle ? 0 : 180))
                .animation(Animation.easeInOut(duration: 1).delay(1.5).repeatCount(1))
                        .onAppear(){
                            self.rotatecircle.toggle()
                        }.offset(x: magnifyoff ? -150 : 0, y: 0)
                .animation(Animation.easeInOut(duration: 1).delay(1.5).repeatCount(1))
                        .onAppear(){
                            self.magnifyoff.toggle()
                        }
        }
    }
}




//circle border
struct MagnifyGlass: View {
    
    @State var yellow = false
    @State var pink = false
    @State var blue = false
    @State var green = false
    
    @State var stick = false
    
    var body: some View {
        ZStack{
            
            Circle()
                .trim(from: yellow ? 0 : 0.247, to: 0.25)
                .stroke(Color("yellow"), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .frame(width: 80, height: 80, alignment: .center)
                .shadow(color: .black, radius: 6, x: 0.0, y: 0.0)
                .rotationEffect(.degrees(180))
                .animation(Animation.easeInOut(duration: 1).delay(1.5).repeatCount(1))
                                        .onAppear(){
                                            self.yellow.toggle()
                                                 }
           
            
           
            Circle()
                .trim(from: green ? 0 : 0.247, to: 0.25)
                .stroke(Color("green"), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .frame(width: 80, height: 80, alignment: .center)
                .shadow(color: .black, radius: 6, x: 0.0, y: 0.0)
                .rotationEffect(.degrees(90))
                .animation(Animation.easeInOut(duration: 1).delay(1.5).repeatCount(1))
                                        .onAppear(){
                                            self.green.toggle()
                                                 }
           

            
           
            Circle()
                .trim(from: blue ? 0 : 0.247, to: 0.25)
                .stroke(Color("blue"), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .frame(width: 80, height: 80, alignment: .center)
                .shadow(color: .black, radius: 6, x: 0.0, y: 0.0)
                .rotationEffect(.degrees(0))
                .animation(Animation.easeInOut(duration: 1).delay(1.5).repeatCount(1))
                                        .onAppear(){
                                            self.blue.toggle()
                                                 }
             
            
            
              Circle()
               .trim(from: pink ? 0 : 0.247, to: 0.25)
               .stroke(Color("pink"), style: StrokeStyle(lineWidth: 10, lineCap: .round))
               .frame(width: 80, height: 80, alignment: .center)
               .shadow(color: .black, radius: 6, x: 0.0, y: 0.0)
               .rotationEffect(.degrees(-90))
               .animation(Animation.easeInOut(duration: 1).delay(1.5).repeatCount(1))
                                                .onAppear(){
                                                    self.pink.toggle()
                                                }
           
            
            
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .frame(width: 70, height: 15, alignment: .center)
                . foregroundColor( Color("blue"))
                .rotationEffect(.degrees(45))
                .offset(x: 50, y: 50)
                .scaleEffect(stick ? 1 : 0)
                .animation(Animation.easeInOut(duration: 1).delay(1.5).repeatCount(1))
                                                 .onAppear(){
                                                     self.stick.toggle()
                                                 }
                

        }
    }
}
