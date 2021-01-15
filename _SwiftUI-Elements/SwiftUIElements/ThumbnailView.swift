//
//  ThumbnailView.swift
//  SwiftUIElements
//
//  Created by Alex Nagy on 18/10/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import SwiftUI

struct ThumbnailView: View {
    
    @Binding var redValue: Double
    @Binding var greenValue: Double
    @Binding var blueValue: Double
    @Binding var currentCornerRadius: Int
    @Binding var titleText: String
    @Binding var likeCount: Int
    @Binding var currentImageName: String
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: 400, height: 250)
                    .foregroundColor(Color(red: redValue, green: greenValue, blue: blueValue))
                    .cornerRadius(CGFloat(currentCornerRadius))
                HStack{
                    VStack{
                        Text(titleText)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Spacer()
                        Text("Likes: \(likeCount)")
                            .font(.system(size: 30))
                    }
                    .padding(20)
                    VStack {
                        Spacer()
                        Image(currentImageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250)
                    }
                }
            }
            .frame(width: 400, height: 250)
            
            Text("R: \(Int(redValue * 255.0))"
                + "  G: \(Int(greenValue * 255.0))"
                + "  B: \(Int(blueValue * 255.0))")
        }
    }
}

struct ThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbnailView(redValue: .constant(0), greenValue: .constant(0), blueValue: .constant(0), currentCornerRadius: .constant(0), titleText: .constant(""), likeCount: .constant(0), currentImageName: .constant(""))
    }
}

