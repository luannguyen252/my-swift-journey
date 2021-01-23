//
//  Calendar+SwiftUI.swift
//  Agenda
//
//  Created by Miotto Andrea on 21/10/2019.
//  Copyright © 2019 Miotto Andrea. All rights reserved.
//
import SwiftUI

struct CalendarViewControllerRepresentation: UIViewControllerRepresentable {

	let minimumDate: Date
	let maximumDate: Date

	func makeUIViewController(
		context: UIViewControllerRepresentableContext<CalendarViewControllerRepresentation>) -> CalendarViewController {

		let controller = UIStoryboard(name: "CalendarView", bundle: nil)
			.instantiateViewController(withIdentifier: "CalendarViewController")
			as? CalendarViewController ?? CalendarViewController()

		controller.setCalendar(minimumDate: minimumDate, maximumDate: maximumDate)
		return controller
	}

	func updateUIViewController(
		_ uiViewController: CalendarViewController,
		context: UIViewControllerRepresentableContext<CalendarViewControllerRepresentation>) {

	}
}
#if DEBUG
class CalPrev {
	static var formatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
		return formatter
	}()

	static var startDate: Date {
        return formatter.date(from: "2017 01 01")!
	}

	static var endDate:  Date {
        return formatter.date(from: "2030 02 01")!
	}

}


struct CalendarViewControllerPreviews: PreviewProvider {

	static var previews: some View {
		Group {
			CalendarViewControllerRepresentation(minimumDate: CalPrev.startDate, maximumDate: CalPrev.endDate)
			CalendarViewControllerRepresentation(minimumDate: CalPrev.startDate, maximumDate: CalPrev.endDate)
				.environment(\.colorScheme, .dark)
		}

	}
}
#endif
