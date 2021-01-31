//
//  ScoreView.swift
//  SwiftUIStateBinding
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct ScoreView: View {
    // MARK: - PROPERTIES
    @ObservedObject var userStats = UserStats()
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Text("\(self.userStats.score)")
                .font(.largeTitle)
            
            Button(action: {
                self.userStats.score += 1
            }, label: {
                Text("Add Point").foregroundColor(Color.white)
            })
            .padding()
            .background(Color.orange)
            .cornerRadius(10)
        } //: VSTACK
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
#endif
