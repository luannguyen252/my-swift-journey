//
//  ItemView.swift
//  Example
//
//  Created by Sudarshan Sharma on 11/26/20.
//

import SwiftUI
import SwipableContent

struct ItemView: View {
    let content: RowContent
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 10.0)
            
            HStack(spacing: 15.0) {
                Image(systemName: content.systemImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35.0, height: 35.0)
                
                VStack(alignment: .leading, spacing: 10.0) {
                    Text(content.text)
                        .font(.title)
                    
                    Text(content.description)
                        .font(.body)
                        .foregroundColor(Color.gray)
                }
            }
            
            Spacer()
                .frame(height: 10.0)
        }
    }
}
