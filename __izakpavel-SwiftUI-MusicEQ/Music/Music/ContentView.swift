//
//  ContentView.swift
//  Music
//
//  Created by Clifton on 26/08/20.
//

import SwiftUI
import AVKit

extension Color {
    static func random()->Color {
        let r = Double.random(in: 0 ... 1)
        let g = Double.random(in: 0 ... 1)
        let b = Double.random(in: 0 ... 1)
        return Color(red: r, green: g, blue: b)
    }
}


struct BodyView: View {
    var body: some View {
        
        NavigationView{
            
            Home()
                .navigationTitle("")
                .navigationBarHidden(true)
                .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BodyView()
    }
}


struct WaveCreation: View {
    @Binding var animateOffset: Bool
    var animatableOffsetTrue: CGFloat
    var animatableOffsetFalse: CGFloat
    var radius: CGFloat
    var shawdowX: CGFloat
    var shawdowY: CGFloat
    var duration: Double
    var locationOffsetY: CGFloat
    var waveFill: LinearGradient = LinearGradient(gradient: Gradient(colors: [.red, .yellow, .green]), startPoint: .top, endPoint: .center)

    var body: some View {
            WaveView(yOffset: animateOffset ? animatableOffsetTrue : animatableOffsetFalse)
                .fill(waveFill).shadow(color: .gray, radius: radius, x: shawdowX, y: shawdowY)
                .animation(Animation.easeInOut(duration: duration).repeatForever(autoreverses: true))
                .offset(y: locationOffsetY).rotationEffect(.degrees(180))
    }
}




struct Home: View {
    
    @State var audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
    
    // Timer TO Find Current Time of audio...
    
    @State var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    // Details Of Song...
    
    @StateObject var album = album_Data()
    
    @State var animatedValue : CGFloat = 55
    
    @State var maxWidth = UIScreen.main.bounds.width / 2.2
    
    @State var fullWidth = UIScreen.main.bounds.width
    
    @State var time : Float = 0
    
    
    
    @State var hideStatusBar = false

    
    ////
    @State private var animate = false
    
    struct AnimatableGradient: AnimatableModifier {
        let from: [UIColor]
        let to: [UIColor]
        var pct: CGFloat = 0
        
        var animatableData: CGFloat {
            get { pct }
            set { pct = newValue }
        }
        
        func body(content: Content) -> some View {
            var gColors = [Color]()
            
            for i in 0..<from.count {
                gColors.append(colorMixer(c1: from[i], c2: to[i], pct: pct))
            }
            
            return Circle()
                .fill(LinearGradient(gradient: Gradient(colors: gColors),
                                     startPoint: UnitPoint(x: 0, y: 0),
                                     endPoint: UnitPoint(x: 1, y: 1)))
                .frame(width: 200, height: 200)
        }
        
        //.fill(LinearGradient(gradient: Gradient(colors: self.gradientA), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1)))
        
        
        // This is a very basic implementation of a color interpolation
        // between two values.
        func colorMixer(c1: UIColor, c2: UIColor, pct: CGFloat) -> Color {
            guard let cc1 = c1.cgColor.components else { return Color(c1) }
            guard let cc2 = c2.cgColor.components else { return Color(c1) }
            
            let r = (cc1[0] + (cc2[0] - cc1[0]) * pct)
            let g = (cc1[1] + (cc2[1] - cc1[1]) * pct)
            let b = (cc1[2] + (cc2[2] - cc1[2]) * pct)

            return Color(red: Double(r), green: Double(g), blue: Double(b))
        }
    }
    ////
    
    @State private var gradientA: [Color] = [.red, .purple]
    @State private var gradientB: [Color] = [.red, .purple]
    
    @State private var firstPlane: Bool = true
    
    func setGradient(gradient: [Color]) {
        if firstPlane {
            gradientB = gradient
        }
        else {
            gradientA = gradient
        }
        firstPlane = !firstPlane
    }
    
    
    func getDouble(value: String) -> Double {
            return  Double(value)!
        }
    
    @EnvironmentObject var conductor: Conductor
    
    
    @State private var animateOffset = false
    @State private var tiltForwardBackward = false
    @State private var upAndDown = false
    @State private var leadingAnchorAnimnate = false
    
    
    

    
    
