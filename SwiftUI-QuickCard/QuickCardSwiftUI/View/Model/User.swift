//
//  User.swift
//  QuickCardSwiftUI
//
//  Created by Umer Khan on 24/10/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import Foundation

struct User: Identifiable {
  let id = UUID()
  var firstName: String
  var lastName: String
  var title: String
  var email: String
  var companyUrl: String
  var address: String
  
  var visit: Visit
}

extension User {
  
  static let users = [
    User(firstName: "Jonathan",
         lastName: "Wong",
         title: "Senior Software Engineer",
         email: "mobileunder10@gmail.com",
         companyUrl: "mobileunder10.com",
         address: "12345 Highland Road",
         visit: Visit(views: 50, events: 60, badges: 7, actions: 80, duration: 90)),
    User(firstName: "Nermal",
         lastName: "Vero",
         title: "Software Engineer",
         email: "nvero@yahoo.com",
         companyUrl: "vero123.com",
         address: "8822 Royal Road",
         visit: Visit(views: 10, events: 20, badges: 3, actions: 40, duration: 50)),
    User(firstName: "Evelyn",
         lastName: "Smith",
         title: "Business Analyst",
         email: "esmith@outlook.com",
         companyUrl: "esmithvet.com",
         address: "5544 Camino Del Sur",
         visit: Visit(views: 20, events: 40, badges: 6, actions: 80, duration: 100)),
    User(firstName: "Phoebe",
         lastName: "Lee",
         title: "Senior Business Analyst",
         email: "plee@gmail.com",
         companyUrl: "pleeproducts.com",
         address: "12345 Phaser Court",
         visit: Visit(views: 30, events: 60, badges: 3, actions: 65, duration: 35)),
    User(firstName: "Aaron",
         lastName: "Huang",
         title: "Mechanical Engineer",
         email: "ahuang@gmail.com",
         companyUrl: "ahrobots.com",
         address: "789 Robot Road",
         visit: Visit(views: 50, events: 80, badges: 9, actions: 10, duration: 10)),
    User(firstName: "Nathan",
         lastName: "Chan",
         title: "Product Engineer",
         email: "mobileunder10@gmail.com",
         companyUrl: "mobileunder10.com",
         address: "12345 Highland Road",
         visit: Visit(views: 10, events: 20, badges: 3, actions: 40, duration: 50)),
    User(firstName: "Avery",
         lastName: "Johnson",
         title: "Senior Software Engineer",
         email: "averyjohnson@outlook.com",
         companyUrl: "avpharm.com",
         address: "12121 Pathos Lane",
         visit: Visit(views: 30, events: 60, badges: 9, actions: 30, duration: 60)),
    User(firstName: "Harriet",
         lastName: "Brown",
         title: "Staff Software Engineer",
         email: "hbrown@yahoo.com",
         companyUrl: "catfurrr.com",
         address: "999 Cat Fur Lane",
         visit: Visit(views: 20, events: 40, badges: 6, actions: 80, duration: 90)),
    User(firstName: "Lillian",
         lastName: "Martin",
         title: "Software Engineer",
         email: "lmartinez@gmail.com",
         companyUrl: "sharksneversleep.com",
         address: "123 Under the Sea Lane",
         visit: Visit(views: 55, events: 65, badges: 7, actions: 85, duration: 95)),
    User(firstName: "Natalie",
         lastName: "Kim",
         title: "Software Manager",
         email: "nataliekim@yahoo.com",
         companyUrl: "natalite.com",
         address: "8888 Hidden Marker Road",
         visit: Visit(views: 15, events: 25, badges: 3, actions: 45, duration: 55)),
  ]
}
