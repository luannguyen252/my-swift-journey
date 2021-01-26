//
//  Messages.swift
//  AppleWatchApp WatchKit Extension
//
//  Created by Tony Hajdini on 03/10/2020.
//

import SwiftUI

struct Messages: Identifiable {
    let id = UUID()
    let name: String
    let photo: String
    let message: String
    let time: String
}

let messages = [
    Messages( name: "James" , photo: "user1" , message: "Hey there 🤚🏻", time: "12:30"),
    Messages( name: "Mark" , photo: "user2" , message: "Hello, do you mind to pick up a coffe for me?", time: "12:24"),
    Messages( name: "Jim" , photo: "user3" , message: "Hey ", time: "10:30"),
    Messages( name: "Joe" , photo: "user4" , message: "You alright? 🤚", time: "9:30"),
    Messages( name: "Tony" , photo: "user5" , message: "Are you there? 🤔", time: "5:30"),
    Messages( name: "Jasmin" , photo: "user6" , message: "hmmm ", time: "22:10"),
    Messages( name: "Elise" , photo: "user7" , message: "ok 👍🏻", time: "22:00"),
    Messages( name: "Angela" , photo: "user8" , message: "hahaha 🤭", time: "21:50"),
    Messages( name: "James" , photo: "user9" , message: "Goodnight 🥱", time: "21:20"),
    Messages( name: "James" , photo: "user10" , message: "I got my first donate 🤑", time: "20:40"),
]
