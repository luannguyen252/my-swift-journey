//
//  ImageLabelView.swift
//  QuickCardSwiftUI
//
//  Created by Umer Khan on 24/10/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import SwiftUI


struct ImageLabelView: View {
    
    var imageName: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.gray)
            Text(text)
        }
    }
}


struct ImageLabelView_Previews: PreviewProvider {
    static var previews: some View {
        ImageLabelView(imageName: "person.fill", text: .constant("Hello"))
    }
}
