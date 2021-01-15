//
//  ContentView.swift
//  SwiftUIForm
//
//  Copyright © 2019 ProgrammingWithSwift. All rights reserved.
//

import SwiftUI

struct Location {
    static let allLocations = [
        "New York",
        "London",
        "Tokyo",
        "Berlin",
        "Paris"
    ]
}

struct ContentView: View {
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var location = ""
    @State private var termsAccepted = false
    @State private var age = 20
    
    private let oldPasswordToConfirmAgainst = "12345"
    @State private var oldPassword = ""
    @State private var newPassword = ""
    @State private var confirmedPassword = ""
    
    @State private var keyboardOffset: CGFloat = 0
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section(header: Text("User Details")) {
                        TextField("Firstname",
                                  text: $firstname)
                        TextField("Lastname",
                                  text: $lastname)
                        Picker(selection: $location,
                               label: Text("Location")) {
                                ForEach(Location.allLocations, id: \.self) { location in
                                    Text(location).tag(location)
                                }
                        }
                        
                        Toggle(isOn: $termsAccepted,
                               label: {
                                Text("Accept terms and conditions")
                        })
                        
                        Stepper(value: $age,
                                in: 18...100,
                                label: {
                            Text("Current age: \(self.age)")
                        })
                        
                        if self.isUserInformationValid() {
                            Button(action: {
                                print("Updated profile")
                            }, label: {
                                Text("Update Profile")
                            })
                        }
                    }
                    
                    Section(header: Text("Password")) {
                        SecureField("Enter old password", text: $oldPassword)
                        SecureField("New Password", text: $newPassword)
                        SecureField("Confirm New Password", text: $confirmedPassword)
                        
                        if self.isPasswordValid() {
                            Button(action: {
                                print("Updated password")
                            }, label: {
                                Text("Update password")
                            })
                        }
                    }
                }.navigationBarTitle(Text("Profile"))
            }
            .offset(y: -self.keyboardOffset)
            .onAppear {
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification,
                                                       object: nil,
                                                       queue: .main) { (notification) in
                                                        NotificationCenter.default.addObserver(
                                                            forName: UIResponder.keyboardDidShowNotification,
                                                            object: nil,
                                                            queue: .main) { (notification) in
                                                                guard let userInfo = notification.userInfo,
                                                                    let keyboardRect = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
                                                                
                                                                self.keyboardOffset = keyboardRect.height
                                                        }
                                                        
                                                        NotificationCenter.default.addObserver(
                                                            forName: UIResponder.keyboardDidHideNotification,
                                                            object: nil,
                                                            queue: .main) { (notification) in
                                                                self.keyboardOffset = 0
                                                        }
                }
            }
        }.background(Color(UIColor.systemGray6))
    }
    
    private func isUserInformationValid() -> Bool {
        if firstname.isEmpty {
            return false
        }
        
        if lastname.isEmpty {
            return false
        }
        
        if !termsAccepted {
            return false
        }
        
        if location.isEmpty {
            return false
        }
        
        return true
    }
    
    private func isPasswordValid() -> Bool {
        if oldPassword != oldPasswordToConfirmAgainst {
            return false
        }
        
        if !newPassword.isEmpty && newPassword == confirmedPassword {
            return true
        }
        
        return false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
