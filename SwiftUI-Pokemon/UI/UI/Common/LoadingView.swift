//
//  LoadingView.swift
//  UI
//
//  Created by josh on 2019/07/31.
//  Copyright © 2019 josh. All rights reserved.
//

import SwiftUI

public struct LoadingView: View {
    public var body: some View {
        VStack {
            ActivityIndicator(style: .large)
            Text("Loading...").font(.system(.caption))
        }
    }
}
