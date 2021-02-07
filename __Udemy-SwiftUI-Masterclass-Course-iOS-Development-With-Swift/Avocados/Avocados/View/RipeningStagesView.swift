//
//  Created by Robert Petras
//  SwiftUI Masterclass ♥ Better Apps. Less Code.
//  https://swiftuimasterclass.com
//

import SwiftUI

struct RipeningStagesView: View {
  // MARK: - PROPERTIES
  
  var ripeningStages: [Ripening] = ripeningData
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      VStack {
        Spacer()
        HStack(alignment: .center, spacing: 25) {
          ForEach(ripeningStages) { item in
            RipeningView(ripening: item)
          }
        }
        .padding(.vertical)
        .padding(.horizontal, 25)
        Spacer()
      }
    }
    .edgesIgnoringSafeArea(.all)
  }
}

struct RipeningStagesView_Previews: PreviewProvider {
  static var previews: some View {
    RipeningStagesView(ripeningStages: ripeningData)
  }
}
