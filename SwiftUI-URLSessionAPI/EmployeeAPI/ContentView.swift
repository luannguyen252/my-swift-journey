//
//  ContentView.swift
//  EmployeeAPI
//
//  Created by Usman Mukhtar on 05/08/2020.
//

import SwiftUI

struct ContentView: View {
    @State var employee: [EmpData] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(employee) { emp in
                    NavigationLink(destination: UpdateUser(id: emp.userId ?? "")){
                        Text("\(emp.name ?? "")").padding()
                    }
                }
            }.onAppear(){
                Api().getAllEmployee { (employee) in
                    self.employee = employee
                }
            }
            .navigationBarTitle("EmployeeList")
            .navigationBarItems(trailing:
                NavigationLink(destination: AddEmployee()){
                    Image(systemName: "plus")
                    
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
