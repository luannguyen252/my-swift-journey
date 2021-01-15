//
//  ProfilePicker.swift
//  People
//
//  Created by App Designer2 on 18.07.20.
//

import SwiftUI

struct ProfilePicker: UIViewControllerRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return ProfilePicker.Coordinator(pick1: self)
    }
    
    @Binding var pPicker : Bool
    @Binding var profilePicker : Data
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ProfilePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        
        return picker
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ProfilePicker>) {
        
    }
    
    class Coordinator: NSObject,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        var pick0 : ProfilePicker
        init(pick1: ProfilePicker) {
            pick0 = pick1
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.pick0.pPicker.toggle()
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let image = info[.originalImage] as! UIImage
            let img = image.jpegData(compressionQuality: 0.45)
            let multiple = img?.base64EncodedData()
            
            self.pick0.profilePicker.append(img!)
            self.pick0.pPicker.toggle()
            self.pick0.profilePicker = multiple!
            
        }
    }
}
