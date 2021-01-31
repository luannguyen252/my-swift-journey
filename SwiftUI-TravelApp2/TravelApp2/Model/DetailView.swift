//
//  DetailView.swift
//  TravelApp2
//
//  Created by Luan Nguyen on 23/12/2020.
//

import SwiftUI

struct Detail: View {
    // MARK: - PROPERTIES
    @Binding var selected: Model
    @Binding var show: Bool
    var animation: Namespace.ID

    // MARK: - BODY
    var body: some View {
        VStack {
            VStack {
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                    Image(selected.img)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 330)
                        .clipShape(RoundedShape(corners: [.bottomLeft,.bottomRight]))
                        .matchedGeometryEffect(id: selected.img, in: animation)

                    HStack {
                        Button(action: {
                            withAnimation(.spring()){show.toggle()}
                        }) {

                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                        }

                        Spacer()

                        Button(action: {}) {
                            Image(systemName: "suit.heart")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                    } //: HSTACK
                    .padding()
                    //: SINCE ALL EDGES ARE IGNORED
                    .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                }

                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(selected.title)
                            .font(.title)
                            .foregroundColor(Color("txt"))
                            .fontWeight(.bold)
                            .matchedGeometryEffect(id: selected.title, in: animation)

                        HStack(spacing: 8) {
                            Image("map")

                            Text(selected.country)
                                .foregroundColor(.black)
                                .matchedGeometryEffect(id: selected.country, in: animation)

                            HStack(spacing: 8) {
                                Text(selected.ratings)
                                    .foregroundColor(.black)

                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            } //: HSTACK
                        } //: HSTACK
                    } //: VSTACK

                    Spacer(minLength: 0)

                    Text(selected.price)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("txt"))
                } //: HSTACK
                .padding()
                .padding(.bottom)
            } //: VSTACK
            .background(Color.white)
            .clipShape(RoundedShape(corners: [.bottomLeft,.bottomRight]))

            //: SCROLLVIEW FOR SMALLER SIZE PHONES
            if UIScreen.main.bounds.height < 750 {
                ScrollView(.vertical, showsIndicators: false) {
                    BottomView()
                }
            }
            else {
                BottomView()
            }

            Spacer(minLength: 0)
        } //: VSTACK
        .background(Color("bg"))
    }
}
