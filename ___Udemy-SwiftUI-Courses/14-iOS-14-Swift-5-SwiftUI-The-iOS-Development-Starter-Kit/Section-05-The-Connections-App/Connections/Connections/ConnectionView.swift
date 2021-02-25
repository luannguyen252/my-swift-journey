//
//  ConnectionView.swift
//  Connections
//
//  Created by Pao Yu on 2020-07-10.
//

import SwiftUI

struct ConnectionView: View {
    
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 80, height: 80)
            .clipShape(Circle())
    }
}
