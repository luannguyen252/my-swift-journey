//
//  Created by Robert Petras
//  SwiftUI Masterclass ♥ Better Apps. Less Code.
//  https://swiftuimasterclass.com 
//

import SwiftUI

struct CardView: View, Identifiable {
  // MARK: - PROPERTIES
  
  let id = UUID()
  var honeymoon: Destination
  
  var body: some View {
    Image(honeymoon.image)
      .resizable()
      .cornerRadius(24)
      .scaledToFit()
      .frame(minWidth: 0, maxWidth: .infinity)
      .overlay(
        VStack(alignment: .center, spacing: 12) {
          Text(honeymoon.place.uppercased())
            .foregroundColor(Color.white)
            .font(.largeTitle)
            .fontWeight(.bold)
            .shadow(radius: 1)
            .padding(.horizontal, 18)
            .padding(.vertical, 4)
            .overlay(
              Rectangle()
                .fill(Color.white)
                .frame(height: 1),
              alignment: .bottom
          )
          Text(honeymoon.country.uppercased())
            .foregroundColor(Color.black)
            .font(.footnote)
            .fontWeight(.bold)
            .frame(minWidth: 85)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(
              Capsule().fill(Color.white)
            )
        }
        .frame(minWidth: 280)
        .padding(.bottom, 50),
        alignment: .bottom
      )
  }
}

struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView(honeymoon: honeymoonData[0])
      .previewLayout(.fixed(width: 375, height: 600))
  }
}
