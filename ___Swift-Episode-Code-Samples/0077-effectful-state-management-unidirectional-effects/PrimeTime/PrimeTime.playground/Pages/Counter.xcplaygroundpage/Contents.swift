import ComposableArchitecture
import Counter
import PlaygroundSupport
import SwiftUI

PlaygroundPage.current.liveView = UIHostingController(
  rootView: CounterView(
    store: Store<CounterViewState, CounterViewAction>(
      initialValue: (0, []),
      reducer: counterViewReducer
    )
  )
)
