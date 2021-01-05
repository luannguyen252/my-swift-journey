//
//  HikeView.swift
//  SwiftUI_Landmark_App
//
//  Created by Ashwin Das on 10/02/20.
//  Copyright © 2020 Ashwin Das. All rights reserved.
//

import SwiftUI

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = true
    
    var body: some View {
        VStack {
                HStack {
                    HikeGraph(hike: hike, path: \.elevation)
                        .frame(width: 50, height: 30)

                    VStack(alignment: .leading) {
                        Text(hike.name)
                            .font(.headline)
                        Text(hike.distanceText)
                    }

                    Spacer()

                    Button(action: {
                        withAnimation(.easeInOut(duration:2)){
                            self.showDetail.toggle()
                        }
                    }) {
                        Image(systemName: "chevron.right.circle")
                            .imageScale(.large)
                            .rotationEffect(.degrees(showDetail ? 90 : 0))
//                            .animation(nil)
                            .scaleEffect(showDetail ? 1.5 : 1)
                            .padding()
//                            .animation(.spring())
                    }
                }

                if showDetail {
                    HikeDetail(hike: hike)
                }
            Spacer()
            }
        }
}


struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        HikeView(hike: hikeData[0])
    }
}
