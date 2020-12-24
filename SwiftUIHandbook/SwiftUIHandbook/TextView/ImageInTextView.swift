//
//  ImageInTextView.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct ImageInTextView: View {
    // MARK: - BODY
    var body: some View {
        Text("Hello, \(Image(systemName: "globe"))!")
            .font(.title)
            .fontWeight(.bold)
    }
}

// MARK: - PREVIEW
struct ImageInTextView_Previews: PreviewProvider {
    static var previews: some View {
        ImageInTextView()
    }
}
