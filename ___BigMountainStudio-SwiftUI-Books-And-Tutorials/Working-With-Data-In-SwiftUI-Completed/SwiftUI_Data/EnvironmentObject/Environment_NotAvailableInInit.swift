//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

class UserViewModel: ObservableObject {
    @Published var userName = "paulsundell"
}

struct Environment_NotAvailableInInit: View {
    @EnvironmentObject var viewModel: UserViewModel
    @State private var highlight = false
    
    init() {
        // Environment objects are not accessible in the init.
//        if viewModel.userName == "paulsundell" {
//            highlight = true
//        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("@EnvironmentObject",
                       subtitle: "Not Available in init()",
                       desc: "You can't access the environment object from your views init. If you find yourself trying to do this, there's probably a better solution for your problem.", back: .purple, textColor: .white)
            
            Text(viewModel.userName)
                .padding()
                .background(viewModel.userName == "paulsundell" ? Color.yellow : Color.clear)
        }
        .font(.title)
    }
}

struct Environment_NotAvailableInInit_Previews: PreviewProvider {
    static var previews: some View {
        Environment_NotAvailableInInit()
            .environmentObject(UserViewModel())
    }
}
