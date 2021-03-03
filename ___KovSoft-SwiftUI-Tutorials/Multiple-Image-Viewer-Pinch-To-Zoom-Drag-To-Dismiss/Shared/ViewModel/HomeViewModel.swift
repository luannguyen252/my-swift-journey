//
//  HomeViewModel.swift
//  Image_Viewer (iOS)
//
//  Created by Balaji on 01/03/21.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    // Replace with your image Model...
    @Published var allImages = ["image1","image2","image3","image4","image5","image6"]
    
    
    // Properties For Image Viewer...
    @Published var showImageViewer = false
    
    @Published var selectedImageID : String = ""
    
    @Published var imageViewerOffset: CGSize = .zero
    
    // BG Opacity...
    @Published var bgOpacity: Double = 1
    
    // Scaling....
    @Published var imageScale: CGFloat = 1
    
    func onChange(value: CGSize){
        
        // updating Offset...
        imageViewerOffset = value
        
        // calculating opactity....
        let halgHeight = UIScreen.main.bounds.height / 2
        
        let progress = imageViewerOffset.height / halgHeight
        
        withAnimation(.default){
            bgOpacity = Double(1 - (progress < 0 ? -progress : progress))
        }
    }
    
    func onEnd(value: DragGesture.Value){
        
        withAnimation(.easeInOut){
            
            var translation = value.translation.height
            
            if translation < 0{
                translation = -translation
            }
            
            if translation < 250{
                imageViewerOffset = .zero
                bgOpacity = 1
            }
            else{
                showImageViewer.toggle()
                imageViewerOffset = .zero
                bgOpacity = 1
            }
        }
    }
}
