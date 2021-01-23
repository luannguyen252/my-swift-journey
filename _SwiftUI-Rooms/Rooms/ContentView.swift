//
//  ContentView.swift
//  Rooms
//
//  Created by Akhilesh Mishra on 23/12/19.
//  Copyright © 2019 Akhilesh Mishra. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //ObjectBinding is now ObservedObject
    @ObservedObject var store = RoomStore()
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: addRoom) {
                        Text("Add Room")
                            .font(.headline)
                    }
                }
                
                Section {
                    ForEach(store.rooms) { room in
                        RoomCell(room: room)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
            }
            .navigationBarTitle(Text("Rooms"))
        .navigationBarItems(trailing: EditButton())
            .listStyle(GroupedListStyle())
        }
    }
    
    func addRoom() {
        store.rooms.append(Room(name: "Hall 2", capacity: 2000))
    }
    
    func delete(at offsets: IndexSet) {
        store.rooms.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        store.rooms.move(fromOffsets: source, toOffset: destination)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(store: RoomStore(rooms: testData))
            
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.colorScheme, .dark)
        }
    }
}
#endif

struct RoomCell: View {
    let room: Room
    
    var body: some View {
        NavigationLink(destination: RoomDetail(room: room)) {
            Image(room.thumbnailName)
                .cornerRadius(8.0)
            
            VStack(alignment: .leading) {
                Text(room.name)
                Text("\(room.capacity) people")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
