//
//  ImagePicker.swift
//  Dog Breed ID
//
//  Created by Stephen DeStefano on 9/24/19.
//  Copyright © 2019 Stephen DeStefano. All rights reserved.
//

import Foundation
import SwiftUI

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate, ObservableObject {
    
    @Binding var isShown: Bool
    @Binding var img: Image?
    
    public init(isShown: Binding<Bool>, image: Binding<Image?>) {
        _isShown = isShown
        _img = image
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         
         let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
         
         guard let convertedCIImage = CIImage(image: userPickedImage) else {
             fatalError("cannot convert to ciImage")
         }

    DetectImage().detect(image: convertedCIImage)
         img = Image(uiImage: userPickedImage)
         isShown = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
}
    
    struct ImagePicker: UIViewControllerRepresentable {
        @Binding var isShown: Bool
        @Binding var image: Image?
        
        func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        }
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
            picker.delegate = context.coordinator
            
            return picker
        }
        
        func makeCoordinator() -> ImagePickerCoordinator {
            return ImagePickerCoordinator(isShown: $isShown, image: $image)
        }
    }
    

