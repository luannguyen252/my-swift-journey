//
//  Sheet_Identifiable.swift
//  100Views
//
//  Created by Mark Moeykens on 8/18/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

// 1. Create an Identifiable struct to hold the data
struct DetailInfo: Identifiable {
    var id = UUID() // Conform to Identifiable
    let image: Image
}

struct Sheet_Identifiable: View {
    // 2. Create State var for the data
    @State private var details: DetailInfo? = nil
    
    var body: some View {
        Button("Show Details") {
            // 3. Trigger showing the sheet
            self.details = DetailInfo(image: Image(systemName: "star.circle"))
        }
        // 4. Listen for State variable changes to non-nil
        .sheet(item: $details) { detailInfo in
            DetailSheet(details: detailInfo)
        }
    }
}

struct DetailSheet: View {
    @Environment(\.presentationMode) var presentation
    let details: DetailInfo
    
    var body: some View {
        VStack(spacing: 20) {
            details.image
                .font(.largeTitle)
                .foregroundColor(.red)
            Text("Sheet")
                .font(.largeTitle)
            Text("Presenting with Identifiable")
                .font(.title)
                .foregroundColor(.gray)
            Text("By changing the State variable to a non nil value, you can trigger the Sheet to show.")
                .frame(maxWidth: .infinity)
                .padding()
                .font(.title)
                .background(Color.red)
                .foregroundColor(.white)
            
            Spacer()
            
            Button("Dismiss") {
                self.presentation.wrappedValue.dismiss()
            }
            .accentColor(.red)
            .padding(.bottom)
        }
        .padding(.top, 40)
    }
}

struct Sheet_Identifiable_Previews: PreviewProvider {
    static var previews: some View {
        Sheet_Identifiable()
    }
}
