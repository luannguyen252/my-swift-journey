//
//  CalendarViewController.swift
//  Agenda
//
//  Created by Miotto Andrea on 21/10/2019.
//  Copyright © 2019 Miotto Andrea. All rights reserved.
//

import UIKit
import SwiftUI
import JTAppleCalendar

class CalendarViewController: UIViewController {

	// MARK: - Outlutlets

	@IBOutlet weak var calendarView: JTACMonthView!
	@IBOutlet weak var monthLabel: UILabel!

	// MARK: - Public Properties

	// MARK: - Private Properties

	private let formatter = DateFormatter()

	private var minimumDate: Date?
	private var maximumDate: Date?
	private var selectedDate: Date?

	// MARK: - UIKIt Controller Funcs

	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = UIColor.white
	}

	// MARK: - Public Funcs

	func setCalendar(minimumDate: Date, maximumDate: Date) {
		self.minimumDate = minimumDate
		self.maximumDate = maximumDate
	}

	// MARK: - Private Funcs
}

// MARK: - Caalendar DataSource
extension CalendarViewController: JTACMonthViewDataSource {

	func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {

		let startDate = minimumDate ?? Date()
		let endDate = maximumDate ?? Date()

		let parameters = ConfigurationParameters(
			startDate: startDate,
			endDate: endDate,
			generateInDates: .forAllMonths,
			generateOutDates: .off)
		return parameters
	}
}

extension CalendarViewController: JTACMonthViewDelegate {
	func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
		configureCell(view: cell, cellState: cellState)
	}

	func calendar(_ calendar: JTACMonthView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
		setupViewsOfCalendar(from: visibleDates)
	}

	func calendar(_ calendar: JTACMonthView, shouldSelectDate date: Date, cell: JTACDayCell?, cellState: CellState) -> Bool {
		return true
	}

	func calendar(_ calendar: JTACMonthView, didSelectDate date: Date, cell: JTACDayCell?, cellState: CellState) {
		print("selected")
		configureCell(view: cell, cellState: cellState)
	}

	func calendar(_ calendar: JTACMonthView, didDeselectDate date: Date, cell: JTACDayCell?, cellState: CellState) {
		print("selected")
		configureCell(view: cell, cellState: cellState)
	}

	func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
		let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "DayCell", for: indexPath) as? DateCellView ?? DateCellView()
		configureCell(view: cell, cellState: cellState)
		if cellState.text == "1" {
			formatter.dateFormat = "MMM"
			let month = formatter.string(from: date)
			cell.dayLabel .text = "\(month) \(cellState.text)"
		} else {
			cell.dayLabel .text = cellState.text
		}
		return cell
	}
}

extension CalendarViewController {
	func setupViewsOfCalendar(from visibleDates: DateSegmentInfo) {
        guard let startDate = visibleDates.monthDates.first?.date else {
            return
        }
        let month = Calendar.current.dateComponents([.month], from: startDate).month!
        let monthName = DateFormatter().monthSymbols[(month-1) % 12]
        // 0 indexed array
        let year = Calendar.current.component(.year, from: startDate)
        monthLabel.text = monthName + " " + String(year)
    }

    func configureCell(view: JTACDayCell?, cellState: CellState) {
        guard let myCustomCell = view as? DateCellView  else { return }
        handleCellSelection(view: myCustomCell, cellState: cellState)
		handleCellState(view: myCustomCell, cellState: cellState)
    }

    func handleCellSelection(view: DateCellView, cellState: CellState) {
        if calendarView.allowsMultipleSelection {
        switch cellState.selectedPosition() {
        case .full: view.backgroundColor = .green
        case .left: view.backgroundColor = .yellow
        case .right: view.backgroundColor = .red
        case .middle: view.backgroundColor = .blue
        case .none: view.backgroundColor = nil
        }
        } else {
            if cellState.isSelected {
                view.backgroundColor = UIColor.red
            } else {
                view.backgroundColor = UIColor.white
            }
        }
    }

	func handleCellState(view: DateCellView, cellState: CellState) {
	   if cellState.dateBelongsTo != .thisMonth {
		view.isHidden = true
	   }
	}

}
