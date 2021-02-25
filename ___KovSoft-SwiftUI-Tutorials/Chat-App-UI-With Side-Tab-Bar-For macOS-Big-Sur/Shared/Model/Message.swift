//
//  Message.swift
//  Telegram_MacApp
//
//  Created by Balaji on 06/01/21.
//

import SwiftUI

// message Model....

struct Message : Identifiable,Equatable {
    
    var id  = UUID().uuidString
    var message : String
    var myMessage : Bool
}

var Eachmsg = [
    
    Message(message: "New Album Is Going To Be Released!!!!", myMessage: false),
    
    Message(message: "Discover the innovative world of Apple and shop everything iPhone, iPad, Apple Watch, Mac, and Apple TV, plus explore accessories, entertainment!!!", myMessage: false),
    
    Message(message: "Amazon.in: Online Shopping India - Buy mobiles, laptops, cameras, books, watches, apparel, shoes and e-Gift Cards.", myMessage: false),
    
    Message(message: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs.", myMessage: true),
    
    Message(message: "At Microsoft our mission and values are to help people and businesses throughout the world realize their full potential.!!!!", myMessage: false),
    
    Message(message: "Firebase is Google's mobile platform that helps you quickly develop high-quality apps and grow your business.", myMessage: true),
    
    Message(message: "Kavsoft - SwiftUI Tutorials - Easier Way To Learn SwiftUI With Downloadble Source Code.!!!!", myMessage: true)


]
