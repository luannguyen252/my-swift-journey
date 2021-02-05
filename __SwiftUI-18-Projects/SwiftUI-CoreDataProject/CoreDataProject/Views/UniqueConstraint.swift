 //
//  UniqueConstraint.swift
//  CoreDataProject
//
//  Created by Sandesh on 14/10/20.
//  Copyright © 2020 devsandesh. All rights reserved.
//

import SwiftUI

struct UniqueConstraint: View {
    /*
     When there are constrainsts applied on any entity we can define merging policies to
     determine how the merge the conflicting entries
     Check scene delegate to find mergign policy
     */
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        List(wizards, id: \.self) { wiz in
            Text(wiz.name ?? "Unknown")
        }
        
        HStack {
            Button("Add") {
                let wizard = Wizard(context: moc)
                wizard.name = "Jack Denial"
            }
            
            Button("Save") {
                guard moc.hasChanges else { return }
                do {
                    try moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct UniqueConstraint_Previews: PreviewProvider {
    static var previews: some View {
        UniqueConstraint()
    }
}
