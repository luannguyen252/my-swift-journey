//
//  EntryRow.swift
//  JournalingApp
//
//  Created by Philipp Baldauf on 18.12.19.
//  Copyright © 2019 Philipp Baldauf. All rights reserved.
//

import SwiftUI

struct EntryRow: View {
    
    let dateFormatter = DateFormatter()
    let entry: Entry
    
    init(entry: Entry) {
        self.entry = entry
        dateFormatter.dateStyle = .short
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(entry.title)
                Spacer()
                Text(dateFormatter.string(from: entry.created))
            }
            Text(entry.text)
                .lineLimit(1)
        }
    }
}
