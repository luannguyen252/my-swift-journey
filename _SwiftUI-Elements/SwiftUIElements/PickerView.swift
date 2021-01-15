//
//  PickerView.swift
//  SwiftUIElements
//
//  Created by Alex Nagy on 18/10/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import SwiftUI

struct PickerView: View {
    
    @Binding var currentImageName: String
    let imageNames: [String]
    
    var body: some View {
        Picker(selection: $currentImageName, label: Text("Select image: "), content: {
            ForEach(imageNames, id: \.self) { imageName in
                HStack {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Text(imageName)
                    Spacer()
                }
            }
        })
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(currentImageName: .constant(""), imageNames: [])
    }
}
