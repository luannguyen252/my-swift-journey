import SwiftUI
import SceneKit
import Combine

final class CameraInfo: ObservableObject  {
    @Published var cameraNumber: UInt = 0
}

struct ContentView: View {
    @EnvironmentObject var cameraInfo: CameraInfo
    
    var body: some View {
        ZStack {
            if #available(iOS 14.0, *) {
                Color("dark").ignoresSafeArea(.all, edges: .all)
            } else {
                // Fallback on earlier versions
            }
            
            VStack(alignment: .leading) {
                SceneView(cameraNumber: $cameraInfo.cameraNumber)
                    .frame(height: UIScreen.main.bounds.size.height / 2)
                
                List(0...2, id: \.self) { (i) in
                    Button(action: {
                        self.cameraInfo.cameraNumber = UInt(i)
                    }) {
                        TableRow(number: i)
                    }
                }
            }
        }
        .statusBar(hidden: true)
    }
}

struct TableRow: View {
    var number: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Camera: \(number)")
                .font(.custom("TTFirsNeue-Bold", size: 24))
                .foregroundColor(Color("dark"))
            Text("SwiftUI + SceneKit")
                .font(.custom("TTFirsNeue-Regular", size: 16))
                .foregroundColor(Color("dark4"))
        }
        .padding(8)
    }
}

struct SceneView: UIViewRepresentable {
    @Binding var cameraNumber:UInt
    
    func makeUIView(context: Context) -> SCNView {
        let view = SCNView(frame: .zero)
        let scene = SCNScene(named: "main.scn")
        
        view.allowsCameraControl = true
        view.scene = scene
        
        return view
    }
    
    func updateUIView(_ view: SCNView, context: Context) {
        let camera = view.scene?.rootNode.childNode(withName: "Camera\(cameraNumber)", recursively: true)!
        
        SCNTransaction.begin()
        SCNTransaction.animationDuration = 1.0
        
        view.pointOfView = camera
        
        SCNTransaction.commit()
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CameraInfo())
    }
}
#endif
