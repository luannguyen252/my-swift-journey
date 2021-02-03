//
//  ContentView.swift
//  SwiftUI9
//
//  Created by Rohit Saini on 08/07/20.
//  Copyright © 2020 AccessDenied. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isShowingImagePicker = false
    @State var selectedImage: UIImage = UIImage()
    var body: some View {
        VStack{
            Image(uiImage: selectedImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .border(Color.gray, width: 1)
                .clipped()
            
            Button(action: {
                self.isShowingImagePicker.toggle()
            }, label: {
                Text("Select Image")
                    .font(.system(size: 32))
            })
                .sheet(isPresented: $isShowingImagePicker, content: {
                    ImagePickerView(isPresented:self.$isShowingImagePicker,selectedImage: self.$selectedImage)
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ImagePickerView:UIViewControllerRepresentable{
    
    @Binding var isPresented:Bool
    @Binding var selectedImage: UIImage
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIViewController {
        let controller = UIImagePickerController()
        controller.delegate = context.coordinator
        return controller
    }
    
    func makeCoordinator() -> ImagePickerView.Coordinator {
        return Coordinator(parent: self)
    }
    class Coordinator:NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
        let parent: ImagePickerView
        init(parent: ImagePickerView){
            self.parent = parent
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage{
                self.parent.selectedImage = selectedImage
            }
            self.parent.isPresented.toggle()
        }
    }
    func updateUIViewController(_ uiViewController: ImagePickerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        
    }
}
