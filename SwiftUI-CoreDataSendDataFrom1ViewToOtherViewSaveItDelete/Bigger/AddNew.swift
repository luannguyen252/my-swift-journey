//
//  AddNew.swift
//  Bigger
//
//  Created by App-Designer2 . on 21.11.19.
//  Copyright © 2019 App-Designer2 . All rights reserved.
//

import SwiftUI

struct AddNew: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var name : String = ""
    @State private var carier : String = ""
    
    @State private var saved : Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                VStack {
                    TextField("name...",text: self.$name).padding()
                        .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0))
                    
                    TextField("carier...",text: self.$carier).padding()
                    .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0))
                    
                    Button(action: {
                        let add = Big(context: self.moc)
                        add.name = self.name
                        add.carier = self.carier
                        add.saved = self.saved
                        
                        try? self.moc.save()
                        
                        self.name = ""
                        self.carier = ""
                    }) {
                        Text("Add new").padding()
                            .font(.system(size: 23))
                            .foregroundColor((self.name.count > 0 && self.carier.count > 0) ?
                                Color.white :
                                Color.gray)
                    }.background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }
}

struct AddNew_Previews: PreviewProvider {
    static var previews: some View {
        AddNew()
    }
}
