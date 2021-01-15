//
//  TodoItemView.swift
//  CoreDataToDo
//
//  Created by Arlan on 10/19/20.
//

import SwiftUI

struct TodoItemView: View {
    var title:String = ""
    var createdAt:String = ""
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(title).font(.headline)
                Text(createdAt).font(.caption)
                
            }
        }
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemView()
    }
}
