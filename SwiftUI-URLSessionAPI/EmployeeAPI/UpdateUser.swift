//
//  UpdateUser.swift
//  EmployeeAPI
//
//  Created by Usman Mukhtar on 08/08/2020.
//

import SwiftUI

struct UpdateUser: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var showAlert = false
    @State var user: User = User()
    
    let id: String
    
    var body: some View {
        VStack {
            Text("\(user.title ?? "")")
                .onAppear(){
                    Api().getSingleUser(param: id) { (user) in
                        self.user = user
                    }
                }
            
            Button(action: {
                Api().updateEmployee { (user) in
                    self.user = user
                    self.showAlert = true
                }
            }){
                Text("Update User")
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(user.title ?? ""),
                    message: Text("Updated \(user.body ?? "" ) successfully"),
                    dismissButton: Alert.Button.default(Text("Go Back"), action: {
                        presentationMode.wrappedValue.dismiss()
                    })
                )
            }
        }
        
    }
}
