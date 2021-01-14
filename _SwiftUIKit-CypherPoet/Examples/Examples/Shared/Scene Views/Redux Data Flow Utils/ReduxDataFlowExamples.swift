//
// ReduxDataFlowExamples.swift
// Examples
//
// Created by CypherPoet on 8/20/20.
// ✌️
//

import SwiftUI


struct ReduxDataFlowExamples {
}


// MARK: - `View` Body
extension ReduxDataFlowExamples: View {

    var body: some View {
        List {
            NavigationLink(destination: ReduxDataFlow_SynchronousActionExample()) {
                Text("Synchronous Action")
            }
            NavigationLink(destination: ReduxDataFlow_AsyncSideEffectExample()) {
                Text("Async Side Effects")
            }
        }
        .navigationTitle("Redux Architecture Utils")
    }
}


// MARK: - Computeds
extension ReduxDataFlowExamples {
}


// MARK: - View Variables
private extension ReduxDataFlowExamples {
}


// MARK: - Private Helpers
private extension ReduxDataFlowExamples {
}


#if DEBUG
// MARK: - Preview
struct ReduxDataFlowExamples_Previews: PreviewProvider {

    static var previews: some View {
        ReduxDataFlowExamples()
    }
}
#endif
