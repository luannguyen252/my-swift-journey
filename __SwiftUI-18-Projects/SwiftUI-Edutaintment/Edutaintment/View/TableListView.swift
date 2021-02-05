//
//  TableListView.swift
//  Edutaintment
//
//  Created by Sandesh on 16/05/20.
//  Copyright © 2020 Sandesh. All rights reserved.
//

import SwiftUI

struct TableListView: View {
    
    @Binding var selectedTable: Int?
    
    private let tables = [[2,3,4,5,6], [7,8,9,10,11], [12,13,14,15,16]]
    
    
    var body: some View {
        
        VStack {
            ForEach(0 ..< tables.count) { i in
                
                HStack {
                    ForEach( 0 ..< self.tables[i].count) { j in
                        Button(action: {
                            withAnimation {
                                self.selectedTable = self.tables[i][j]
                            }
                        }
                        ) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.red)
                                    .shadow(color: Color.white.opacity(0.2), radius: 4, x: 2, y: 2)
                                Text("\(self.tables[i][j])")
                                    .background(Color.clear)
                                    .font(.system(size: 24, weight: .medium, design: .rounded))
                                    .foregroundColor(.white)
                            }
                        }
                        .frame(width: 60, height: 50)
                    }
                }
                
            }
        }
    }
}

struct TableListView_Previews: PreviewProvider {
    static var previews: some View {
        TableListView(selectedTable: .constant(0))
    }
}
