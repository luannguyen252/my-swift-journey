//
//  VideoMask.swift
//  PixelKit SwiftUI
//
//  Created by Anton Heestand on 2021-02-04.
//

import SwiftUI
import PixelKit

struct VideoMask: View {
    var body: some View {
        VideoPIX(named: "homie_by_beeple.mp4")
            .pixFlopRight()
            .pixScaleResolution(placement: .fill)
            .pixMask {
                PolygonPIX(radius: 0.35,
                           count: 3,
                           cornerRadius: 0.1)
            }
            .ignoresSafeArea()
    }
}

struct VideoMask_Previews: PreviewProvider {
    static var previews: some View {
        VideoMask()
            .overlay(PlayPreviews())
    }
}
