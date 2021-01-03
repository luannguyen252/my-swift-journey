//
//  MotherView.swift
//  RealtimeChatMessengerFirebase
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct MotherView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var viewRouter: ViewRouter
    
    // MARK: - BODY
    var body: some View {
        VStack {
            switch viewRouter.currentPage {
            case .loginView:
                    LoginView()
                case .chatView:
                    ChatView()
                        .transition(.scale)
            }
        } //: VSTACK
    }
}

// MARK: - PREVIEW
#if DEBUG
struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter(pageToStartWith: .loginView))
    }
}
#endif
