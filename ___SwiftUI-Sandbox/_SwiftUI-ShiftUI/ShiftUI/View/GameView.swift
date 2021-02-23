//
//  ContentView.swift
//  ShiftUI
//
//  Created by Ryan Lintott on 2021-02-19.
//

import SwiftUI

struct GameView: View {
  @State private var showResult = false
  @Environment(\.presentationMode) var presentationMode

  let level: Int
  
  var body: some View {
    ZStack {
      NavigationLink(
        destination: ResultView(score: 345),
        isActive: $showResult,
        label: { Color.clear }
      )

      Color.offWhite.edgesIgnoringSafeArea(.all)

      VStack {
        Text("ShiftUI")
          .font(.largeTitle)
          .fontWeight(.bold)
        
        HStack {
          Spacer()
          Text("Steps: 5")
            .font(.title)
            .padding()
          Spacer()
        }
        .background(
          RoundedRectangle(cornerRadius: 10).neumorphicShadow()
        )
        .padding(.all, 30)
        .onTapGesture { showResult.toggle() } // added for demo purpose only
        
        Spacer()
        
        BoardView(level: level)
      }
    }
    .foregroundColor(.grayText)
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(
      trailing: Button {
        presentationMode.wrappedValue.dismiss()
      } label: {
        Image(systemName: "xmark.circle")
          .padding(.all, 8)
          .foregroundColor(.grayText)
      }
      .buttonStyle(TileButtonStyle(cornerRadius: 4))
    )
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      GameView(level: 4)
    }
  }
}

