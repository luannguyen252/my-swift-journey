//
//  RowView.swift
//  MVVMApp4
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct RowView: View {
    var user: MVVMUser
    
    @ObservedObject var remoteImageUrl: RemoteImageUrl
    
    init(user: MVVMUser) {
        self.user = user
        remoteImageUrl = RemoteImageUrl(imageUrl: user.avatarUrl)
    }
    
    var body: some View {
        return GeometryReader { geometry in
            VStack() {
                Spacer()
                
                Image(uiImage: ((self.remoteImageUrl.data.isEmpty) ? UIImage(named: "Placeholder") : UIImage(data: self.remoteImageUrl.data))!)
                    .resizable()
                    .aspectRatio(contentMode: .fit).frame(width: 150, height: 150)
                
                Text("\(self.user.firstName) \(self.user.lastName)")
                
                Text("\(self.user.email)")
                
                Divider().padding(.vertical, 12)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}
