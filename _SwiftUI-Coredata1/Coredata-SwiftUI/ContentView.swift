//
//  ContentView.swift
//  Coredata-SwiftUI
//
//  Created by Keerthi on 25/08/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var showEmployeeDetails = false
    @FetchRequest(entity: Employee.entity(),
                  sortDescriptors: [])
    
    var employees: FetchedResults<Employee>
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(employees, id: \.self) { employee in
                        VStack(alignment: .leading) {
                            HStack {
                                Text("\(employee.username ?? "")")
                                    .font(.headline)
                                Spacer()
                                Button("Update", action: {
                                    let newStatus = employee.experience == "Fresher" ? "Experienced" : "Fresher"
                                    self.managedObjectContext.performAndWait {
                                        employee.experience = newStatus
                                        try? self.managedObjectContext.save()
                                    }
                                })
                            }
                            Text("Gender: \(employee.gender ?? "")")
                            Text("Age: \(employee.age ?? "")")
                            Text("Experience: \(employee.experience ?? "")")
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            self.managedObjectContext.delete(self.employees[index])
                            try? self.managedObjectContext.save()
                        }
                    }
                }
                .buttonStyle(BorderlessButtonStyle())
            }
            .sheet(isPresented: $showEmployeeDetails) {
                EmployeeDetails().environment(\.managedObjectContext, self.managedObjectContext)
            }
            .navigationBarTitle("Emplyees")
            .navigationBarItems(trailing: Button(action: {
                self.showEmployeeDetails = true
            }, label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 32, height: 32, alignment: .center)
            }))
        }
    }
}


struct EmployeeDetails: View {
    
    @State var userName = ""
    @State var age = ""
    @State var selectedGenderIndex = 0
    @State var selectedExperienceIndex = 0
    let genderType = ["Male", "Female"]
    let experienceType = ["Fresher", "Experienced"]
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment (\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("User Name")) {
                    TextField("User Name", text: $userName)
                        .keyboardType(.default)
                }
                
                Section(header: Text("Age")) {
                    TextField("Age", text: $age)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Gender")) {
                    Picker(selection: $selectedGenderIndex, label: Text("Choose Gender")) {
                        ForEach(0 ..< genderType.count) {
                            Text(self.genderType[$0]).tag($0)
                        }
                    }
                }
                
                Section(header: Text("Experience")) {
                    Picker(selection: $selectedExperienceIndex, label: Text("Experience")) {
                        ForEach(0 ..< experienceType.count) {
                            Text(self.experienceType[$0]).tag($0)
                        }
                    }
                }
                
                Button(action: {
                    print("Save the employee!")
                    
                    guard self.userName != "", self.age != "" else { return }
                    let newEmployee = Employee(context: self.managedObjectContext)
                    newEmployee.username = self.userName
                    newEmployee.age = self.age
                    newEmployee.gender = self.genderType[self.selectedGenderIndex]
                    newEmployee.experience = self.experienceType[self.selectedExperienceIndex]
                    do {
                        try self.managedObjectContext.save()
                        print("Details saved.")
                        self.presentationMode.wrappedValue.dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                }) {
                    Text("Add Employee")
                }.navigationBarTitle("Add Employee")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeDetails()
    }
}
