//
//  Email.swift
//  CoursesApp
//
//  Created by Luan Nguyen on 13/12/2020.
//

import SwiftUI

struct Email: View {
    // MARK: - EMAIL
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("text"))
                } //: VSTACK
                .foregroundColor(.black)
                
                Spacer(minLength: 0)
            } //: HSTACK
            .padding()
            
            Spacer()
            
            ZStack {
                LottieView(filename: "EmailEquilibrium")
            }
            .frame(width: 360, height: 360, alignment: .center)
            
            Text("You don't have any message yet.")
                .font(.title2)
                .fontWeight(.regular)
                .foregroundColor(Color("text"))
            
            Spacer()
            
            Spacer()
        } //: VSTACK
    }
}

