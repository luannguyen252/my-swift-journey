import Foundation
import Combine

class SignUpViewModel:ObservableObject{
    // Input
    @Published var username:String = ""
    @Published var password:String = ""
    @Published var passwordAgain:String = ""
    
    // Output
    @Published var isValid:Bool = false
}
