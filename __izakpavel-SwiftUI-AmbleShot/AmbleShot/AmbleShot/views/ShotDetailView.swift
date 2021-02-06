//
//  ShotDetailView.swift
//  AmbleShot
//
//  Created by myf on 04/11/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

import SwiftUI

struct ShotDetailView: View {
    @ObservedObject var shot: Shot
    
    func statusText()->String {
        if (self.shot.state == .loading) {
            return "Loading..."
        }
        else if self.shot.noImageAvailable() {
            return "No Image available"
        }
        else {
            return ""
        }
    }
    
    var body: some View {
        
        
        VStack {
            Spacer()
            Image(uiImage: UIImage(contentsOfFile: self.shot.fullImagePath() ?? "") ?? UIImage(named: "placeholder")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            HStack{
                Text(self.statusText())
                    .padding()
                Spacer()
                Text(self.shot.formattedLocation())
                    .padding()
            }
        }
        .navigationBarTitle(Text(self.shot.displayName()))
    }
}
