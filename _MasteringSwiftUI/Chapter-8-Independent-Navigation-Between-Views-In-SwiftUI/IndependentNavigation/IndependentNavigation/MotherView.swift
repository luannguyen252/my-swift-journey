//
//  MotherView.swift
//  IndependentNavigation
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct MotherView: View {
    // MARK: - PROPERTIES
    // Set Current Page
    @State var currentPage: Page = .page1
    
    // StateObject View Router
    @StateObject var viewRouter: ViewRouter
    
    // MARK: - BODY
    var body: some View {
        switch viewRouter.currentPage {
        case .page1:
            ContentViewA(viewRouter: viewRouter)
        case .page2:
            ContentViewB(viewRouter: viewRouter)
        }
    }
}

// MARK: - PREVIEW
#if DEBUG
struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}
#endif
