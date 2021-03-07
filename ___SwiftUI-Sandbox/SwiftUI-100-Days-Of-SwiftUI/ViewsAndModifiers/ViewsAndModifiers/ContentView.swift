//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Nicholas Fox on 11/29/19.
//  Copyright © 2019 Nicholas Fox. All rights reserved.
//

import SwiftUI

struct GridStack<Content: View>: View {

  let rows: Int
  let columns: Int
  let content: (Int, Int) -> Content

  var body: some View {
    VStack {
      ForEach(0..<rows) { row in
        HStack {
          ForEach(0..<self.columns) { column in
            self.content(row, column)
          }
        }
      }
    }
  }

}


struct ContentView: View {
  var body: some View {
    GridStack(rows: 4, columns: 4) { row, col in
      HStack {
        Image(systemName: "\(row * 4 + col).circle")
        Text("R\(row) C\(col)")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
