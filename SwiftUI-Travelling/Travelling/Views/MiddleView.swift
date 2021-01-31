//
//  MiddleView.swift
//  Travelling
//
//  Created by Luan Nguyen on 07/12/2020.
//

import SwiftUI

struct MiddleView: View {
    // MARK: - PROPERTIES
    @State var show = false
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                VStack(alignment: .leading,spacing: 12) {
                    Button(action: {
                    }) {
                        Image("Card1")
                            .renderingMode(.original)
                    }
                    Text("Fishing Time")
                        .fontWeight(.heavy)
                    HStack(spacing: 5) {
                        Image("map")
                            .renderingMode(.original)
                        Text("Vancouver, CA")
                            .foregroundColor(.gray)
                    } //: HSTACK
                } //: VSTACK
                VStack(alignment: .leading,spacing: 12) {
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Image("Card2")
                            .renderingMode(.original)
                    }
                    Text("Forest Camping")
                        .fontWeight(.heavy)
                    HStack(spacing: 5) {
                        Image("map")
                            .renderingMode(.original)
                        Text("Kecamatan Klojen")
                            .foregroundColor(.gray)
                    } //: HSTACK
                } //: VSTACK
            } //: HSTACK
        } //: SCROLLVIEW
        .sheet(isPresented: $show) {
            Detail()
        }
    }
}
