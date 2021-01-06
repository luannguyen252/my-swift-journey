//
//  ImageManager.swift
//  FitnessExample
//
//  Created by Gualtiero Frigerio on 08/02/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import UIKit

typealias ImageSource = UIImagePickerController.SourceType

enum ImageFormat {
    case JPEG
    case PNG
}

class ImageManager : NSObject {
    
    var getImageCallback:((UIImage?) -> Void)?
    
    func getImage(fromSource sourceType:ImageSource, presentingViewController:UIViewController, callback:@escaping (UIImage?) ->Void) {
        getImageCallback = callback
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let picker = UIImagePickerController()
            guard let mediaTypes = UIImagePickerController.availableMediaTypes(for: sourceType) else {
                callback(nil)
                return
            }
            picker.mediaTypes = mediaTypes
            picker.allowsEditing = false
            picker.delegate = self
            presentingViewController.show(picker, sender: nil)
        }
        else {
            callback(nil)
        }
    }
}

// MARK: - Static

extension ImageManager {
    /*
     Resize an image mantaining its aspect ratio
     caller can specify a maximum width and height
    */
    static func resizeImage(_ image:UIImage, maxWidth:CGFloat, maxHeight:CGFloat) -> UIImage? {
        let ratio = image.size.width / image.size.height
        
        var width = maxWidth
        var height = width / ratio
        
        if height > maxHeight {
            height = maxHeight
            width = height * ratio
        }
        let newSize = CGSize(width: width, height: height)
        let rect = CGRect(x:0, y:0, width:width, height:height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    static func resizeImageForWatch(_ image:UIImage) -> UIImage? {
        return ImageManager.resizeImage(image, maxWidth: 200, maxHeight: 200)
    }
    
    @discardableResult static func saveImage(_ image:UIImage, toPath path:String, withFormat format:ImageFormat) -> Bool {
        var data:Data?
        switch format {
        case .JPEG:
            data = image.jpegData(compressionQuality: 0.9)
        case .PNG:
            data = image.pngData()
        }
        do {
            try data?.write(to: URL(fileURLWithPath: path))
        }
        catch {
            print("error while writing image to path \(path)")
            return false
        }
        return true
    }
}

// MARK: - UIImagePickerControllerDelegate

extension ImageManager : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        guard let getImageCallback = getImageCallback else {return}
        getImageCallback(nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let getImageCallback = getImageCallback else {return}
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            getImageCallback(image)
        }
        else {
            getImageCallback(nil)
        }
    }
}
