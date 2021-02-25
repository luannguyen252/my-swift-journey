import SwiftUI
import SceneKit

struct ContentView: View {
    @State var models = [
        Model(id: 0, name: "Rumba Dancing", modelName: "RumbaDancing.dae"),
        
        Model(id: 1, name: "Samba Dancing 1", modelName: "SambaDancing1.dae"),
        
        Model(id: 2, name: "Samba Dancing 2", modelName: "SambaDancing2.dae"),
        
        Model(id: 3, name: "Hip Hop Dancing", modelName: "HipHopDancing.dae"),
        
        Model(id: 4, name: "Silly Dancing 1", modelName: "SillyDancing1.dae"),
        
        Model(id: 5, name: "Silly Dancing 2", modelName: "SillyDancing2.dae"),
    ]

    @State var index = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            Color("white").edgesIgnoringSafeArea(.all)
            
            ZStack(alignment: .bottom) {
                // 3D Models
                SceneView(
                    scene: SCNScene(named: models[index].modelName),
                    options: [.autoenablesDefaultLighting, .allowsCameraControl]
                )
                
                // Controls
                HStack {
                    Button(action: {
                        withAnimation {
                            if index > 0 {
                                index -= 1
                            }
                        }
                    }, label: {
                        Image(systemName: "arrow.left.circle.fill")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(Color("dark"))
                            .opacity(index == 0 ? 0.2 : 1)
                    })
                    .disabled(index == 0 ? true : false)

                    Spacer(minLength: 0)

                    Button(action: {
                        withAnimation {
                            if index < models.count {
                                index += 1
                            }
                        }
                    }, label: {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(Color("dark"))
                            .opacity(index == models.count - 1 ? 0.2 : 1)
                    })
                    .disabled(index == models.count - 1 ? true : false)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 32)
            }
            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            .ignoresSafeArea(.all, edges: .all)
        }
        .statusBar(hidden: true)
    }
}

// Data Model
struct Model: Identifiable {
    var id          : Int
    var name        : String
    var modelName   : String
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
