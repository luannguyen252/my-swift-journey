
//  Created by Mark Moeykens on 6/16/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.

import SwiftUI

struct Spacer_1_00 : View {
    var body: some View {
        VStack {
            Text("Spacer")
                .font(.largeTitle)
            
            Text("Introduction")
                .foregroundColor(.gray)
            
            Text("Spacers push things away either vertically or horizontally.")
                .frame(maxWidth: .infinity)
                .padding().font(.title)
                .background(Color.yellow)
                .foregroundColor(.black)
            
            Image(systemName: "arrow.up.circle.fill")
            
            Spacer()
            
            Image(systemName: "arrow.down.circle.fill")
            
            HStack {
                Text("Horizontal Spacer")
                
                Image(systemName: "arrow.left.circle.fill")
                
                Spacer() 
                
                Image(systemName: "arrow.right.circle.fill")
            }
            .padding(.horizontal)
            
            Color.yellow
                .frame(maxHeight: 50) // Height can decrease but not go higher than 50
        }
            .font(.title) // Apply this font to every view within the VStack
    }
}

struct Spacer_1_00_Previews : PreviewProvider {
    static var previews: some View {
        Spacer_1_00()
    }
}
