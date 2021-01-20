//
//  ContentView.swift
//  Anim404SwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 11/01/21.
//
//
// The App Wizard
// Instagram : theappwizard2408


import SwiftUI


struct ContentView: View {
    var body: some View {
        
        SpaceView()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






























struct SpaceView: View {
    @State private var opacityback = false
    @State private var opacitytext = false
  
    
    var body: some View {
        ZStack{
            Color("Dark").edgesIgnoringSafeArea(.all)
            Image("spacebackground").opacity(0.2)
                .shadow(color: .blue, radius: 4, x: 0.0, y: 0.0)
                .opacity(opacityback ? 1 : 0)
                .animation(Animation.easeIn(duration: 5).delay(2)
                .repeatCount(1))
                 .onAppear(){
                    self.opacityback.toggle()
                    }
            
            VStack{
          
                
            Image("title")
                 .resizable()
                 .frame(width: 350, height: 39, alignment: .center)
                .opacity(opacitytext ? 1 : 0)
                .animation(Animation.easeIn(duration: 3).delay(2)
                .repeatCount(1))
                 .onAppear(){
                    self.opacitytext.toggle()
                }
        
                LostInSpace()
                
                
            Text("THE APP WIZARD")
                .font(.headline)
                .fontWeight(.light)
                .foregroundColor(Color.white)
               
                    
              
         }
    }
 }
    
}
















struct LostInSpace: View {
    @State private var character = false
    @State private var shadow = false
    @State private var eyes = false
    

    var body: some View {
        ZStack{
            
            Image("frame3")
                .resizable()
                .frame(width: 360, height: 300, alignment: .center)
                .offset(x: 7, y: 4)
                .shadow(color: .green, radius: 1, x: 0.0, y: 0.0)
                .offset(y: character ? 0 : 4 )
                .offset(x: character ?  0 : 7 )
                .animation(Animation.easeIn(duration: 1.2).delay(3).repeatCount(1))
                                .onAppear(){
                                    self.character.toggle()
                                }
            
            Image("frame4")
                .resizable()
                .offset(x: 7, y: 4)
                .frame(width: 360, height: 300, alignment: .center)
            
            Image("frame5")
                .resizable()
                .frame(width: 360, height: 300, alignment: .center)
                .shadow(color: .blue, radius: 10, x: 0.0, y: 0.0)
                .opacity(shadow ? 1 : 0)
                .animation(Animation.easeIn(duration: 1.2).delay(4).repeatCount(1))
                                .onAppear(){
                                    self.shadow.toggle()
                                }
            
            PlanetShape()
                .foregroundColor(.white)
                .offset(y: 110)
                .frame(width: 400, height: 60, alignment: .center)
           
            
        }
    }
}


struct PlanetShape: Shape {
var screenCurveture: CGFloat = 30
    var isClip = false
    
    func path(in rect: CGRect) -> Path {
        
        return Path{ path in
            path.move(to: CGPoint(x: rect.origin.x + screenCurveture, y: rect.origin.y +  screenCurveture))
            path.addQuadCurve(to: CGPoint(x: rect.width - screenCurveture, y: rect.origin.y + screenCurveture), control: CGPoint(x: rect.midX, y: rect.origin.y) )
            if isClip{
                path.addLine(to: CGPoint(x: rect.width, y: rect.height))
                path.addLine(to: CGPoint(x: rect.origin.x, y: rect.height))
                path.closeSubpath()
            }
        }
    }
}
