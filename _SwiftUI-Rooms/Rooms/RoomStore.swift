//  RoomStore.swift

import SwiftUI
import Combine

//BindableObject is changed to ObservableObject
class RoomStore : ObservableObject {
    var rooms : [Room] {
        didSet { objectWillChange.send() }
    }
    
    init(rooms: [Room] = []) {
        self.rooms = rooms
    }
    
    //didChange is changed to objectWillChange
    var objectWillChange = PassthroughSubject<Void, Never>()
}

