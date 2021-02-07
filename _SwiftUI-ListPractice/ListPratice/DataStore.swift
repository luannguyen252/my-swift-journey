//
//  DataStore.swift
//  ListPratice
//
//  Created by jb on 2020/10/12.
//

import Foundation
import SwiftUI
import Combine

struct Task: Identifiable {
    var id = String()
    var toDoItem = String()
    
    //Add more Complicated stuff later if you want.
    
}

class TaskStore : ObservableObject {
    @Published
    var tasks = [Task]()
    
}