    var body: some View {
        

        // FIRST ATTEMPT to use AnimatableVector & AnimatableGraph
        
//        struct DemoChart {
//            var vector: AnimatableVector
//            
//            let areaGradient = LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.1), Color.blue.opacity(0.4)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1))
//            let lineGradient = LinearGradient(gradient: Gradient(colors: [Color.white, Color.orange]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 0))
//
//
//            
//            var chart: some View {
//                let overlayLine = AnimatableGraph(controlPoints: CGFloat(FFTView.amplitudes), closedArea: false)
//                    
//                return
//                    AnimatableGraph(controlPoints: CGFloat(FFTView.amplitudes), closedArea: true)
//                    .fill(areaGradient)
//                    .overlay(overlayLine)
//                    .stroke(lineGradient, lineWidth: 3)
//                
//            }
//        }
        
        
        // default gradients
//        let gradient1: [UIColor] = [.blue, .green]
//        let gradient2: [UIColor] = [.red, .yellow]
        
        return VStack(spacing: 0) {
         
         // album artwork
//            ZStack{
//                //Color.black.opacity(100)
//                    //.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//                FFTView(amplitudes: conductor.amplitudes,
//                        linearGradient: LinearGradient(gradient: Gradient(colors: self.gradientA), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1)))
//            }
//            .frame(width: fullWidth, height: 50)
//            //.border(Color.black)
//
//
//            ZStack{
//                Color.black.opacity(100)
//                    //.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//                FFTView(amplitudes: conductor.amplitudes,
//                        linearGradient: LinearGradient(gradient: Gradient(colors: self.gradientA), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1)))
//            }
//            .rotation3DEffect(Angle(degrees: 180), axis: (x: 1.0, y: 0.0, z: 0.0))
//            .frame(width: fullWidth, height: 50)
            //.border(Color.black)
                       
//            Color.clear.frame(width: 200, height: 200)
//                .overlay(Color.clear.modifier(AnimatableGradient(from: gradient1, to: gradient2, pct: animate ? 1 : 0)))
//
//            Spacer()
//
//            Button("Toggle Gradient") {
//                withAnimation(.easeInOut(duration: 1.0)) {
//                    self.animate.toggle()
//                }
//            }
                        
//            HStack{
//
//                VStack(alignment: .leading, spacing: 8) {
//
//                    Text(album.title)
//                        .fontWeight(.semibold)
//
//                    HStack(spacing: 10){
//
//                        Text(album.artist)
//                            .font(.caption)
//
//                        Text(album.type)
//                            .font(.caption)
//                    }
//                }
//
//                Spacer(minLength: 0)
//
//                Button(action: {}) {
//
//                    Image(systemName: "suit.heart.fill")
//                        .foregroundColor(.red)
//                        .frame(width: 45, height: 45)
//                        .background(Color.white)
//                        .clipShape(Circle())
//                }
//
//                Button(action: {}) {
//
//                    Image(systemName: "bookmark.fill")
//                        .foregroundColor(.black)
//                        .frame(width: 45, height: 45)
//                        .background(Color.white)
//                        .clipShape(Circle())
//                }
//                .padding(.leading,10)
//            }
//            .padding()
            
//            Spacer(minLength: 0)
            
//            if album.artwork.count != 0{
//
//                Image(uiImage: UIImage(data: album.artwork)!)
//                    .resizable()
//                    .frame(width: 250, height: 250)
//                    .cornerRadius(15)
//            }
  
            
            ZStack (alignment: .top) {
                WaveCreation(animateOffset: $animateOffset, animatableOffsetTrue: 1.9, animatableOffsetFalse: -1.9, radius: 50, shawdowX: 0, shawdowY: 50, duration: 2.7, locationOffsetY: 0, waveFill: (LinearGradient(gradient: Gradient(colors: self.gradientA), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1))))
                 
                
                WaveCreation(animateOffset: $animateOffset, animatableOffsetTrue: 1.9, animatableOffsetFalse: -1.9, radius: 50, shawdowX: 0, shawdowY: 50, duration: 2.7, locationOffsetY: 0, waveFill: (LinearGradient(gradient: Gradient(colors: self.gradientB), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1))))
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 0.0, y: 1.0, z: 0.0))
            }
            .rotationEffect(Angle(degrees: 180), anchor: .center)
            .frame(width: fullWidth, height: 50)
         
            
            Spacer()
            
            ZStack{
                
                VStack(spacing: 0){
                    

                    ZStack{
                        //Color.black.opacity(100)
                            //.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        FFTView(amplitudes: conductor.amplitudes,
                                linearGradient: LinearGradient(gradient: Gradient(colors: self.gradientA), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1)))
                    }
                    .frame(width: fullWidth, height: 50)
                    //.border(Color.black)

                    ZStack{
                        //Color.black.opacity(100)
                            //.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        FFTView(amplitudes: conductor.amplitudes,
                                linearGradient: LinearGradient(gradient: Gradient(colors: self.gradientA), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1)))
                    }
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 1.0, y: 0.0, z: 0.0))
                    .frame(width: fullWidth, height: 50)
                    //.border(Color.black)
                    
                    
                    
                }.onAppear {
                    self.setGradient(gradient: [Color.random().opacity(0.18), Color.random().opacity(0.18)])
                }
                
                ZStack{
                        
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: self.gradientA), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                        .frame(width: animatedValue / 2, height: animatedValue / 2)
                    
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: self.gradientA), startPoint: UnitPoint(x: 1, y: 1), endPoint: UnitPoint(x: 0, y: 0)))
                        .frame(width: animatedValue / 1.8, height: animatedValue / 1.8)
                   
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: self.gradientB), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                        .frame(width: animatedValue / 1.5, height: animatedValue / 1.5)

                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: self.gradientB), startPoint: UnitPoint(x: 1, y: 1), endPoint: UnitPoint(x: 0, y: 0)))
                        .frame(width: animatedValue / 1.3, height: animatedValue / 1.3)

                    
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: self.gradientB), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                        .frame(width: animatedValue / 1.1, height: animatedValue / 1.1)
                    
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: self.gradientB), startPoint: UnitPoint(x: 1, y: 1), endPoint: UnitPoint(x: 0, y: 0)))
                        .frame(width: animatedValue, height: animatedValue)
                    
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: self.gradientB), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                        .frame(width: animatedValue * 1.1, height: animatedValue * 1.1)
                    
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: self.gradientB), startPoint: UnitPoint(x: 1, y: 1), endPoint: UnitPoint(x: 0, y: 0)))
                        .frame(width: animatedValue * 1.2, height: animatedValue * 1.2)
                    
