//
//  ContentView.swift
//  LikeButtonSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 28/02/21.
//  The App Wizard
//  Instagram : theappwizard2408

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            FinalView().offset(x: 0, y: -20)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}































struct FinalView: View {
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            
            Circle()
                .frame(width: 300, height: 300, alignment: .center)
                .offset(x: -0.5, y : 5)
                .foregroundColor(.gray).opacity(0.2)
           
            LikeButton()
            
            VStack{
                Spacer()
                    .frame(width: 0, height: 700, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("The App Wizard")
                    .font(.title)
                    .fontWeight(.light)
                    .foregroundColor(Color.white).opacity(0.6)
                    
                
            }
            
        }
    }
}

func deg2rad(_ number: Double) -> Double {
    return number * Double.pi / 180
}

struct Spark: Hashable {
    var size: CGFloat = 15
    var x: CGFloat = 0
    var y: CGFloat = 0
    var x2: CGFloat = 0
    var y2: CGFloat = 0
    var duration: Double = 1.5
    var delay: Double = 1.2
    var color: Double
}

struct LikeButton: View {
    @State private var touch: Bool = false
    @State private var start: Bool = false
    @State private var finish: Bool = false

    private var base: Animation = Animation.timingCurve(0.54, 1.65, 0.68, 0.79, duration: 0.5)

    private var positions: [Spark] {
        var arr: [Spark] = []
        let shortDistance: Double = 90
        let longDistance: Double = 110

        for i in 0...6 {
            let angle = (Double(i) * 51) - 8
            let rad = deg2rad(angle)
            arr.append(Spark(
                size: 20,
                x: CGFloat(longDistance * cos(rad)),
                y: CGFloat(longDistance * sin(rad)),
                x2: CGFloat((longDistance + 10) * cos(rad)),
                y2: CGFloat((longDistance + 10) * sin(rad)),
                delay: 1.2,
                color: angle
            ))

            let angle2 = (Double(i) * 51) - 20;
            let rad2 = deg2rad(angle2)
            arr.append(Spark(
                size: 7,
                x: CGFloat(shortDistance * cos(rad2)),
                y: CGFloat(shortDistance * sin(rad2)),
                x2: CGFloat((shortDistance + 10) * cos(rad2)),
                y2: CGFloat((shortDistance + 10) * sin(rad2)),
                duration: 1.2,
                color: angle2
            ))
        }
        return arr
    }

    var body: some View {
        ZStack {
            ZStack {
                sparks

                if !self.finish {
                    Circle()
                        .scale(x: touch ? 1 : 0, y: touch ? 1 : 0, anchor: .center)
                        .foregroundColor(Color(UIColor.systemIndigo))
                        .clipShape(
                            Circle().stroke(lineWidth: 120)
                        )
                        .animation(base.delay(0.3))
                        .clipShape(
                            Circle().stroke(lineWidth: touch ? 0 : 120)
                        )
                        .animation(Animation.easeInOut(duration: touch ? 0.5 : 0).delay(0.5))
                        .frame(width: 120, height: 120)
                }

                ZStack {
                    Image(systemName: "hand.thumbsup.fill")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                        .shadow(color: .gray, radius: 5, x: 0.0, y: 0.0)
                        .scaleEffect(touch ? 0 : 1)
                        .aspectRatio(contentMode: .fit)
                        .opacity(touch ? 0 : 0.4)
                        .foregroundColor(Color(UIColor.systemGray))
                        .animation(base)

                    Image("HeartBG")
                        .resizable()
                        .scaleEffect(touch ? 1 : 0)
                        .aspectRatio(contentMode: .fit)
                        .opacity(touch ? 1 : 0)
                        .mask(
                            Image(systemName: "hand.thumbsup.fill")
                                .resizable()
                                .frame(width: 150, height: 150, alignment: .center)
                                .scaleEffect(touch ? 1 : 0)
                                .aspectRatio(contentMode: .fit)
                        )
                        .animation(Animation.timingCurve(0.17,1.67,0.61,0.77, duration: touch ? 0.8 : 0).delay(touch ? 0.8 : 0))

                    
                    
                    
                    Image(systemName: "hand.thumbsup.fill")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                        .shadow(color: .blue, radius: 5, x: 0.0, y: 0.0)
                        .aspectRatio(contentMode: .fit)
                        .opacity(touch ? 1 : 0)
                        .foregroundColor(Color(UIColor.systemBlue))
                        .animation(Animation.timingCurve(0.54, 1.65, 0.68, 0.79, duration: touch ? 1 : 0).delay(touch ? 2.5 : 0))
                }.frame(width: 80)
   
            }.frame(width: 80)

        }
        .frame(width: 80)
        .onTapGesture{
            if self.start {
                return
            }

            self.touch.toggle()

            if self.touch {
                self.start = true
                self.finish = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.start = false
                    self.finish = true
                }
            } else {
                self.finish = false
            }
        }
    }

    private var sparks: some View {
        ZStack {
            ForEach(positions, id: \.self) { pos in
                Circle()
                    .scaleEffect(x: touch ? 1 : 0.5, y: touch ? 1 : 0.5, anchor: .center)
                    .foregroundColor(Color(UIColor.systemIndigo))
                    .hueRotation(Angle(degrees: touch ? pos.color + 360 : 0))
                    .opacity(touch ? 1 : 0)
                    .offset(x: touch ? pos.x : 0, y: touch ? pos.y : 0)
                    .frame(width: pos.size, height: pos.size)
                    .animation(Animation.timingCurve(0.5, 1, 0.89, 1, duration: touch ? pos.duration : 0).delay(touch ? 0.3 : 0))
                    .opacity(touch ? 0.4 : 1)
                    .hueRotation(Angle(degrees: touch ? pos.color + 360 : 0))
                    .animation(Animation.timingCurve(0.5, 1, 0.89, 1, duration: touch ? 1 : 0).delay(touch ? 1.5 : 0))
                    .scaleEffect(x: touch ? 0 : 1, y: touch ? 0 : 1, anchor: .center)
                    .offset(x: touch ? pos.x2 : 0, y: touch ? pos.y2 : 0)
                    .animation(Animation.timingCurve(0.5, 1, 0.89, 1, duration: touch ? 1.8 : 0).delay(touch ? pos.delay : 0))
            }
        }.frame(width: 20, height: 20)
    }
}


