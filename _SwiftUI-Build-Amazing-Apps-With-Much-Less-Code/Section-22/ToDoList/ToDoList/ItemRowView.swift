//
//  ItemRow.swift
//  ToDoList
//
//  Created by Stephen DeStefano on 8/20/19.
//  Copyright © 2019 Stephen DeStefano. All rights reserved.
//

import SwiftUI



struct ItemRowView: View {
    
    var item:String = ""
//original code
//  var dateCreated:String = ""
    var dateCreated:Date = Date()
    var priority:String = ""
    
    var body: some View {
        HStack{
            Text(priority)
            .font(.headline)
            
            VStack(alignment: .leading) {
                Text(item)
                    .font(.headline)
                
                Text("\(dateCreated)")
                    .font(.custom("Ariel", size: 10))
                    .lineLimit(3)
//original code
//                Text(dateCreated)
//                    .font(.caption)
            }
        }
     }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
       ItemRowView().previewLayout(.sizeThatFits)
    }
}
