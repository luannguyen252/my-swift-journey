//
//  MoveExample.swift
//  Lists
//
//  Created by kim sunchul on 2020/05/22.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct MoveExample: View {
    @State private var users = ["Paul", "Taylor", "Adele"]

    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.self) { user in
                    Text(user)
                }
                .onMove(perform: move)
            }
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        users.move(fromOffsets: source, toOffset: destination)
    }
}

struct MoveExample_Previews: PreviewProvider {
    static var previews: some View {
        MoveExample()
    }
}
