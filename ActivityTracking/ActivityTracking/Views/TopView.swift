//
//  TopView.swift
//  ActivityTracking
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct TopView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentation
    
    // MARK: - BODY
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Button(action: {
                    presentation.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 24))
                        .padding()
                        .foregroundColor(.black)
                })

                Text("Thursday")
                    .font(.system(size: 24, weight: .semibold))
                
                Text("Dec 24, 2020")
            } //: VSTACK
            
            Spacer()
        } //: HSTACK
    }
}
