//
//  AddNotesView.swift
//  SwiftUIPlayground
//
//  Created by Alex Paul on 9/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import SwiftUI

struct AddNotesView: View {
    
  @EnvironmentObject var sentence: Sentence
  
  @Environment(\.presentationMode) var presentationMode
  
  @State private var note: String = ""
  
  var body: some View {
    VStack(spacing: 20) {
      Spacer()
      TextField("enter your note", text: $note)
        .textFieldStyle(RoundedBorderTextFieldStyle.init())
      Button(action: {
        self.sentence.sentences.append(self.note)
        self.presentationMode.wrappedValue.dismiss()
        self.note = ""
      }) {
        Text("Save note")
      }
      Spacer()
    }
  }
}

struct AddNotesView_Previews: PreviewProvider {
  static var previews: some View {
    AddNotesView().environmentObject(Sentence())
  }
}
