//: Playground - noun: a place where people can play

import UIKit

//declaring a tuple
var meeting = (meetingType: "Board meeting", presentation: true)
var currency = ("US Dollars", 350.00)

//accessing the tuples values
meeting.0
meeting.1
currency.0
currency.1

meeting.meetingType
meeting.presentation

meeting.0

//decomposing a tuple
let workItinerary = meeting.meetingType
let isPresenting = meeting.presentation

//var (currencyType, amount) = currency
//
//currencyType
//amount

//ignoring some tuple values
var (currencyType, _) = currency
currencyType

//using a tuple to iterate through a dictionary
let businessTrips = ["San Francisco" : 650.00, "Japan" : 1800.00, "London" : 1200.00, "Brazil" : 2200.00, "New York" : 450.00]

for (location, tripExpense) in businessTrips {
    
    print("The business trip to \(location) has a budgeted expense of $\(tripExpense)")
}

//using tuples in functions
func smallestAndLargest(arrayOfInts: [Int]) -> (small: Int, large: Int)? {
    
    if arrayOfInts.isEmpty { return nil }
    var smallest = arrayOfInts[0]
    var largest = arrayOfInts[0]
    
    for value in arrayOfInts[1..<arrayOfInts.count] {
        if value < smallest {
            smallest = value
            
        } else if value > largest {
            largest = value
        }
    }
    return (smallest, largest)
}

//var results = smallestAndLargest(arrayOfInts: [8, 45, 2, -7, 32, 71])
//
//print("The smallest number in the array is \(results.small) and the largest is \(results.1)")
//
//results.0
//
//let (smallest, biggest) = smallestAndLargest(arrayOfInts: [33, 55, 77, -8, 323, 329])
//
//smallest
//biggest

//optional tuple
let emptyArray = [Int]()

if let optionalResults = smallestAndLargest(arrayOfInts: emptyArray) {
    
    print("The smallest number in the array is \(optionalResults.small) and the largest is \(optionalResults.large)")
}























