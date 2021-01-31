//
//  BasicScaleView.swift
//  SwiftUICoolAnimationTransition
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct AddProfile: View {
    @State private var addProfile: Bool = false
    @State private var profileCompleted: Bool = false
    @State private var name: String = ""
    @State private var lastName: String = ""
    
    var body: some View {
        VStack {
            HStack { Spacer() }
            Button(action: {
                self.addProfile = true
            }, label: {
                Image(systemName: addProfile ? "person.circle.fill" : "person.crop.circle.badge.plus")
                    .font(.system(size: 60))
                    .foregroundColor(Color(UIColor.label))
            })
            .animation(.interpolatingSpring(mass: 0.5, stiffness: 100, damping: 9, initialVelocity: 4))
           
            if addProfile {
                Group {
                    Spacer().frame(height: 40)

                    TextField("Name", text: $name, onEditingChanged: { (editing) in
                        self.isCompleted()
                    }) {
                        self.isCompleted()
                    }
                    
                    Divider()

                    Spacer().frame(height: 20)

                    TextField("Last Name", text: $lastName, onEditingChanged: { (editing) in
                        self.isCompleted()
                    }) {
                        self.isCompleted()
                    }
                    
                    Divider()

                    Spacer().frame(height: 40)
                    
                    Button(action: {
                        self.addProfile = false
                        self.profileCompleted = false
                        self.name = ""
                        self.lastName = ""
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(Color(UIColor.tertiaryLabel))
                    })
                }
                .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))

                if profileCompleted {
                    Spacer().frame(height: 40)
                    
                    Button(action: {
                        self.addProfile = false
                    }, label: {
                        Text("Save Profile")
                            .foregroundColor(Color(UIColor.label))
                    })
                    .transition(
                        .asymmetric(
                            insertion: AnyTransition.move(edge: .trailing).combined(with: .opacity),
                            removal: AnyTransition.move(edge: .bottom).combined(with: .opacity))
                    )
                }

                Spacer()
            }
        }
        .padding(40)
        .padding(.top, 20)
        .animation(.easeOut)
        .navigationBarTitle(Text("Add Profile"))
    }

    private func isCompleted() {
        if self.name.count > 0 && self.lastName.count > 0 {
            self.profileCompleted = true
        }
    }
}

struct BasicScaleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddProfile()
        }
    }
}
