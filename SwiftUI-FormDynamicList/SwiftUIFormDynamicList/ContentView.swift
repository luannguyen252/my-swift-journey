//
//  ContentView.swift
//  SwiftUIPlayground
//
//  Created by Alex Paul on 9/7/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject var sentence: Sentence
  
  @State private var showingModalView = false
  
  var body: some View {
    NavigationView {
      Form {
        Image("pursuit")
          .aspectRatio(contentMode: .fit)
        VStack {
          Text("This year I have gone to two amazing Swift conference, namely WWDC and try! Swift NYC.").font(.largeTitle)
        }
        HStack(alignment: .center) {
          Image(systemName: "g.circle").font(.largeTitle)
          Image(systemName: "l.circle").font(.largeTitle)
          Image(systemName: "t.circle").font(.largeTitle)
        }
        VStack(alignment: .center) {
          Text("Notes").font(.largeTitle)
            .foregroundColor(Color.blue)
        }
        List {
          ForEach(sentence.sentences, id: \.self) {
            Text($0).font(.title)
          }
          .onDelete(perform: delete)
        }.foregroundColor(Color.green)
      }
      .navigationBarTitle("My Journal")
      .navigationBarItems(trailing: Button(action: {
        self.showingModalView = true
      }) {
        Image(systemName: "plus").font(.largeTitle)
      })
        .sheet(isPresented: $showingModalView, content: {
          AddNotesView().environmentObject(self.sentence)
      })
    }
  }
  
  func delete(offsets: IndexSet) {
    sentence.sentences.remove(atOffsets: offsets)
  }
}

struct ContentView_previews: PreviewProvider {
  static var previews: some View {
    ContentView().environmentObject(Sentence())
  }
}
