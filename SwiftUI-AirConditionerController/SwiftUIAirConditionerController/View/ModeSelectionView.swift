//
//  ModeSelectionView.swift
//  SwiftUIAirConditionerController
//
//  Created by Luan Nguyen on 26/12/2020.
//

import SwiftUI

struct ModeSelectionView: View {
    @ObservedObject var modeSelector = ModeSelector()
    
    var body: some View {
        HStack(spacing: 16) {
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
                .frame(width: 56, height: 56)
            
            Circle()
                .fill(mode.selected ? Color.red : Color.clear)
                .frame(width: 56, height: 56)
            
            Image(systemName: mode.imageName)
                .renderingMode(.template)
                .foregroundColor(mode.selected ? .white : .gray)
        }
    }
}
