//
//  MountUnmountTransition.swift
//  SwiftUIBook
//
//  Created by muukii on 2020/01/26.
//  Copyright © 2020 muukii. All rights reserved.
//

import Foundation

import SwiftUI

struct MountUnmountTransitionView: BookView {
  
  @State private var flag = false
  
  var body: some View {
    VStack {
      Button(action: {
        self.flag.toggle()
      }) {
        Text("Toggle")
      }
      if flag {
        TransitionView()
          .transition(
            AnyTransition.asymmetric(
              insertion: AnyTransition.move(edge: .bottom),
              removal: AnyTransition.move(edge: .trailing)
            )
        )
        .animation(.easeInOut(duration: 1))
      }
    }
  }
}

extension MountUnmountTransitionView {
  
  struct TransitionView: View {
    
    var body: some View {
      ZStack {
        Color.orange
      }
    }
  }
  
}
