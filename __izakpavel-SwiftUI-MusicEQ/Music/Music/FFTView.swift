//
//  FFTView.swift
//  Music
//
//  Created by Clifton on 2021-01-18.
//

import SwiftUI

struct FFTView_Previews: PreviewProvider {
    static var previews: some View {
        FFTView(amplitudes: Array(repeating: 0.0, count: 50))
    }
}

struct FFTView: View {
    var amplitudes: [Double]
    var linearGradient : LinearGradient = LinearGradient(gradient: Gradient(colors: [.red, .yellow, .green]), startPoint: .top, endPoint: .center)
    var paddingFraction: CGFloat = 0.2
    var includeCaps: Bool = true
    
    var body: some View {
        HStack(spacing: 0.0){
            ForEach(0 ..< self.amplitudes.count) { number in
                AmplitudeBar(amplitude: amplitudes[number], linearGradient: linearGradient, paddingFraction: paddingFraction, includeCaps: includeCaps)
            }
        }
        .background(Color.black)
    }
}

struct AmplitudeBar: View {
    var amplitude: Double
    var linearGradient : LinearGradient
    var paddingFraction: CGFloat = 0.2
    var includeCaps: Bool = true
    
    var body: some View {
        GeometryReader
            { geometry in
            ZStack(alignment: .bottom){
                
                // Colored rectangle in back of ZStack
                Rectangle()
                    .fill(self.linearGradient)
                
                // Dynamic black mask padded from bottom in relation to the amplitude
                Rectangle()
                    .fill(Color.black)
                    .mask(Rectangle().padding(.bottom, geometry.size.height * CGFloat(amplitude)))
                    .animation(.easeOut(duration: 0.15))
                
                // White bar with slower animation for floating effect
                if(includeCaps){
                    addCap(width: geometry.size.width, height: geometry.size.height)
                }
            }
            //.padding(geometry.size.width * paddingFraction / 2)
            //.border(Color.black, width: geometry.size.width * paddingFraction / 2)
        }
    }
    
    // Creates the Cap View - seperate method allows variable definitions inside a GeometryReader
    func addCap(width: CGFloat, height: CGFloat) -> some View {
        let padding = width * paddingFraction / 2
        let capHeight = height * 0.005
        let capDisplacement = height * 0.02
        let capOffset = -height * CGFloat(amplitude) - capDisplacement - padding * 2
        let capMaxOffset = -height + capHeight + padding * 2
        
        return Rectangle()
            .fill(self.linearGradient)
            .frame(height: capHeight)
            .offset(x: 0.0, y: -height > capOffset - capHeight ? capMaxOffset : capOffset) //ternary prevents offset from pushing cap outside of it's frame
            .animation(.easeOut(duration: 0.6))
    }
    
}
