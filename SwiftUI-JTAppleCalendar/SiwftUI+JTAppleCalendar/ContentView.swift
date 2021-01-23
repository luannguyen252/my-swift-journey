//
//  ContentView.swift
//  SiwftUI+JTAppleCalendar
//
//  Created by Miotto Andrea on 22/10/2019.
//  Copyright © 2019 Miotto Andrea. All rights reserved.
//

import SwiftUI

struct ContentView: View {

	var formatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
		return formatter
	}()

	var startDate: Date {
        return formatter.date(from: "2017 01 01")!
	}

	var endDate:  Date {
        return formatter.date(from: "2030 02 01")!
	}


    var body: some View {
        CalendarViewControllerRepresentation(minimumDate: startDate, maximumDate: endDate)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
