//
//  Home.swift
//  Travelling
//
//  Created by Luan Nguyen on 07/12/2020.
//

import SwiftUI

struct Home: View {
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Button(action: {
                }) {
                    Image("menu")
                        .renderingMode(.original)
                }
                Spacer()
                Button(action: {
                }) {
                    Image("Profile")
                        .renderingMode(.original)
                        .frame(width: 40, height: 40, alignment: .center)
                }
            } //: HSTACK
            Text("Find More")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .padding(.top,15)
            HStack {
                Button(action: {
                }) {
                    Text("Experiences")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                }
                Spacer()
                Button(action: {
                }) {
                    Text("Adventures")
                        .foregroundColor(.gray)
                }
                Spacer()
                Button(action: {
                }) {
                    Text("Activities")
                        .foregroundColor(.gray)
                }
            } //: HSTACK
            .padding([.top],30)
            .padding(.bottom, 15)
            MiddleView()
            BottomView()
                .padding(.top, 10)
        }
        .padding()
    }
}
