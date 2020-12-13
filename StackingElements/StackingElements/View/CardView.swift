//
//  CardView.swift
//  StackingElements
//
//  Created by Luan Nguyen on 13/12/2020.
//

import SwiftUI

struct CardView : View {
    // MARK: - PROPERTIES
    var photo: Photos
    var reader: GeometryProxy
    @Binding var swiped: Int
    @Binding var show: Bool
    @Binding var selected: Photos
    var name: Namespace.ID
    
    // MARK: - bODY
    var body: some View {
        VStack {
            Spacer(minLength: 0)

            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
                VStack {
                    Image("\(photo.image)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: photo.image, in: name)
                        .padding(.top)
                        .padding(.horizontal,25)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("\(photo.name)")
                                .font(.system(size: 40))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Text("3D Illustration")
                                .font(.system(size: 20))
                                .foregroundColor(.black).opacity(0.6)
                            
                            Button(action: {
                                withAnimation(.spring()){
                                    selected = photo
                                    show.toggle()
                                }
                            }) {
                                Text("View More")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("orange"))
                                }
                            .padding(.top)
                        } //: vSTACK
                        
                        Spacer(minLength: 0)
                    } //: HSTACK
                    .padding(.horizontal,30)
                    .padding(.bottom,15)
                    .padding(.top,25)
                } //: VSTACK
                
                HStack {
                    Text("#")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray.opacity(0.6))
                    
                    Text("\(photo.place)")
                        .font(.system(size: UIScreen.main.bounds.height < 750 ? 100 : 120))
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray.opacity(0.6))
                } //: HSTACK
                .offset(x: -15, y: UIScreen.main.bounds.height < 750 ? 5 : 25)
            }) //: ZSTACK
            // Setting dynamic frame
            .frame(height: reader.frame(in: .global).height - 120)
            .padding(.vertical,10)
            .background(Color.white)
            .cornerRadius(25)
            .padding(.horizontal,30 + (CGFloat(photo.id - swiped) * 10))
            .offset(y: photo.id - swiped <= 2 ? CGFloat(photo.id - swiped) * 25 : 50)
            .shadow(color: Color.black.opacity(0.12), radius: 5, x: 0, y: 5)

            Spacer(minLength: 0)
        } //: VSTACK
        // Content shape
        // for drag gesture
        .contentShape(Rectangle())
    }
}
