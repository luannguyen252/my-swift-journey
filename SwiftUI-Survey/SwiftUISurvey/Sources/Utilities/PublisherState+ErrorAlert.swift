//
//  PublisherState+ErrorAlert.swift
//  SwiftUISurvey
//
//  Created by Amir on 09/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    func showErrors<T, R>(state: Binding<PublisherState<T, R>>) -> some View {
        let binding = Binding<Bool>.init(get: {
            state.wrappedValue.isError
        }, set: {
            if $0 == false {
                state.wrappedValue = .idle
            }
        })
        var errorMessage: String = ""
        if case .error(let error) = state.wrappedValue {
            errorMessage = error.localizedDescription
        }
        return alert(isPresented: binding) {
            Alert(
                title: Text("Error!"),
                message: Text(errorMessage)
            )
        }
    }
}
