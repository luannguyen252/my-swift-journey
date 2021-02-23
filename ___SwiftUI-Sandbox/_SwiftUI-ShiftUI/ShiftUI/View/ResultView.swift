//
//  ResultView.swift
//  ShiftUI
//
//  Created by Zoha on 2/20/21.
//

import SwiftUI

struct ResultView: View {
  @Environment(\.presentationMode) var presentationMode
  
  let score: Int
  
  var body: some View {
    ZStack {
      Color.offWhite.edgesIgnoringSafeArea(.all)
      
      VStack {
        Button("Restart") {
          // need to dismiss all views back to the root here
          presentationMode.wrappedValue.dismiss()
        }
        
        Spacer()
        
        Text("Winner Winner\nChicken Dinner...!")
          .font(.largeTitle)
          .fontWeight(.medium)
          .multilineTextAlignment(.center)
        
        Spacer()
        
        SuccessView(score: score)
        
        Spacer()
      }
    }
    .foregroundColor(.grayText)
  }
}

struct ResultView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ResultView(score: 343)
    }
  }
}
