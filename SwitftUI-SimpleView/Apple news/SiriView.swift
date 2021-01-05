//
//  SiriView.swift
//  Apple news
//
//  Created by Nicolas Rios on 12/14/19.
//  Copyright © 2019 Nicolas Rios. All rights reserved.
//

import SwiftUI

struct SiriView: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName:"waveform.circle")
                .font(.system(size: 50))
                
            .padding(.top, 8)
            
            VStack(alignment: .leading) {
                Text("siri suggests stories,and n/topics based on Safari and App. /n You can change this in Settings")
                    .lineLimit(3)
                
                Text("About Apple News and & Privacy ...")
                    .foregroundColor(.pink)
                    .padding(.vertical)        
            }
            .padding(.horizontal, 28)
        }
    }
}

struct SiriView_Previews: PreviewProvider {
    static var previews: some View {
        SiriView()
    }
}
