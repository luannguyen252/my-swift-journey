//
//  ModeSelectionView.swift
//  SmartHomeTemperatureWheel
//
//  Created by Anik on 26/9/20.
//

import SwiftUI

struct ModeSelectionView: View {
    @ObservedObject var modeSelector = ModeSelector()
    var body: some View {
        HStack(spacing: 20) {
            ForEach(modeSelector.modes) { mode in
                ModeView(mode: mode)
                    .onTapGesture {
                        withAnimation {
                            modeSelector.selectMode(index: mode.id)
                        }
                    }
            }
        }
        .foregroundColor(.gray)
        .onAppear {
            modeSelector.selectMode(index: 0)
        }
    }
}

struct ModeView: View {
    let mode: Mode
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: mode.selected ? 0.0 : 2.0)
                .frame(width: 50, height: 50)
            
            Circle()
                .fill(mode.selected ? Color.red : Color.clear)
                .frame(width: 50, height: 50)
            
            Image(systemName: mode.imageName)
                .renderingMode(.template)
                .foregroundColor(mode.selected ? .white : .gray)
        }
    }
}
