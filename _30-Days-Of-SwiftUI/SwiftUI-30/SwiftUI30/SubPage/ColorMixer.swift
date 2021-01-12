import SwiftUI

struct ColorMixer: View {
    @State var r = 1.0
    @State var g = 1.0
    @State var b = 1.0
    
    var body: some View {
        ZStack {
            Color(red: r, green: g, blue: b)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    Rectangle()
                        .frame(height: 100)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .opacity(0.5)
                    
                    HStack {
                        Text(verbatim: "R \(Int(r * 255))")
                            .bold()
                            .font(.title)
                            .padding()
                            .layoutPriority(1)
                            .opacity(0.7)
                        
                        Text(verbatim: "G \(Int(g * 255))")
                            .bold()
                            .font(.title)
                            .padding()
                            .opacity(0.7)
                        
                        Text(verbatim: "B \(Int(b * 255))")
                            .bold()
                            .font(.title)
                            .padding()
                            .opacity(0.7)
                    }
                }
                
                Spacer()
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .opacity(0.7)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .frame(height: 300)
                    
                    VStack {
                        HStack {
                            Image(systemName: "r.circle.fill")
                                .foregroundColor(.red)
                                .scaleEffect(1.5)
                                .opacity(0.8)
                                .padding()
                            
                            Slider(value: $r, in: 0.0...1.0)
                                .accentColor(.red)
                                .padding()
                        }
                        .padding()
                        
                        HStack {
                            Image(systemName: "g.circle.fill")
                                .foregroundColor(.green)
                                .scaleEffect(1.5)
                                .opacity(0.8)
                                .padding()
                            
                            Slider(value: $g, in: 0.0...1.0)
                                .accentColor(.green)
                                .padding()
                        }
                        .padding()
                        
                        HStack {
                            Image(systemName: "b.circle.fill")
                                .foregroundColor(.blue)
                                .scaleEffect(1.5)
                                .opacity(0.8)
                                .padding()
                            
                            Slider(value: $b, in: 0.0...1.0)
                                .accentColor(.blue)
                                .padding()
                        }
                        .padding()
                    }
                    .padding()
                }
            }
            .padding(.all, 20)
        }
    }
}

struct ColorMixer_Previews: PreviewProvider {
    static var previews: some View {
        ColorMixer()
    }
}
