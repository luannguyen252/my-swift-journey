//
//  LineDetail.swift
//  Tube Status
//
//  Created by Clarence Ji on 6/19/19.
//  Copyright © 2019 Clarence Ji. All rights reserved.
//

import SwiftUI

struct LineDetail : View {
    
    var line: Line
    @ObservedObject var model: StationModel
    
    var body: some View {
        
        List {
            
            Section(header: Text("LINE STATUS")) {
                StationStatusView(line: line)
            }
            
            if !model.isFetching {
                Section(header: Text("STATIONS")) {
                    ForEach(model.stations) { station in
                        Text(station.stationName)
                    }
                }
            } else {
                
                Section(header: Text("STATIONS"), footer:
                    LoadingView(isAnimating: true, style: .smallHorizontal)
                ) {
                    EmptyView()
                }
                
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(Text(line.name))
        .onAppear {
            self.model.isFetching = true
            self.model.fetch(line: self.line)
        }
        
    }
}

#if DEBUG
struct LineDetail_Previews : PreviewProvider {
    static var previews: some View {
        LineDetail(line: Line(id: "jubilee", name: "Jubilee", lineStatuses: [Line.Status(id: 1, statusSeverity: 10, statusSeverityDescription: "Nothing", reason: nil)]), model: StationModel())
    }
}
#endif
