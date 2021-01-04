//
//  CardView.swift
//  MVVMApp3
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    var accountDetails: Account
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 16) {
            AnimatedImage(url: URL(string: self.accountDetails.avatar_url))
                .resizable()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 8) {
                Text(self.accountDetails.login)
                
                Text("\(self.accountDetails.id)")
                    .font(.caption)
            }
            
            Spacer(minLength: 0)
        } //: HSTACK
        .padding(.horizontal)
        .padding(.top)
    }
}
