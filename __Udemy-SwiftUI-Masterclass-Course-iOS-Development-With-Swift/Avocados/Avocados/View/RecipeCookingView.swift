//
//  Created by Robert Petras
//  SwiftUI Masterclass ♥ Better Apps. Less Code.
//  https://swiftuimasterclass.com
//

import SwiftUI

struct RecipeCookingView: View {
  // MARK: - PROPERTIES
  
  var recipe: Recipe
  
  var body: some View {
    HStack(alignment: .center, spacing: 12) {
      HStack(alignment: .center, spacing: 2) {
        Image(systemName: "person.2")
        Text("Serves: \(recipe.serves)")
      }
      HStack(alignment: .center, spacing: 2) {
        Image(systemName: "clock")
        Text("Prep: \(recipe.preparation)")
      }
      HStack(alignment: .center, spacing: 2) {
        Image(systemName: "flame")
        Text("Cooking: \(recipe.cooking)")
      }
    }
    .font(.footnote)
    .foregroundColor(Color.gray)
  }
}

struct RecipeCookingView_Previews: PreviewProvider {
  static var previews: some View {
    RecipeCookingView(recipe: recipesData[0])
      .previewLayout(.fixed(width: 320, height: 60))
  }
}