//                    Circle()
//                        .stroke(Color.yellow.opacity(0.10),lineWidth: 0.5)
//                        .frame(width: animatedValue * 1.3, height: animatedValue * 1.3)
                   
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: self.gradientA), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                        .frame(width: animatedValue * 1.3, height: animatedValue * 1.3)
                    
//                    Circle()
//                        .strokeBorder(Color.yellow.opacity(0.10),lineWidth: 0.5)
//                        .frame(width: animatedValue * 1.5, height: animatedValue * 1.5)

                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: self.gradientA), startPoint: UnitPoint(x: 1, y: 1), endPoint: UnitPoint(x: 0, y: 0)))
                        .frame(width: animatedValue * 1.5, height: animatedValue * 1.5)
                    

                }
                .frame(width: animatedValue, height: animatedValue)
                
                Button(action: play)   {
                    
                    Image(systemName: album.isPlaying ? "pause.fill" : "play.fill")
                        .font(.title)
                        .foregroundColor(.black)
                        .frame(width: 85, height: 85)
                        .background(RadialGradient(gradient: Gradient(colors: [.gray, .black]), center: UnitPoint(x: 0.4, y: 0.4), startRadius: 5, endRadius: 30))
                        .opacity(0.3)
                        .clipShape(Circle())    
                }
                
            }
            .frame(width: maxWidth, height: maxWidth)
            .padding(.top,30)
            
            //MARK: - WAVE 1
            
            Spacer()
            
            ZStack (alignment: .top) {
                WaveCreation(animateOffset: $animateOffset, animatableOffsetTrue: 1.9, animatableOffsetFalse: -1.9, radius: 50, shawdowX: 0, shawdowY: 50, duration: 2.7, locationOffsetY: 0, waveFill: (LinearGradient(gradient: Gradient(colors: self.gradientA), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1))))
                
                WaveCreation(animateOffset: $animateOffset, animatableOffsetTrue: 1.9, animatableOffsetFalse: -1.9, radius: 50, shawdowX: 0, shawdowY: 50, duration: 2.7, locationOffsetY: 0, waveFill: (LinearGradient(gradient: Gradient(colors: self.gradientB), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1))))
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 0.0, y: 1.0, z: 0.0))
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(LinearGradient(gradient: Gradient(colors: self.gradientA), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1)))
                RoundedRectangle(cornerRadius: 8)
                    .fill(LinearGradient(gradient: Gradient(colors: self.gradientB), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1)))
                    .opacity(self.firstPlane ? 0 : 1)
            }
            .frame(width: fullWidth, height: 50)

            .onAppear {
                    self.setGradient(gradient: [Color.random().opacity(0.18), Color.random().opacity(0.18)])
                    animateOffset.toggle()
                }
            .frame(width: 50, height: 50)
            .onTapGesture {
                withAnimation(.spring(blendDuration: 5)) {
                    self.setGradient(gradient: [Color.random().opacity(0.18), Color.random().opacity(0.18)])
                }
            }
            
            // Audio Tracking....
            
