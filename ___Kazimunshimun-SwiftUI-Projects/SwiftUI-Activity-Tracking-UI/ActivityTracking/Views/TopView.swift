//
//  TopView.swift
//  ActivityTracking
//
//  Created by Anik on 14/11/20.
//

import SwiftUI

struct TopView: View {
    @Environment(\.presentationMode) var presentation
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Button(action: {
                    presentation.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20))
                        .padding()
                        .foregroundColor(.black)
                })

                Text("Monday")
                    .font(.system(size: 24, weight: .semibold))
                
                Text("Oct 29, 2020")
            }
            
            Spacer()
        }
    }
}
