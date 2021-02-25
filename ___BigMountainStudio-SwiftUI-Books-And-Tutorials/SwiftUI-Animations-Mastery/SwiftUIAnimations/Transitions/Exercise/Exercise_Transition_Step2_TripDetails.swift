//
//  Exercise_Transition_Step2_TripDetails.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/24/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct TripDetailsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Destination:")
                .foregroundColor(Color("Foreground3"))
            Button(action: {}) {
                Text("Select")
                Spacer()
                Image(systemName: "chevron.right")
            }
            Text("Departure:")
                .foregroundColor(Color("Foreground3"))
                .padding(.top)
            Button(action: {}) {
                Text("Today")
                Spacer()
                Image(systemName: "chevron.right")
            }
            Text("Return:")
                .foregroundColor(Color("Foreground3"))
                .padding(.top)
            Button(action: {}) {
                Text("Tomorrow")
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
        .padding(25)
        .background(RoundedRectangle(cornerRadius: 10)
        .foregroundColor(Color("Secondary3")))
        .padding(40)
        .font(.body)
    }
}

struct TripDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TripDetailsView()
    }
}
