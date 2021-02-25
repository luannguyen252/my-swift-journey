//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct GridItem_Alignment: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("GridItem")
                .font(.largeTitle)
            
            Text("Alignment")
                .foregroundColor(.gray)
            
            Text("Align your repeated views somehow....")
                .frame(maxWidth: .infinity)
                .padding().font(.title)
                .background(Color.yellow)
                .foregroundColor(.black)
            
            let gridItem = [GridItem(.adaptive(minimum: 30), alignment: Alignment.bottom)]
            
            Text("Default")
            LazyHGrid(rows: gridItem){
                ForEach(0 ..< 40) { index in
                    Image(systemName: "\(index).circle")
                        .border(Color.red)
                }
            }
            .border(Color.red)
        }
        .font(.title)
    }
}

struct GridItem_Alignment_Previews: PreviewProvider {
    static var previews: some View {
        GridItem_Alignment()
    }
}
