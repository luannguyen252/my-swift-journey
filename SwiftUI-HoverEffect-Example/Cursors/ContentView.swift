import SwiftUI

struct ContentView: View {
    @State private var isHovered = false
    
    var body: some View {
        VStack(spacing: 100) {
            VStack {
                Text("Highlight")
                    .foregroundColor(.secondary)
                    
                    .offset(y: -20)
                HStack {
                    
                    Button(action: {}) {
                        Image(systemName: "square.and.pencil")
                            .frame(width: 60)
                            .font(.largeTitle)
                            .padding(8)
                        
                    }.contentShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .hoverEffect(.highlight)
                    
                    Button(action: {}) {
                        Image(systemName: "trash")
                            .frame(width: 60)
                            .font(.largeTitle)
                            .padding(8)
                    }
                    .contentShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .hoverEffect(.highlight)
                    
                    
                    Button(action: {}) {
                        Image(systemName: "square.and.arrow.up")
                            .frame(width: 60)
                            .font(.largeTitle)
                            .padding(8)
                    }
                    .contentShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .hoverEffect(.highlight)
                }
            }
            VStack {
                Text("Lift")
                    .foregroundColor(.secondary)
                    .offset(y: -20)
                HStack {
                    Button(action: {}) {
                        Text("Submit")
                            .frame(width: 100)
                            .padding(12)
                            .font(Font.body.bold())
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        
                    }
                    .contentShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .hoverEffect(.lift)
                    
                    Button(action: {}) {
                        Text("Submit")
                            .frame(width: 100)
                            .padding(12)
                            .font(Font.body.bold())
                            .background(Color.pink)
                            .foregroundColor(Color.white)
                            .cornerRadius(8)
                        
                    }
                    .contentShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .hoverEffect(.lift)
                    
                }
            }
            
            VStack {
                Text("Custom")
                    .foregroundColor(.secondary)
                    .offset(y: -20)
                HStack {
                    Button(action: {}) {
                        Text("Submit")
                            .frame(width: 100)
                            .padding(12)
                            .font(Font.body.bold())
                            .background(Color.primary)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .shadow(color: .pink, radius: isHovered ? 8 : 0 )
                            .animation(.easeOut(duration: 0.2))
                        
                    }
                    .onHover { isHovered in
                        self.isHovered = isHovered
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
