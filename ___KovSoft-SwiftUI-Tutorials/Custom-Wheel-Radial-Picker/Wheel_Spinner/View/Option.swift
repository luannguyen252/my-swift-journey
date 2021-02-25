//
//  Option.swift
//  Wheel_Spinner
//
//  Created by Balaji on 25/09/20.
//

import SwiftUI

struct Option: View {
    var image : String
    var body: some View {
       
        Button(action: {}) {
            Image(systemName: image)
                .font(.title2)
                .foregroundColor(.white)
        }
    }
}
