//
//  PlayPauseView.swift
//  StepCounter
//
//  Created by Anik on 18/8/20.
//

import SwiftUI

struct PlayPauseView: View {
    @EnvironmentObject var manager: StepCountManager
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 35)
                .fill(Color.white)
                .frame(width: 170, height: 70)
                .shadow(color: Color.black.opacity(0.5), radius: 20, x: 5.0, y: 15.0)
            
            HStack {
                ZStack {
                    Circle()
                        .fill(ColorConstants.bottomColor2)
                        .frame(width: 60, height: 60)
                    
                    Image(systemName: manager.start ? "pause.fill" : "play.fill")
                        .font(.title)
                        .foregroundColor(.white)
                }
                
                Text(manager.start ? "Pause" : "Start")
                    .font(.system(size: 24))
                    .bold()
                    .fixedSize()
                    .frame(width: 60)
                    .padding(.leading, 8)
                    
            }
            .offset(x: -12)
        }
        .onTapGesture {
            manager.updateData()
        }
    }
}
