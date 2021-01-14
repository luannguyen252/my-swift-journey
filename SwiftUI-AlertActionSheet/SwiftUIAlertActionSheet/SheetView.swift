//
//  SheetView.swift
//  SwiftUIAlertActionSheet
//
//  Created by Alex Nagy on 18/10/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import SwiftUI

struct SheetView: View {
    var body: some View {
        VStack{
            Rectangle()
                .frame(width: 150, height: 5)
                .foregroundColor(.gray)
                .cornerRadius(10)
                .opacity(50)
            HStack{
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                
                Text("Alert in SwiftUI")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(50)
            }
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                .multilineTextAlignment(.leading)
                .lineSpacing(10)
            Spacer()
        }
        .padding(20)
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}

