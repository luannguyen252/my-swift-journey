//
//  StationStatusView.swift
//  Tube Status
//
//  Created by Clarence Ji on 6/19/19.
//  Copyright © 2019 Clarence Ji. All rights reserved.
//

import SwiftUI

struct StationStatusView : View {
    
    var line: Line
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            HStack(alignment: .center, spacing: 6) {
                self.line.statusIcon
                    .imageScale(.medium)
                    .foregroundColor(line.statusColor)
                Text(line.shortStatus)
                    .font(.subheadline)
                    .foregroundColor(line.statusColor)
                Spacer()
            }
            
            if !self.line.isGoodService {
                Text(line.reason ?? "")
                    .font(.subheadline)
            }
            
        }
            .lineLimit(nil)
            .padding([.top, .bottom], 6)
        
    }
}

#if DEBUG
struct StationStatusView_Previews : PreviewProvider {
    static var previews: some View {
        StationStatusView(line: lineData[0])
    }
}
#endif
