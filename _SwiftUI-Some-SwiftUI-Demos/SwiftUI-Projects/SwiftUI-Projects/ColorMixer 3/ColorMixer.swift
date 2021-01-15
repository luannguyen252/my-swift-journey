//
//  ColorMixer.swift
//  SwiftUI-Projects
//
//  Created by 帝云科技 on 2020/9/10.
//

import SwiftUI

struct ColorMixer: View {
    
    @State var colorR: Double
    @State var colorG: Double
    @State var colorB: Double
    
    var body: some View {
        ZStack {
            ColorPanel(colorR: colorR, colorG: colorG, colorB: colorB)
            VStack {
                ValuePanel(colorR: colorR, colorG: colorG, colorB: colorB)
                Spacer()
                ValueSilder(colorR: $colorR, colorG: $colorG, colorB: $colorB)
                    .padding(.bottom, 50)
            }
        }
    }
}


struct ColorMixer_Previews: PreviewProvider {
    static var previews: some View {
        ColorMixer(colorR: 0.3, colorG: 0.3, colorB: 0.5)
    }
}


struct ColorPanel: View {
    
    let colorR: Double
    let colorG: Double
    let colorB: Double
    
    var body: some View {
        Rectangle()
            .foregroundColor(.init(red: colorR, green: colorG, blue: colorB))
            .edgesIgnoringSafeArea(.all)
    }
}


struct ValuePanel: View {
    
    let colorR: Double
    let colorG: Double
    let colorB: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(height: 100)
                .foregroundColor(Color(red: 1.25 - (colorR + colorG * 2.0 + colorB) / 3.0, green: 1.25 - (colorR + colorG * 2.0 + colorB) / 3.0, blue: 1.25 - (colorR + colorG * 2.0 + colorB) / 3.0, opacity: 0.5))
            
            HStack {
                Text("R: \(Int(colorR * 255.0))")
                Text("G: \(Int(colorG * 255.0))")
                Text("B: \(Int(colorB * 255.0))")
            }
            .font(.system(size: 32, weight: .regular))
            .foregroundColor(Color(red: colorR, green: colorG, blue: colorB))
        }
        .padding(32)
        .padding(.top, 50)
    }
}



struct ValueSilder: View {
    
    @Binding var colorR: Double
    @Binding var colorG: Double
    @Binding var colorB: Double
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(15)
            VStack {
                SliderBar(value: $colorR, imageName: "r.circle", color: .red)
                SliderBar(value: $colorG, imageName: "g.circle", color: .green)
                SliderBar(value: $colorB, imageName: "b.circle", color: .blue)
            }
            .padding()
        }
        .padding(32)
        .frame(height: 300)
    }
}


struct SliderBar: View {
    
    @Binding var value: Double
    @State var imageName: String
    @State var color: Color
    
    var body: some View {
        
        HStack {
            Image(systemName: imageName)
                .foregroundColor(color.opacity(0.5))
                .font(.system(size: 20))
            Slider(value: $value, in: 0.0...1.0)
                .accentColor(color)
            Image(systemName: "\(imageName).fill")
                .foregroundColor(color)
                .font(.system(size: 25))
        }
        .padding()
    }
}


extension View {
    func debugPrint(_ value: Any) -> some View {
        #if DEBUG
        print(value)
        #endif
        return self
    }
}
