//
//  User.swift
//  FB Mac (iOS)
//
//  Created by Balaji on 14/12/20.
//

import SwiftUI

// Model And Sample Data....

struct User: Identifiable{
    var id = UUID().uuidString
    var name: String
    var url : String
}

let users = [

    User(
      name: "Jessie Samson",
      url:
        "https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"
    ),
    User(
      name: "David Brooks",
      url:
          "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"
    ),
    User(
      name: "Jane Doe",
      url:
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"
    ),
    User(
      name: "Matthew Hinkle",
      url:
          "https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80"
    ),
    User(
      name: "Amy Smith",
      url:
          "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80"
    ),
    User(
      name: "Ed Morris",
      url:
          "https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80"
    ),
    User(
      name: "Carolyn Duncan",
      url:
          "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"
    ),
    User(
      name: "Paul Pinnock",
      url:
          "https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"
    ),
    User(
        name: "Elizabeth Wong",
        url:
            "https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80"),
    User(
      name: "James Lathrop",
      url:
          "https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80"
    ),
    User(
      name: "Jessie Samson",
      url:
          "https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"
    ),
]


// Post Model and Data....

struct Post: Identifiable {
    
    var id = UUID().uuidString
    var user : User
    var imageUrl : String
    var title: String
    var likes: String
    var shares: String
    var comments: String
    var postTime: String
}

let posts = [

    Post(user: users[0], imageUrl: "https://images.unsplash.com/photo-1473496169904-658ba7c44d8a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80", title: "Summer Vacation :)))", likes: "89", shares: "22", comments: "17", postTime: "58"),
    Post(user: users[1], imageUrl: "https://images.unsplash.com/photo-1519150268069-c094cfc0b3c8?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1678&q=80", title: "Cutties 🥰", likes: "189", shares: "27", comments: "37", postTime: "23"),
    Post(user: users[2], imageUrl: "https://images.unsplash.com/photo-1509316785289-025f5b846b35?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1655&q=80", title: "Enjoying Corono Times😂 ", likes: "77", shares: "12", comments: "45", postTime: "15"),
    Post(user: users[3], imageUrl: "https://images.unsplash.com/photo-1519335337423-a3357c2cd12e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1568&q=80", title: "Big Surrrrrrrrrrrr", likes: "209", shares: "33", comments: "24", postTime: "2"),
    Post(user: users[4], imageUrl: "https://images.unsplash.com/photo-1502945015378-0e284ca1a5be?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80", title: "My New ArtWork !!!", likes: "314", shares: "88", comments: "55", postTime: "46"),
]
