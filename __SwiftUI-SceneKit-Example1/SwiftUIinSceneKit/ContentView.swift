//
//  ContentView.swift
//  SwiftUIinSceneKit
//
//  Created by Toshihiro Goto on 2019/06/16.
//  Copyright © 2019 Toshihiro Goto. All rights reserved.
//

import SwiftUI
import SceneKit
import Combine

final class CameraInfo: ObservableObject  {
    @Published var cameraNumber:UInt = 0
}

struct ContentView : View {
    @EnvironmentObject var cameraInfo: CameraInfo
    
    var body: some View {
        VStack(alignment: .leading) {

            // SceneKit
            SceneView(cameraNumber: $cameraInfo.cameraNumber)
                .frame(height: 300)
            
            // TableView
            List(0...2, id:\.self){ (i) in
                Button(action: {
                    self.cameraInfo.cameraNumber = UInt(i)
                }) {
                    TableRow(number: i)
                }

            }

        }
    }
}


struct TableRow: View {
    var number:Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Camera: \(number)")
                .font(.title)
            Text("description: !!!!!!!")
                .font(.subheadline)
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
        let camera = view.scene?.rootNode.childNode(withName: "Camera\( cameraNumber)", recursively: true)!
        
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
