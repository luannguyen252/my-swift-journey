//
//  VideoPickerView.swift
//  Salome
//
//  Created by App Designer2 on 28.09.20.
//

import Foundation
import AVKit
import SwiftUI

struct ViewPickerView : UIViewControllerRepresentable {
    @Binding var showVideo : Bool
    @Binding var videos : UIVideoEditorController
    func makeCoordinator() -> Coordinator {
        return ViewPickerView.Coordinator(video1: self)
    }
    
    func makeUIViewController(context: Context) ->  UIVideoEditorController {
        let video = UIVideoEditorController()
        
        video.videoMaximumDuration = .infinity
        video.delegate = context.coordinator
        video.videoPath = .init()
        
        return video
    }
    func updateUIViewController(_ uiViewController: UIVideoEditorController, context: UIViewControllerRepresentableContext<ViewPickerView>) {
        //
    }
    class Coordinator: NSObject, UIVideoEditorControllerDelegate,UINavigationControllerDelegate {
        var video0 : ViewPickerView
        init(video1: ViewPickerView) {
            video0 = video1
        }
        func videoEditorControllerDidCancel(_ editor: UIVideoEditorController) {
            self.video0.showVideo.toggle()
        }
        func videoEditorController(_ editor: UIVideoEditorController, didSaveEditedVideoToPath editedVideoPath: String) {
            
            //let vide = didSaveEditedVideoToPath
        }
    }
}

/*
 func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
     let image = info[.originalImage]as! UIImage
     
     let data = image.jpegData(compressionQuality: 0.45)
     
     self.child.image = data!
     self.child.show.toggle()
     
 }
 */
