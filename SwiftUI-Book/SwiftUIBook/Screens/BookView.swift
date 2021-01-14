//
//  BookView.swift
//  SwiftUIBook
//
//  Created by muukii on 2020/07/06.
//  Copyright © 2020 muukii. All rights reserved.
//

import SwiftUI

protocol BookView: View {

  var title: String { get }
  var summary: String { get }
}

extension BookView {

  var title: String { String(reflecting: self) }
  var summary: String { String(reflecting: self) }

  func build() -> BookSelectionView {
    .init(title: title, destination: self)
  }
}

struct BookSelectionView: View, Identifiable {

  let id: UUID = UUID()

  let title: String
  let destination: AnyView

  init<D: View>(title: String, destination: D) {
    self.title = title
    self.destination = AnyView(destination)
  }

  var body: some View {
    NavigationLink(destination: destination) {
      HStack {
        Text(title)
      }
      .frame(maxWidth: .infinity)
      .padding(.all, 10)
      .background(Color.init(white: 0.5, opacity: 0.5))
      .padding(.all, 10)
    }
  }
}
