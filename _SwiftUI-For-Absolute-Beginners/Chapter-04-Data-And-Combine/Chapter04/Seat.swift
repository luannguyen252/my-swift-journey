//
//  Seat.swift
//  Chapter04
//
//  Created by Jayant Varma on 17/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

// Comment out all except for the version that you want to run

/*
// MARK: - Version 01
struct Seat01 {
    var seatNumber: Int
    
    func bookSeat(seatNumber: Int) {
        self.seatNumber = seatNumber
    }
}

//MARK: - Version 2
struct Seat02 {
    private var booking = false
    
    var toggleBooking: Bool {
        self.booking.toggle()
    }
}

// MARK: - Version 03

//import SwiftUI

struct Seat03 {
    @State private var booked = false
    
    var body: some View {
        Text("Seat is \(booked ? "Booked" : "Available")")
    }
    
    var toggleBooking: Bool {
        return self.booked.toggle()
    }
}


// MARK: - Version 04

struct Seat04 {
    @State private var booked = false
    
    var body: some View {
        VStack {
            Text("Seat is \(booked ? "Booked" : "Available")")
            Button(booked ? "Release" : "Book") {
                self.booked.toggle()
            }
        }
    }
}

// MARK: - Version 05

struct Seat05 {
    @State private var booked = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Seat Status")
                Image(systemName: booked ? "xmark" : "checkmark")
                    .foregroundColor(booked ? .red : .green)
            } .font(.largeTitle)
            Button(booked ? "Release" : "Book") {
                self.booked.toggle()
            }
        }
    }
}

// MARK: - Version 06

struct Seat06 {
    @State private var booked = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Seat Status")
                Image(systemName: booked ? "xmark" : "checkmark")
                    .foregroundColor(booked ? .red : .green)
            } .font(.largeTitle)
            ExtractedView01()
        }
    }
}


struct ExtractedView01: View {
    var body: some View {
        Button(booked ? "Release" : "Book") {
            self.booked.toggle()
        }
    }
}


//MARK: - Version 07
struct BookingButton01: View {
    @Binding var booked: Bool
    
    var body: some View {
        Button(booked ? "Release" : "Book") {
            self.booked.toggle()
        }
    }
}

struct Seat07: View {
    @State private var booked = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Seat Status")
                Image(systemName: booked ? "xmark" : "checkmark")
                    .foregroundColor(booked ? .red : .green)
            } .font(.largeTitle)
            BookingButton01(booked: $booked)
        }
    }
}

// MARK: - Version 08
struct BookingButton: View {
    @Binding var booked: Bool
    
    var body: some View {
        Button(booked ? "Release" : "Book") {
            self.booked.toggle()
        }
    }
}

struct Seat08: View {
    @State private var booked = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Seat Status")
                Image(systemName: booked ? "xmark" : "checkmark")
                    .foregroundColor(booked ? .red : .green)
            } .font(.largeTitle)
            BookingButton(booked: $booked)
            BookingButton(booked: $booked)
            BookingButton(booked: $booked)
        }
    }
}

 */
// MARK: - Version 09

import Combine

class BookingStore01: ObservableObject {
    var objectWillChange = PassthroughSubject<Void, Never>()
    
    var bookingName: String = "" {
        didSet { UpdateUI() }
    }
    
    var seats: Int = 1 {
        didSet { UpdateUI() }
    }
    
    func UpdateUI() {
        objectWillChange.send()
    }
}

// Mark: - Version 10

struct AnotherView: View {
    @ObservedObject var model = BookingStore01()
    
    var body: some View {
        VStack {
            TextField("Your Name", text: $model.bookingName)
            Stepper("Seats: \(model.seats)",
                value: $model.seats,
                in: 1...5)
        }
    }
}


struct AnotherView_Previews: PreviewProvider {
    static var previews: some View {
        let store = BookingStore01()
        return AnotherView().environmentObject(store)
    }
}
