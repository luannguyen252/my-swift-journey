//
//  TimeStampView.swift
//  MessageMaker
//
//  Created by Ryan Lintott on 2020-06-23.
//  Copyright © 2020 A Better Way To Do. All rights reserved.
//

import SwiftUI

struct TimeStampView: View {
    let timeStamp: TimeStamp
    
    var body: some View {
        HStack(spacing: 0) {
            if timeStamp.label != nil {
                Text("\(timeStamp.label!)")
                    .bold()
            }
            
            Text(timeStamp.time)
        }
        .font(.system(size: 11))
        .foregroundColor(.secondary)
    }
}

struct TimeStampView_Previews: PreviewProvider {
    static var previews: some View {
        TimeStampView(timeStamp: TimeStamp.exampleFromRawText ?? TimeStamp.example)
            .previewLayout(.sizeThatFits)
    }
}
