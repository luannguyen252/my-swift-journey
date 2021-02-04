//
//  ContentView.swift
//  SwiftUI7
//
//  Created by Rohit Saini on 02/07/20.
//  Copyright © 2020 AccessDenied. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Item()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Item:View {
    @State var data = ["1","2","3","4","5","6","7","8","9","10"]
    var body: some View{
        NavigationView{
            List{
                ForEach(data,id:\.self){ i in
                    Text(i)
                }
                .onDelete(perform: {(index) in
                    self.data.remove(atOffsets:index)
                })
                    .onMove(perform: {(index,destination) in
                        self.data.move(fromOffsets: index,toOffset:destination)
                    })
            }
        .navigationBarTitle("ListView")
            .navigationBarItems(trailing:EditButton())
        }
    }
}
