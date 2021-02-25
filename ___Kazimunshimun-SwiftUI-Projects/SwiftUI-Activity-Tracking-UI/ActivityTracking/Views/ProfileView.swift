//
//  ProfileView.swift
//  ActivityTracking
//
//  Created by Anik on 14/11/20.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        HStack(spacing: 36) {
            ZStack {
                Circle()
                    .strokeBorder(lineWidth: 1)
                    .frame(width: 100, height: 100)
                Image("sandra_pp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Emaily Sherman")
                    .font(.system(size: 22, weight: .semibold))
                
                HStack(spacing: 36) {
                    VStack {
                        Text("36")
                            .font(.system(size: 24, weight: .bold))
                        Text("workouts")
                    }
                    VStack {
                        Text("24")
                            .font(.system(size: 24, weight: .bold))
                        Text("hours")
                    }
                }
            }
        }
    }
}
