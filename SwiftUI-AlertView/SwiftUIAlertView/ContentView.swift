//
//  ContentView.swift
//  SwiftUIAlertView
//
//  Created by Toomas Vahter on 24.02.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Alert Views")
            Button(action: viewModel.showAlertView) {
                Text("Show Alert View")
            }
        }.alert(isPresented: viewModel.isPresentingAlert, content: {
            Alert(localizedError: viewModel.activeError!)
        })
    }
}

final class ContentViewModel: ObservableObject {
    @Published private(set) var activeError: LocalizedError?

    var isPresentingAlert: Binding<Bool> {
        return Binding<Bool>(get: {
            return self.activeError != nil
        }, set: { newValue in
            guard !newValue else { return }
            self.activeError = nil
        })
    }
        
    func showAlertView() {
        activeError = LoginError.incorrectPassword
    }
}

extension Alert {
    init(localizedError: LocalizedError) {
        self = Alert(nsError: localizedError as NSError)
    }
    
    init(nsError: NSError) {
        let message: Text? = {
            let message = [nsError.localizedFailureReason, nsError.localizedRecoverySuggestion].compactMap({ $0 }).joined(separator: "\n\n")
            return message.isEmpty ? nil : Text(message)
        }()
        self = Alert(title: Text(nsError.localizedDescription),
                     message: message,
                     dismissButton: .default(Text("OK")))
    }
}

enum LoginError: LocalizedError {
    case incorrectPassword // invalidUserName etc
    
    var errorDescription: String? {
        switch self {
        case .incorrectPassword:
            return "Failed logging in account"
        }
    }
    
    var failureReason: String? {
        switch self {
        case .incorrectPassword:
            return "Entered password was incorrect"
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .incorrectPassword:
            return "Please try again with different password"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}
