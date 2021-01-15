//
//  Button.swift
//  SwiftUISurvey
//
//  Created by Amir on 13/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import SwiftUI

struct ActionButton: View {

    var title: String
    var action: () -> Void
    var isBusy: Bool = false
    var isDisabled: Bool = false


    var body: some View {
        if isBusy {
            ProgressView()
        } else {
            Button(title, action: action)
                .disabled(isDisabled)
        }
    }
}
