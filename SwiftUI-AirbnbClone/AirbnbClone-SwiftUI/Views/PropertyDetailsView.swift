//
//  PropertyDetailsView.swift
//  AirbnbClone-SwiftUI
//
//  Created by Keerthi on 23/08/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import SwiftUI

struct PropertyDetailsView : View {
    var item: Experiences
    let experiences: [Experiences] = [Experiences(image: "property1", name: "Paris Best Kept Secrets Tour", price: "$170 per person"), Experiences(image: "property2", name: "Silent Disco Beach yoga", price: "$180 per person"), Experiences(image: "property3", name: "Miamo - Amazing view", price: "$100 per person"), Experiences(image: "property4", name: "Comfy Artist's Home", price: "$80 per person")]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                ZStack(alignment: .bottom) {
                    PageView(experiences.map { FeaturedPropertyView(movie: $0) })
                        .frame(height: 225)
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(item.name)
                                .foregroundColor(.white)
                                .bold()
                                .font(.largeTitle)
                        }
                        .padding(.leading)
                        .padding(.bottom)
                        Spacer()
                    }
                    Rectangle()
                        .frame(height: 80)
                        .opacity(0.25)
                        .blur(radius: 10)
                }
                VStack(alignment: .leading,spacing: 15) {
                    Text("ENTIRE HOUSE - 1 BED")
                        .foregroundColor(Color.red)
                        .font(.system(size: 10))
                        .fontWeight(.medium)
                        .font(.system(size: 18))
                        .fontWeight(.regular)
                    Text("Elegant Art Deco Home with Garden in Condesa")
                        .foregroundColor(.primary)
                        .font(.body)
                        .lineSpacing(5)
                    Text("$170 per person")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(Color(UIColor.darkGray))
                    HStack(alignment: .top) {
                        ForEach((0...4), id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 12.0, height: 12.0)
                                .foregroundColor(Color.red.opacity(0.8))
                                .padding(.horizontal, -4.0)
                        }
                        Text("5")
                            .font(.system(size: 11))
                            .fontWeight(.regular)
                            .foregroundColor(Color(UIColor.darkGray))
                    }.padding(.leading, -20.0)
                        .frame(width: 90.0, height: 0.0)
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum")
                }.padding(.all)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity, alignment: .topLeading)
            }
            .edgesIgnoringSafeArea(.top)
            .navigationBarHidden(true)
        }
    }
}

struct PropertyDetails_Preview: PreviewProvider {
    static var previews: some View {
        PropertyDetailsView(item: Experiences(image: "property1", name: "Paris Best kept secrets tour", price: "2"))
    }
}

struct FeaturedPropertyView: View {
    var movie: Experiences
    var body: some View {
            ZStack(alignment: .bottom) {
                Image(movie.image)
                    .resizable()
                    .clipped()
                Rectangle()
                    .frame(height: 80)
                    .opacity(0.35)
                    .blur(radius: 10)
            }
    }
}
