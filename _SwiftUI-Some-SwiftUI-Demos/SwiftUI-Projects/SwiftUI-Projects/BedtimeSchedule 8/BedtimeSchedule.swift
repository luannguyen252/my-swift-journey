//
//  BedtimeSchedule.swift
//  SwiftUI-Projects
//
//  Created by 帝云科技 on 2020/9/11.
//

import SwiftUI

let startColor: Color = Color(red:1.00, green:0.63, blue:0.05)
let endColor: Color = Color(red:1.00, green:0.83, blue:0.03)


struct BedtimeSchedule: View {
    
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ZStack {
                Circle()
                    .stroke(Color.white.opacity(0.2), lineWidth: 40)
                    .frame(width: 300, height: 300)
                
                ZStack {
                    Circle()
                        .trim(from: 0.0, to: 0.5)
                        .stroke(gradient(),
                                style: StrokeStyle(lineWidth: 40, lineCap: .round))
                }
                .frame(width: 300, height: 300)
            }
        }
        
    }
    
    
    func gradient() -> AngularGradient {
        AngularGradient(gradient: Gradient(colors: [startColor, endColor]),
                        center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,
                        startAngle: /*@START_MENU_TOKEN@*/.zero/*@END_MENU_TOKEN@*/,
                        endAngle: /*@START_MENU_TOKEN@*/.degrees(180)/*@END_MENU_TOKEN@*/)
    }
}

struct BedtimeSchedule_Previews: PreviewProvider {
    static var previews: some View {
        BedtimeSchedule()
    }
}

