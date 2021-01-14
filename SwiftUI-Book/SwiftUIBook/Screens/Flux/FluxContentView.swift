//
//  FluxContentView.swift
//  SwiftUIBook
//
//  Created by muukii on 2019/09/16.
//  Copyright © 2019 muukii. All rights reserved.
//

import SwiftUI

class Dependency {
  
}

struct AppState {
  
  struct Feed {
    var items: [String] = []
  }
  
  struct Search {
    var items: [String] = []
    
  }
  
  struct Notification {
    var items: [String] = []
    
  }
  
  var count: Int = 0
  
  var feed: Feed = .init()
  var search: Search = .init()
  var notification: Notification = .init()
}

class AppReducer: ReducerType {
  typealias TargetState = AppState
  
  private let dep: Dependency
  
  init(dep: Dependency) {
    self.dep = dep
  }
  
  func fetch() -> Action<Void> {
    .init { context in
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        context.dispatch { $0.increment() }
      }
    }
  }
  
  func increment() -> Mutation {
    .init {
      $0.count += 1
    }
  }
}

let dep = Dependency()

typealias AppStore = Store<AppReducer.TargetState, AppReducer>

let store = AppStore(
  state: AppState(),
  operations: AppReducer(dep: dep)
)


class FeedReducer: ReducerType {
  typealias TargetState = AppState.Feed
  
  private let dep: Dependency
  
  init(dep: Dependency) {
    self.dep = dep
  }
  
}

struct FluxContentView: BookView {
  
  var body: some View {
    FluxTabView().environmentObject(store)
  }
}

struct FluxTabView: View {
  
  @EnvironmentObject var store: AppStore
  
  var body: some View {
    Group {
      Button(action: {
        self.store.dispatch { $0.increment() }
      }) {
        Text("Increment")
      }
      Text(store.state.count.description)
    }
  }
}
