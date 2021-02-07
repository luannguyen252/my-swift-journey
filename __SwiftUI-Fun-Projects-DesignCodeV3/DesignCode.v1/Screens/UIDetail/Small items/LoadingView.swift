//
//  LoadingView.swift
//  DesignCode.v3
//
//  Created by Tee Becker on 11/6/20.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            LottieView(filename: "9619-loading-dots-in-yellow")
                .frame(width: 200, height: 200)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
