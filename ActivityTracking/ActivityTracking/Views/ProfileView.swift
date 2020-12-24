//
//  ProfileView.swift
//  ActivityTracking
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 32) {
            ZStack {
                Circle()
                    .strokeBorder(lineWidth: 1)
                    .frame(width: 88, height: 88)
                Image("profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .cornerRadius(40)
            } //: ZSTACK
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Luan Nguyen")
                    .font(.system(size: 24, weight: .heavy))
                
                HStack(spacing: 32) {
                    VStack {
                        Text("40")
                            .font(.system(size: 24, weight: .bold))
                        Text("workouts")
                            .fontWeight(.regular)
                    } //: VSTACK
                    VStack {
                        Text("24")
                            .font(.system(size: 24, weight: .bold))
                        Text("hours")
                            .fontWeight(.regular)
                    } //: VSTACK
                } //: HSTACK
            } //: VSTACK
        } //: HSTACK
        .padding(.top, 16)
    }
}
