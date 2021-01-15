//
//  GridStack.swift
//  ViewLayoutExample
//
//  Created by kim sunchul on 2020/05/01.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct GridStack<Content:View> : View {
    let rows:Int
    let columns:Int
    let content:(Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0 ..< rows, id:\.self) { row in
                HStack {
                    ForEach(0 ..< self.columns, id:\.self) { column in
                        self.content(row,column)
                        
                    }
                }
                
            }
        }
    }
    
    init(rows:Int, columns:Int, @ViewBuilder content:@escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

