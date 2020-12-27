//
//  ClockView.swift
//  SwiftUIFlipClock
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct ClockView: View {
    let viewModel = ClockViewModel()

    var body: some View {
        HStack(spacing: 16) {
            HStack(spacing: 8) {
                FlipView(viewModel: viewModel.flipViewModels[0])
                FlipView(viewModel: viewModel.flipViewModels[1])
            }
            
            HStack(spacing: 8) {
                FlipView(viewModel: viewModel.flipViewModels[2])
                FlipView(viewModel: viewModel.flipViewModels[3])
            }
            
            HStack(spacing: 8) {
                FlipView(viewModel: viewModel.flipViewModels[4])
                FlipView(viewModel: viewModel.flipViewModels[5])
            }
        }
    }

}
