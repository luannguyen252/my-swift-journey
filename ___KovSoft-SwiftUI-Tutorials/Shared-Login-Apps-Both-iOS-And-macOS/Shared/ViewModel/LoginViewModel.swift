import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    // Register
    @Published var reEnter = ""
    
    // For go to registration page
    @Published var gotoRegister = false
    
    // nacOS data
    var screen: CGRect {
        #if os(iOS)
        return UIScreen.main.bounds
        #else
        return NSScreen.main!.visibleFrame
        #endif
    }
    
    // Detecing for macOS
    @Published var ismacOS = false
    
    init() {
        #if !os(iOS)
        self.ismacOS = true
        #endif
    }
    
    // Clearing data when going to Login/Register Page
    func clearData(){
        email = ""
        password = ""
        reEnter = ""
    }
}
