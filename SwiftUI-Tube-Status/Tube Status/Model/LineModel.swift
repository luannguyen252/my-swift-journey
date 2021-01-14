//
//  LineModel.swift
//  LLDB
//
//  Created by Clarence Ji on 6/6/19.
//  Copyright © 2019 Clarence Ji. All rights reserved.
//

import SwiftUI
import Combine

final class LineModel: ObservableObject {
    
    @Published var lines: [Line] = []
    @Published var isFetching: Bool = false
    
    func fetch() {
        
        self.isFetching = true
        
        _ = TfLService.loadTubeStatus()
            .sink(receiveValue: { (lines) in
                DispatchQueue.main.async {
                    self.lines = lines
                    self.isFetching = false
                }
            })
        
    }
    
}
