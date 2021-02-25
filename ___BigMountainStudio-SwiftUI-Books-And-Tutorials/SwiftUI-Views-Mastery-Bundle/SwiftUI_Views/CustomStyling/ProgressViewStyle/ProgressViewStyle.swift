//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct ProgressViewStyle_Intro: View {
    @State private var progressAmount: CGFloat = 0.25
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("ProgressViewStyle",
                       subtitle: "Customizing",
                       desc: "You can create your own progress view style by accessing the values ProgressView uses.")
            
            ProgressView("AMT", value: progressAmount)
                .progressViewStyle(GaugeProgressViewStyle())
                .frame(width: 300, height: 300)
            
            Slider(value: $progressAmount,
                   minimumValueLabel: Text("0"),
                   maximumValueLabel: Text("1"), label: {})
                .padding()
        }
        .font(.title)
        
    }
}

struct GaugeProgressViewStyle: ProgressViewStyle {
    let ag = AngularGradient(gradient: Gradient(colors: [Color(UIColor.systemTeal),
                                                         Color.green,
                                                         Color.yellow,
                                                         Color.orange,
                                                         Color.red,
                                                         Color.purple]),
                             center: .center,
                             startAngle: .degrees(-5), endAngle: .degrees(270))
    
    func makeBody(configuration: Configuration) -> some View {
        
        let percent = Double(configuration.fractionCompleted ?? 1)
        
        return
            GeometryReader { gp in
                ZStack {
                    Circle()
                        .trim(from: 0, to: 0.8)
                        .stroke(ag,
                                style: StrokeStyle(lineWidth: 40,
                                                   lineCap: CGLineCap.round))
                        .rotationEffect(.degrees(125))
                    
                    Circle()
                        .strokeBorder(Color.primary, lineWidth: 5)
                        .frame(width: 38, height: 38)
                        .offset(y: gp.size.height / 2 - (38/2))
                        .rotationEffect(.degrees(35 + (290 * percent)), anchor: .center)
                    // Extent of rotation is 35 to 325 (Distance of 290)
                    
                    Text("\(Int(percent * 100))")
                        .font(Font.system(size: 100, weight: .bold, design: .rounded))
                    
                    configuration.label
                        .font(Font.system(.title, design: .rounded).weight(.bold))
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .frame(width: 100)
                        .lineLimit(2)
                }
                .padding(20)
                .frame(width: min(gp.size.height, gp.size.width), height: min(gp.size.height, gp.size.width))
            }
    }
}

struct ProgressViewStyle_Intro_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViewStyle_Intro()
    }
}