//            Slider(value: Binding(get: {time}, set: { (newValue) in
//
//                time = newValue
//
//                // updating player...
//
//                audioPlayer.currentTime = Double(time) * audioPlayer.duration
//                audioPlayer.play()
//            }))
//            .accentColor(.yellow)
//            .padding()
            
//            Spacer(minLength: 0)
        }
        
        .statusBar(hidden: hideStatusBar)
        
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(Color.black)
                .edgesIgnoringSafeArea(.all)
                
        
        
        .onReceive(timer) { (_) in
            
            if audioPlayer.isPlaying{
                
                audioPlayer.updateMeters()
                album.isPlaying = true
                // updating slider....
                
                time = Float(audioPlayer.currentTime / audioPlayer.duration)
                
                // getting animations....
                startAnimation()
            }
            else{
                
                album.isPlaying = false
            }
        }
        .onAppear(perform: getAudioData)
    }
    
    func play(){
        
        if audioPlayer.isPlaying{
            
            audioPlayer.pause()
            
        }
        else{
            
            audioPlayer.play()
        }
    }
    
    func getAudioData(){
        
        audioPlayer.isMeteringEnabled = true
        
        // extracting audio data....
        
        let asset = AVAsset(url: audioPlayer.url!)
        
        asset.metadata.forEach { (meta) in
            
            switch(meta.commonKey?.rawValue){
            
            case "artwork": album.artwork = meta.value == nil ? UIImage(named: "music")!.pngData()! : meta.value as! Data
            
            case "artist": album.artist = meta.value == nil ? "" : meta.value as! String
                
            case "type": album.type = meta.value == nil ? "" : meta.value as! String
                
            case "title": album.title = meta.value == nil ? "" : meta.value as! String
                
            default : ()
            }
        }
        
        if album.artwork.count == 0{
            
            album.artwork = UIImage(named: "music")!.pngData()!
        }
    }
    
    func startAnimation(){
        
        // getting levels....
        
        var power : Float = 0
        
        for i in 0..<audioPlayer.numberOfChannels{
            
            power += audioPlayer.averagePower(forChannel: i)
        }
        
        // calculation to get postive number...
        
        let value = max(0, power + 55)
        // you can also use if st to find postive number....
        
        let animated = CGFloat(value) * (maxWidth / 55)
        
        withAnimation(Animation.linear(duration: 0.01)){
            
            self.animatedValue = animated + 55
        }
    }
}

let url = Bundle.main.path(forResource: "Humanist Resonances", ofType: "m4a")

class album_Data : ObservableObject{
    
    @Published var isPlaying = false
    @Published var title = ""
    @Published var artist = ""
    @Published var artwork = Data(count: 0)
    @Published var type = ""
}
