//  Created by Cameron  Partee on 12/24/19.
//  Copyright © 2019 Cameron Partee. All rights reserved.

import SwiftUI

struct Row: View {
    
    var artist: Artist
    var body: some View {
        HStack {
            CircleImage(artist: artist)
            Text(artist.name)
                .font(.system(size: 25))
                .bold()
        }.frame(height: 90)
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row(artist: ArtistData[0])
    }
}
