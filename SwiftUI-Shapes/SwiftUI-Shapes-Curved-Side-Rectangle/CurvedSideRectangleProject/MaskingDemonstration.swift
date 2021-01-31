//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MaskingDemonstration: View {
    var body: some View {
        ZStack {
            Color.themeBackground
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("vishnu.r.nair")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipShape(CurvedSideRectangle(bottomOffset: 40))
                    .shadow(radius: 12, y: 10)
                
                Spacer()
                
                // Other Content
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct MaskingDemonstration_Previews: PreviewProvider {
    static var previews: some View {
        MaskingDemonstration()
    }
}
