//
//  MotherView.swift
//  IndependentNavigation-EnvironmentObject
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct MotherView: View {
    // MARK: - PROPERTIES
    // Set Current Page
    @State var currentPage: Page = .page1
    
    // EnvironmentObject View Router
    @EnvironmentObject var viewRouter: ViewRouter
    
    // MARK: - BODY
    var body: some View {
        switch viewRouter.currentPage {
        case .page1:
            ContentViewA()
        case .page2:
            ContentViewB()
                .transition(.scale)
        }
    }
}

// MARK: - PREVIEW
#if DEBUG
struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}
#endif
