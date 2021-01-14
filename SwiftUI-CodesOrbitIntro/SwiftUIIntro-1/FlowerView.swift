//
//  FlowerView.swift
//  SwiftUIIntro-1
//
//  Created by Umer Khan on 19/10/2020.
//

import SwiftUI

struct FlowerView: View {
    let flower: Flowers
    
    var body: some View {
        
        HStack {
            Image(flower.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(12)
                .shadow(radius: 12)
            
            
            VStack(alignment: .leading) {
                Text(flower.name)
                    .fontWeight(.bold)
                    .font(.headline)
                    .lineLimit(1)

                HStack {
                    Text(flower.description)
                        .font(.caption)
                        //.lineLimit(6)
                        .foregroundColor(.gray)
                }
            }
            .padding(10)
        }
    }
}

struct FlowerView_Previews: PreviewProvider {
    static var previews: some View {
        FlowerView(flower: Flowers(name: "Abutilon", imageName: "Abutilon", description: "Abutilon is a shrub that blooms during the summer. This plant produces flowers that may be white to a purple blue color.The blooms are saucer-shaped, and the stems have gray, hairy leaves. The shrub may grow to around 15 feet, and many hybrids have been developed that you can enjoy."))
            .previewLayout(.sizeThatFits)
    }
}
