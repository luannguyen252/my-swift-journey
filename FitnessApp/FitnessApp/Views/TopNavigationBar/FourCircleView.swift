//
//  FourCircleView.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct FourCircleView: View {
    // MARK: - BODY
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.clear)
                .invertedRectangleNeomorphify(bottomOffset: -1)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack(spacing: 14) {
                VStack(spacing: 14) {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 5, height: 5)
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: 5, height: 5)
                } //: VSTACK
                
                VStack(spacing: 14) {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 5, height: 5)
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: 5, height: 5)
                } //: VSTACK
            } //: HSTACK
        } //: ZSTACK
        .frame(width: 60, height: 60)
    }
}
