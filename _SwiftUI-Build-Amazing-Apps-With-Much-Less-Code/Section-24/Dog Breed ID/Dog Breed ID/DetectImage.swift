//
//  DetectImage.swift
//  Dog Breed ID
//
//  Created by Stephen DeStefano on 9/24/19.
//  Copyright © 2019 Stephen DeStefano. All rights reserved.
//

import Foundation
import CoreML
import Vision
import UIKit
import SwiftUI

class DetectImage {
    
    let defaults = UserDefaults.standard
    var saveTopPrediction = ""
    var saveSecondPrediction = ""
    var saveTopConfidence = ""
    var saveSecondConfidence = ""
    
    func detect(image: CIImage) {
        guard let model = try? VNCoreMLModel(for: All_AKC_Breeds_Reworked_1500().model) else {
            fatalError("Cannot import model")
        }
        
        let request = VNCoreMLRequest(model: model) {request, error in
            let classifications = request.results as! [VNClassificationObservation]
            let predictionIdentifiers = classifications.prefix(3)
            let predictedBreeds = predictionIdentifiers.map { classification in
                    return classification.identifier
                }
                
                //formatting the confidence number to 2 decimal places and add the percent sign
                let predictionConfidences = predictionIdentifiers.map { classification in
                    return String(format: "  %.0f %@", classification.confidence * 100, "%")
                }
            //get the first and second predictions from the array
            let firstPrediction = predictedBreeds[0]
            let secondPrediction = predictedBreeds[1]
            
            //save the predictions to user defaults
            self.saveTopPrediction = firstPrediction
            self.defaults.set(self.saveTopPrediction, forKey: "topPrediction")
            
            self.saveSecondPrediction = secondPrediction
            self.defaults.set(self.saveSecondPrediction, forKey: "secondPrediction")
            
            //save the confidences to user defaults
            self.saveTopConfidence = predictionConfidences[0]
            self.defaults.set(self.saveTopConfidence, forKey: "topConfidence")
            
            self.saveSecondConfidence = predictionConfidences[1]
            self.defaults.set(self.saveSecondConfidence, forKey: "secondConfidence")
            
              }
               let handler = VNImageRequestHandler(ciImage: image)
               do {
                   try handler.perform([request])
                   }
               catch {
                   print(error)
               }
       }
    
    struct ImageCapture: View {
    
    @Binding var imagePickerIsShown: Bool
    @Binding var img: Image?
    
    var body: some View {
        ImagePicker(isShown: $imagePickerIsShown, image: $img)
        }
    }
    
    
}

