//
//  AddEmployee.swift
//  EmployeeAPI
//
//  Created by Usman Mukhtar on 08/08/2020.
//

import SwiftUI

struct AddEmployee: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var user: User = User()
    @State var showAlert = false
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear(){
                Api().addEmployee { (user) in
                    self.user = user
                    self.showAlert = true
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(user.title ?? ""),
                    message: Text("Added \(user.body ?? "" ) successfully"),
                    dismissButton: Alert.Button.default(Text("Go Back"), action: {
                        presentationMode.wrappedValue.dismiss()
                    })
                )
            }
    }
}
