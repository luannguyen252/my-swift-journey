//
//  HomeViewModel.swift
//  Filter
//
//  Created by Balaji on 30/09/20.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

class HomeViewModel : ObservableObject {
    
    @Published var imagePicker = false
    @Published var imageData = Data(count: 0)
    
    @Published var allImages: [FilteredImage] = []
    
    // Main Editing Image....
    @Published var mainView : FilteredImage!
    
    // Slider For Intensity And Radius...etc...
    // Since WE didnt set while reading image
    // so all will be full value....
    @Published var value : CGFloat = 1.0
    
    // Loading FilterOption WhenEver Image is Selected....
    
    // Use Your Own Filters...
    
    let filters : [CIFilter] = [
    
        CIFilter.sepiaTone(),CIFilter.comicEffect(),CIFilter.colorInvert(),CIFilter.photoEffectFade(),CIFilter.colorMonochrome(),CIFilter.photoEffectChrome(),CIFilter.gaussianBlur(),CIFilter.bloom()
    ]
    
    
    func loadFilter(){
        
        let context = CIContext()
        
        filters.forEach { (filter) in
            
            // To Avoid Lag Do it in bacground...
            
            DispatchQueue.global(qos: .background).async {
                
                // loading Image Into Filter....
                let CiImage = CIImage(data: self.imageData)
                
                filter.setValue(CiImage!, forKey: kCIInputImageKey)
                
                // retreving Image....
                
                guard let newImage = filter.outputImage else{return}
                
                // creating UIImage...
                
                let cgimage = context.createCGImage(newImage, from: newImage.extent)
                
                let isEditable = filter.inputKeys.count > 1
                
                let filteredData = FilteredImage(image: UIImage(cgImage: cgimage!), filter: filter, isEditable: isEditable)
                
                DispatchQueue.main.async {
                    
                    self.allImages.append(filteredData)
                    
                    // default is First Filter...
                    
                    if self.mainView == nil{self.mainView = self.allImages.first}
                }
            }
        }
    }
    
    func updateEffect(){
        
        let context = CIContext()
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            // loading Image Into Filter....
            let CiImage = CIImage(data: self.imageData)
            
            let filter = self.mainView.filter
            
            filter.setValue(CiImage!, forKey: kCIInputImageKey)
            
            // retreving Image....
            
            // there are lot of custom options are available
            // im only using radius and intensity..
            // use your own based on your usage...
            
            // radius you can give up to 100
            // im using only 10....
            
            if filter.inputKeys.contains("inputRadius"){
                
                filter.setValue(self.value * 10, forKey: kCIInputRadiusKey)
            }
            if filter.inputKeys.contains("inputIntensity"){
                
                filter.setValue(self.value, forKey: kCIInputIntensityKey)
            }
            
            guard let newImage = filter.outputImage else{return}
            
            // creating UIImage...
            
            let cgimage = context.createCGImage(newImage, from: newImage.extent)
            
            DispatchQueue.main.async {
                
                // updating View....
                
                self.mainView.image = UIImage(cgImage: cgimage!)
            }
        }
    }
}
