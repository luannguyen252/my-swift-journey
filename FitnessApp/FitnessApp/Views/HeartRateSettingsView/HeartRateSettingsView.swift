//
//  HeartRateSettingsView.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct HeartRateSettingsView: View {
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 0) {
            InfoView()
            ControlView()
                .frame(width: 100)
        } //: HSTACK
        .padding(.top, 50)
        .background(ColorConstants.heartRateBackground)
        .edgesIgnoringSafeArea(.all)
        .environmentObject(HeartRateManager())
    }
}

// MARK: - PREVIEW
#if DEBUG
struct HeartRateSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        HeartRateSettingsView()
    }
}
#endif
