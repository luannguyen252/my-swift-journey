//
//  DatabaseConstants.swift
//  RealtimeChatMessengerFirebase
//
//  Created by Luan Nguyen on 03/01/2021.
//

import Firebase

let databaseRoot = Database.database().reference()
let databaseChats = databaseRoot.child("chats")
