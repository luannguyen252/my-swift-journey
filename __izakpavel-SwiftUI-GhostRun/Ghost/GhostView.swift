//
//  GhostView.swift
//  Ghost
//
//  Created by Pavel Zak on 28/10/2020.
//

import SwiftUI


struct GhostShape: Shape {
    var phase: CGFloat
    
    var animatableData: CGFloat {
        get { phase }
        set { phase = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let width = rect.width
            let height = rect.height
            let headBase = height*0.4
            let bottomBase = height*0.9
            let bottomSize = height*0.1
            
            path.move(to: CGPoint(x: 0, y: headBase))
            path.addQuadCurve(to: CGPoint(x: width/2, y: 0), control: CGPoint(x: 0, y: 0))
            path.addQuadCurve(to: CGPoint(x: width, y: headBase), control: CGPoint(x: width, y: 0))
            //
            path.addLine(to: CGPoint(x: width, y: bottomBase))
            
            for i in 0..<100 {
                let v = CGFloat(i)*0.01
                let x = width - v*width
                let y = bottomBase+sin(v*CGFloat.pi*2+phase)*bottomSize
                
                path.addLine(to: CGPoint(x: x, y: y))
            }
            path.addLine(to: CGPoint(x: 0, y: headBase))
        }
    }
}

struct GhostFaceShape: Shape {
    var mouthRatio: CGFloat
    var smileFraction: CGFloat // 0smile -> 1sad
    
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { return AnimatablePair<CGFloat, CGFloat>(mouthRatio, smileFraction) }
        set {
            mouthRatio = newValue.first
            smileFraction = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let width = rect.width
            let height = rect.height
            let eyeBase = height*0.3
            let eyeSize = width*0.1
            
            let mouthHeight = height*mouthRatio
            let mouthWidth = width*0.2
            
            let mouthA = height*0.4
            let mouthB = mouthA+mouthHeight*smileFraction
            let mouthC = mouthB+mouthHeight*(1.0-smileFraction)
            
            path.addEllipse(in: CGRect(origin: CGPoint(x: width/3-eyeSize/2, y: eyeBase), size: CGSize(width: eyeSize, height: eyeSize)))
            path.addEllipse(in: CGRect(origin: CGPoint(x: 2*width/3-eyeSize/2, y: eyeBase), size: CGSize(width: eyeSize, height: eyeSize)))
            
            path.move(to: CGPoint(x: (width-mouthWidth)/2, y: mouthB))
            path.addQuadCurve(to: CGPoint(x: width/2, y: mouthA), control: CGPoint(x: (width-mouthWidth)/2, y: mouthA))
            path.addQuadCurve(to: CGPoint(x: (width+mouthWidth)/2, y: mouthB), control: CGPoint(x: (width+mouthWidth)/2, y: mouthA))
            
            path.addQuadCurve(to: CGPoint(x: width/2, y: mouthC), control: CGPoint(x: (width+mouthWidth)/2, y: mouthC))
            path.addQuadCurve(to: CGPoint(x: (width-mouthWidth)/2, y: mouthB), control: CGPoint(x: (width-mouthWidth)/2, y: mouthC))
            
        }
    }
}

class Ghost: ObservableObject {
    @Published var smilePhase: CGFloat = 0.5
    @Published var mouthRatio: CGFloat = 0.05
    var doingFace: Bool = false
    
    func closeMouth() {
        self.mouthRatio = 0.05
        self.smilePhase = 0.5
    }
    
    func smile() {
        self.mouthRatio = 0.1
        self.smilePhase = 0.1
    }
    
    func roar() {
        self.mouthRatio = 0.2
        self.smilePhase = 0.9
    }
    
    func smileAndClose() {
        let anim = Animation.easeInOut(duration: 0.4)
        self.doingFace = true
        withAnimation(anim) {
            self.smile()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            withAnimation(anim) {
                self.closeMouth()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.doingFace = false
        }
        
    }
    
    func roarAndClose() {
        let anim = Animation.easeInOut(duration: 0.4)
        self.doingFace = true
        withAnimation(anim) {
            self.roar()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            withAnimation(anim) {
                self.closeMouth()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.doingFace = false
        }
    }
}

struct GhostView: View {
    @State var phase: CGFloat = 0.0
    @ObservedObject var ghost: Ghost
    
    var body: some View {
        let background = GhostShape(phase: -self.phase+2*CGFloat.pi)
            .fill(Color("GhostDark"))
            .offset(x: 0, y: 3)
        return GhostShape(phase: self.phase)
            .fill(LinearGradient(gradient: Gradient(colors: [Color("GhostLight"), Color("GhostDark")]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 0)))
            .background(background)
            .overlay(GhostFaceShape(mouthRatio: self.ghost.mouthRatio, smileFraction: self.ghost.smilePhase).fill(Color("Background")))
            //.shadow(color: Color("GhostLight").opacity(0.2), radius: 6, x: 0, y: 0)
            .onAppear {
                withAnimation(Animation.linear(duration: 2.0).repeatForever(autoreverses: false)) {
                    self.phase += CGFloat.pi*2
                }
            }
    }
    
    
    
}

// MARK: Cross

struct CrossShape: Shape {
    let thickness: CGFloat
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let width = rect.width
            let height = rect.height
            let thickX = rect.width*thickness
            let thickY = rect.height*thickness
            
            path.addRect(CGRect(origin: CGPoint(x: (width-thickX)/2, y: 0), size: CGSize(width: thickX, height: height)))
            path.addRect(CGRect(origin: CGPoint(x: height*0.3-thickY/2, y: height*0.3-thickY/2), size: CGSize(width: width-height*0.3-thickY/2, height: thickY)))
        }
    }
}


struct CrossView: View {
    var body: some View {
        let back = CrossShape(thickness: 0.2)
            .fill(Color("CrossLight"))
            .offset(x: -2, y: 0)
        
        CrossShape(thickness: 0.2)
            .fill(Color("CrossBase"))
            .background(back)
    }
}


// MARK: Candy


struct CandyShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let width = rect.width
            let height = rect.height
            
            path.move(to: CGPoint(x: 0, y: height/2))
            path.addQuadCurve(to: CGPoint(x: width/2, y: 0), control: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: width/2, y: height/2))
            path.addLine(to: CGPoint(x: width, y: height/2))
            path.addQuadCurve(to: CGPoint(x: width/2, y: height), control: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: width/2, y: height/2))
            path.addLine(to: CGPoint(x: 0, y: height/2))
        }
    }
}


struct CandyView: View {
    var body: some View {
        let overlay1 = CandyShape()
            .fill(Color("Candy2"))
            .rotationEffect(Angle(degrees: 90))
        let back = CandyShape()
            .fill(Color("Candy3"))
            .rotationEffect(Angle(degrees: -45))
        CandyShape()
            .fill(Color("Candy1"))
            .overlay(overlay1)
            .overlay(LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)).blendMode(.softLight))
            .clipShape(Circle())
            .background(back.scaleEffect(CGSize(width: 1.5, height: 1.2)))
    }
}
