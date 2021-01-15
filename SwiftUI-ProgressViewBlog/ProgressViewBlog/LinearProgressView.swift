//
//  LinearProgressView.swift
//  ProgressViewBlog
//
//  Created by Thomas Prezioso on 9/14/20.
//

import SwiftUI

struct LinearProgressView: View {
    @State private var currentProgress = 0.0
    let timer = Timer.publish(every: 0.09, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ProgressView("Downloading…", value: currentProgress, total: 100)
            .padding()
            .onReceive(timer) { _ in
                if currentProgress < 100 {
                    currentProgress += 1
                }
            }
            .accentColor(.purple)
            .foregroundColor(.red)
    }
}

struct LinearProgressView_Previews: PreviewProvider {
    static var previews: some View {
        LinearProgressView()
    }
}
