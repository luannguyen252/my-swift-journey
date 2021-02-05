//
//  ContentView.swift
//  SwiftUI25
//
//  Created by Rohit Saini on 05/08/20.
//  Copyright © 2020 AccessDenied. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var input: String = ""
    var body: some View {
        VStack{
        TextField("Enter...", text: $input).textFieldStyle(RoundedBorderTextFieldStyle())
        if input != ""{
            Image(uiImage: UIImage(data: generateQR(value: input))!).resizable().frame(width: 200,height: 200)
        }
        }.padding()
    }
    
    func generateQR(value: String) -> Data{
        let filter = CIFilter(name: "CIQRCodeGenerator")
        let data = value.data(using: .ascii, allowLossyConversion: false)
        filter?.setValue(data, forKey: "inputMessage")
        let image = filter?.outputImage
        let uiImage = UIImage(ciImage: image!)
        return uiImage.pngData()!
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
