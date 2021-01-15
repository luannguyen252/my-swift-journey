//
//  ColorPicker.swift
//  ColorsPicker
//
//  Created by App Designer2 on 10.07.20.
//

import SwiftUI

struct ColorsPicker : UIViewControllerRepresentable {
    @Binding var colors : UIColor
    @Binding var show : Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(color1: self)
    }
    
    func makeUIViewController(context: Context) -> UIColorPickerViewController {
        let picker = UIColorPickerViewController()
        picker.delegate = context.coordinator
        picker.selectedColor = colors
        
        //We are already done with this implementation
        return picker
    }//makeUIViewController
    
    func updateUIViewController(_ uiViewController: UIColorPickerViewController, context: UIViewControllerRepresentableContext<ColorsPicker>) {
        uiViewController.selectedColor.resolvedColor(with: UITraitCollection.current)
        
    }//updateUIViewController
    
    class Coordinator : NSObject, UINavigationControllerDelegate, UIColorPickerViewControllerDelegate {
        
        var color : ColorsPicker
        init(color1 : ColorsPicker) {
            color = color1
        }
        func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
            self.color.colors = viewController.selectedColor
            
            self.color.show.toggle()
        }
        func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
            self.color.colors = viewController.selectedColor
            
        }
    }//class Coordinator
}//struct
