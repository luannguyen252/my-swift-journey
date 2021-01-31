//
//  BottomView.swift
//  Travelling
//
//  Created by Luan Nguyen on 07/12/2020.
//

import SwiftUI

struct BottomView: View {
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                Text("What you want ?")
                    .fontWeight(.heavy)
                Spacer()
                Button(action: {
                }) {
                    Text("View all")
                        .foregroundColor(.gray)
                }
            } //: HSTACK
            .padding([.top], 15)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 35) {
                    Button(action: {
                    }) {
                        VStack(spacing: 8) {
                            Image("mcard1")
                                .renderingMode(.original)
                            Text("Hiking")
                                .foregroundColor(.gray)
                        } //: VSTACK
                    }
                    Button(action: {
                    }) {
                        VStack(spacing: 8) {
                            Image("mcard2")
                                .renderingMode(.original)
                            Text("Ski")
                                .foregroundColor(.gray)
                        } //: VSTACK
                    }
                    Button(action: {
                    }) {
                        VStack(spacing: 8) {
                            Image("mcard3")
                                .renderingMode(.original)
                            Text("Sky Diving")
                                .foregroundColor(.gray)
                        } //: VSTACK
                    }
                    Button(action: {
                    }) {
                        VStack(spacing: 8) {
                            Image("mcard4")
                                .renderingMode(.original)
                            Text("SkateBoard")
                                .foregroundColor(.gray)
                        } //: VSTACK
                    }
                } //: HSTACK
            } //: SCROLLVIEW
            .padding(.leading, 20)
            .padding([.top,.bottom], 15)
        }
    }
}
