//
//  DateCellView.swift
//  Agenda
//
//  Created by Miotto Andrea on 21/10/2019.
//  Copyright © 2019 Miotto Andrea. All rights reserved.
//

import JTAppleCalendar
import UIKit

class DateCellView: JTACDayCell {
    @IBOutlet var selectedView: UIView!
    @IBOutlet var dayLabel: UILabel!


	override func prepareForReuse() {
		super.prepareForReuse()
		self.isHidden = false
		self.dayLabel.text = ""
	}

}
