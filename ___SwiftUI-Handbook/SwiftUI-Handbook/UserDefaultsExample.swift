import SwiftUI

struct UserDefaultsExample: View {
    let savedEmail = UserDefaults.standard.string(forKey: "email")
    
    var body: some View {
        Text(savedEmail!)
            .padding()
            .onAppear() {
                let userEmail = "stephanie@email.com"
                UserDefaults.standard.set(userEmail, forKey: "email")
            }
    }
}

/*
 // An integer
 let userAge = 40
 UserDefaults.standard.set(userAge, forKey: "age")

 // A boolean
 let userIsLoggedIn = true
 UserDefaults.standard.set(userIsLoggedIn, forKey: "isLoggedIn")

 // A date
 let userLastLoginTime = Date()
 UserDefaults.standard.set(userLastLoginTime, forKey: "lastLoginTime")
 */

#if DEBUG
struct UserDefaultsExample_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultsExample()
    }
}
#endif
