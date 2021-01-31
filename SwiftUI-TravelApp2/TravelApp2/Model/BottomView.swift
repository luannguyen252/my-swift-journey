//
//  BottomView.swift
//  TravelApp2
//
//  Created by Luan Nguyen on 23/12/2020.
//

import SwiftUI

struct BottomView: View {
    // MARK: - PROPERTIES
    @State var index = 1

    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("People")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("txt"))

            Text("Member Of Your Group")
                .font(.caption)

            HStack(spacing: 16) {
                ForEach(1...6, id: \.self) { i in
                    Button(action: {index = i}) {
                        Text("\(i)")
                            .fontWeight(.bold)
                            .foregroundColor(index == i ? .white : .gray)
                            .padding(.vertical, 8)
                            .padding(.horizontal)
                            .background(Color("color").opacity(index == i ? 1 : 0.07))
                            .cornerRadius(8)
                    }
                }
                Spacer(minLength: 0)
            } //: HSTACK
            .padding(.top)

            Text("Description")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("txt"))
                .padding(.top, 16)

            Text("The Caribbean is a region of the Americas that consists of the Caribbean Sea, its islands and the surrounding coasts")
                .multilineTextAlignment(.leading)

            Spacer(minLength: 0)

            HStack {
                Spacer(minLength: 0)
                Button(action: {}) {
                    Text("Book Now")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .background(Color("color"))
                        .clipShape(Capsule())
                }
                Spacer(minLength: 0)
            } //: HSTACK
            .padding(.top)
            //: SINCE ALL EDGES ARE IGNORED
            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 16 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)

        } //: VSTACK
        .padding([.horizontal,.top])
    }
}
