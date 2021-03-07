//
//  ContentView.swift
//  WatchAppRatingSwiftUI WatchKit Extension
//
//  Created by Shreyas Vilaschandra Bhike on 05/03/21.
//  The App Wizard
// Instagram : theappwizard2408

import SwiftUI


//Rainbow Gradient
let hueColors = stride(from: 0, to: 1, by: 0.01).map {
        Color(hue: $0, saturation: 1, brightness: 1)
    }

private let gradient = LinearGradient(gradient: Gradient(colors: hueColors),
                        startPoint: .leading,endPoint: .trailing)




struct ContentView: View {
    var body: some View {
        ZStack{
            Color.black.opacity(1).edgesIgnoringSafeArea(.all)
            CircularSlider()
                .offset(x: -0.5, y: -11)
                .rotationEffect(.degrees(180))
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





















struct CircularSlider: View {
    
    @State var progress : CGFloat = 0
    @State var angle : Double = 0
    
    var body: some View{
        
        VStack{
            ZStack{
                Circle()
                    .stroke(Color.gray.opacity(0.2),style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                    .frame(width: 140, height: 140)
                
                
                
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(gradient,style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: 140, height: 140)
                    .rotationEffect(.init(degrees: -90))
                
                
                
                
                // Drag Circle...
                
               Image("rs")
                .resizable()
                    .frame(width: 40, height: 40)
                    .offset(x: 140 / 2)
                    .rotationEffect(.init(degrees: angle))
                // adding gesture...
                    .gesture(DragGesture().onChanged(onDrag(value:)))
                    .rotationEffect(.init(degrees: -90))
                
                // 100 %
                
                VStack{
                    
                    Text("The App Wizard")
                       .foregroundColor(.white)
                       .font(.system(size: 10))
                       .fontWeight(.regular)
                        .opacity(0.5)
                       .rotationEffect(.degrees(180))
                HStack{
                    
                Text("%")
                   .foregroundColor(.white)
                   .font(.system(size: 20))
                   .fontWeight(.regular)
                    
                    
                Text(String(format: "%.0f", progress * 100))
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .fontWeight(.regular)
                    .rotationEffect(.degrees(180))
                }
                    
                    
               
                }
            }
        }
    }
    
    func onDrag(value: DragGesture.Value){
        let vector = CGVector(dx: value.location.x, dy: value.location.y)
        let radians = atan2(vector.dy - 27.5, vector.dx - 27.5)
        var angle = radians * 180 / .pi
        if angle < 0{angle = 360 + angle}
        withAnimation(Animation.linear(duration: 0.15)){
            
            // progress...
            let progress = angle / 360
            self.progress = progress
            self.angle = Double(angle)
        }
    }
}
