//
//  ThumbnailCard.swift
//  Chapter05
//
//  Created by Jayant Varma on 17/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct ThumbnailCard: View {
    var thumb: Thumb
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(thumb.image)
            .resizable()
                .frame(width: 350, height: 250)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(15)
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 350, height: 35)
                .opacity(0.3)
                .blur(radius: 10)
            Text("\(thumb.title)")
            .font(.title)
            .bold()
            .foregroundColor(.white)
            .padding()
        }
    }
}

struct ThumbnailView: View {
    var body: some View {
        VStack {
            Text("Just Desserts")
                .font(.largeTitle)
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<thumbnailData.count){ index in
                        ThumbnailCard(thumb: thumbnailData[index])
                    }
                }.padding()
            }
        }
    }
    
    
}

struct ThumbnailCard_Previews: PreviewProvider {
    static var previews: some View {
        ThumbnailView()
    }
}
