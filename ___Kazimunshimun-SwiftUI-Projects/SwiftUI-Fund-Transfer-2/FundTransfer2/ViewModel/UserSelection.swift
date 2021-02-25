//
//  UserSelection.swift
//  FundTransfer2
//
//  Created by Anik on 29/9/20.
//

import SwiftUI

struct Data {
    static let userData = [
        User(id: 0, imageName: "alex_pp", offsetValue: CGPoint(x: 80, y: 120)),
        User(id: 1, imageName: "jennifer_pp", offsetValue: CGPoint(x: 140, y: 0)),
        User(id: 2, imageName: "lisa_pp", offsetValue: CGPoint(x: 20, y: -145)),
        User(id: 3, imageName: "mike_pp", offsetValue: CGPoint(x: -140, y: -70)),
        User(id: 4, imageName: "sandra_pp", offsetValue: CGPoint(x: -80, y: 120)),
        
        User(id: 5, imageName: "travis_pp", offsetValue: CGPoint(x: 80, y: 120)),
        User(id: 6, imageName: "oliva", offsetValue: CGPoint(x: 140, y: 0)),
        User(id: 7, imageName: "blake", offsetValue: CGPoint(x: 20, y: -145)),
        User(id: 8, imageName: "carl", offsetValue: CGPoint(x: -140, y: -70)),
        User(id: 9, imageName: "dale", offsetValue: CGPoint(x: -80, y: 120)),
        
        User(id: 10, imageName: "elon", offsetValue: CGPoint(x: 80, y: 120)),
        User(id: 11, imageName: "mark", offsetValue: CGPoint(x: 140, y: 0)),
        User(id: 12, imageName: "john", offsetValue: CGPoint(x: 20, y: -145)),
        User(id: 13, imageName: "kat", offsetValue: CGPoint(x: -140, y: -70)),
        User(id: 14, imageName: "mila", offsetValue: CGPoint(x: -80, y: 120))
    ]
}
class UserSelection: ObservableObject {
    @Published var users: [User] = []
    @Published var isRefreshing = false
    
    var selecedUserId = -1
    var refreshCount = -1
    
    func updateUsers() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.users.removeAll()
            for i in Array(stride(from: self.refreshCount * 5, to: (self.refreshCount * 5) + 5, by: 1)) {
                self.users.append(Data.userData[i])
            }
            
            withAnimation(.linear(duration: 0.7)) {
                self.isRefreshing = false
            }
        }
    }
    
    func selectUser(id: Int) {
        if let i = users.firstIndex(where: { $0.id == id }) {
            users[i].selected.toggle()
            
            if let j = users.firstIndex(where: { $0.id == selecedUserId }) {
                users[j].selected.toggle()
            }
            selecedUserId = id
        }
    }
    
    func refreshUsers() {
        isRefreshing = true
        refreshCount = (refreshCount + 1) % 3
        updateUsers()
    }
}
