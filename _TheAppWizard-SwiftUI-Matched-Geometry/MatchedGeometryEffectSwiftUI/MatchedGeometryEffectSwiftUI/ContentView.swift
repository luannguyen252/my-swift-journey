import SwiftUI

struct ContentView: View {
    @Namespace private var shapeTransition1
    @State private var expand = false
   
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.black, Color.black]), center: .center, startRadius: 5, endRadius: 500)
                .frame(height: nil)
                .edgesIgnoringSafeArea(.all)
                .scaleEffect(1.2)
            
            VStack {
                if expand {
                    // Rounded Rectangle
                    VStack {
                        Text("VIEW")
                            .font(.largeTitle)
                            .fontWeight(.thin)
                            .foregroundColor(Color.white)
                        
                        // Sub Views
                        ZStack {
                            RoundedRectangle(cornerRadius: 35.0)
                                .frame(width: 400, height: 180)
                                .foregroundColor(Color(.systemPink))
                            
                            HStack {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 50, height: 50, alignment: .center)
                                
                                Text("LIKE")
                                    .font(.largeTitle)
                                    .fontWeight(.light)
                                    .foregroundColor(.white)
                            }
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 35.0)
                                .frame(width: 400, height: 180)
                                .foregroundColor(Color(.systemTeal))
                        
                            HStack {
                                Image(systemName: "message.fill")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 50, height: 50, alignment: .center)
                                
                                Text("COMMENT")
                                    .font(.largeTitle)
                                    .fontWeight(.light)
                                    .foregroundColor(.white)
                            }
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 35.0)
                                .frame(width: 400, height: 180)
                                .foregroundColor(Color(.systemGreen))
                            
                            HStack {
                                Image(systemName: "location.fill")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 50, height: 50, alignment: .center)
                                
                                Text("SHARE")
                                    .font(.largeTitle)
                                    .fontWeight(.light)
                                    .foregroundColor(.white)
                            }
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 35.0)
                                .frame(width: 400, height: 180)
                                .foregroundColor(Color(.systemRed))
                            
                            Text("THE APP WIZARD")
                                .font(.largeTitle)
                                .fontWeight(.light)
                                .foregroundColor(.white)
                        }
                    }
                    .matchedGeometryEffect(id: "circle", in: shapeTransition1)
                    .animation(.easeInOut)
                    .onTapGesture {
                        expand.toggle()
                    }
                } else {
                    // Circle
                    RoundedRectangle(cornerRadius: 50.0)
                        .matchedGeometryEffect(id: "circle", in: shapeTransition1)
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color(.systemOrange))
                        .animation(.easeIn)
                        .shadow(color: .gray, radius: 10, x: 10, y: 10)
                        .onTapGesture {
                            expand.toggle()
                        }
                    
                    Spacer()
                }
            }
            .padding()
        }
        .padding(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
