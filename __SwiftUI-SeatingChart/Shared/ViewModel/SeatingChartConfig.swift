//
//  SeatingConfiguration.swift
//  SeatingSwfitUI
//
//  Created by Simon Bachmann on 12.12.20.
//

import Foundation
import SwiftUI

class SeatingChartConfig: ObservableObject, Equatable {
    var id = UUID()
    var map: [String]
    var seatDetails: [Character: SeatDetailModel]
    var columns: [String]
    var rows: [String]
    var currency: String
    var currencyDecimal: Int


    @Published var cells = [Cell]()
    @Published var seats = [Coordinate: SeatModel]()

    var layoutColumns: [GridItem]
    var layoutRows: [GridItem]

    var columLabelCells = [Cell]()

    init(map: [String], seatDetails: [Character: SeatDetailModel], columns: [String] = [], rows: [String] = [], currency: String = "$", currencyDecimal: Int = 2) {
        self.map = map
        self.seatDetails = seatDetails
        self.currency = currency
        self.currencyDecimal = currencyDecimal
        self.layoutColumns = [GridItem](repeating: GridItem(.flexible()), count: map[0].count + 1)
        self.layoutRows = [GridItem](repeating: GridItem(.flexible()), count: map.count + 1)

        // adding a placeholder for the invisible first column
        self.columns = ["_"]
        if columns.count == 0 {
            self.columns += (0..<map[0].count).map({ "\($0)" }) // 1, 2, 3, ...
        } else {
            self.columns += columns
        }

        if rows.count == 0 {
            self.rows = (65...(65 + map.count)).map({ "\(String(UnicodeScalar($0)!))" }) // A, B, C, ...
        } else {
            self.rows = rows
        }

        self.columLabelCells = self.columns.map({ Cell(coordinate: Coordinate(col: $0, row: self.rows[0]), label: $0, cellType: .label) })

        for r in 0..<map.count {
            self.cells.append(Cell(coordinate: Coordinate(col: self.columns[0], row: self.rows[r]), label: self.rows[r], cellType: .label))

            for c in 0..<map[r].count {
                let coordinate = Coordinate(col: self.columns[c + 1], row: self.rows[r])
                let char = map[r][c]
                if let seatDetail = seatDetails[char] {
                    self.seats[coordinate] = SeatModel(price: seatDetail.price, color: seatDetail.color, char: char)
                    self.cells.append(Cell(coordinate: coordinate, label: String(map[r][c]), cellType: seatDetail.available ? .available : .unavailable))
                } else {
                    self.cells.append(Cell(coordinate: coordinate, label: String(map[r][c]), cellType: .empty))
                }
            }
        }
    }


    var selectedSeats: [SeatModel] {
        get {
            Array(seats.values.map {
                $0
            }).filter {
                $0.selected
            }
        }
    }

    var totalPrice: Double {
        get {
            selectedSeats
                    .map({ $0.price })
                    .reduce(0, +)
        }
    }

    var seatDetailsList: [SeatDetailModel] {
        get {
            Array(seatDetails.values.map {
                $0
            }).sorted(by: >)
        }
    }

    func toggle(coordinate: Coordinate) {
        print(coordinate)
        seats[coordinate]!.selected.toggle()
    }

    func toggle(id: UUID) {
        for (key, value) in seats {
            if value.id == id {
                toggle(coordinate: key)
            }
        }
    }

    func unselect(id: UUID) {
        for (key, value) in seats {
            if value.id == id {
                seats[key]!.selected = false
            }
        }
    }

    func coordinate(id: UUID) -> Coordinate {
        for (key, value) in seats {
            if value.id == id {
                return key
            }
        }
        return Coordinate(col: "0", row: "0")
    }

    func price(amount: Double) -> String {

        let format = "%.\(currencyDecimal)f"
        let price = String(format: format, amount)

        return "\(price) \(currency)"
    }

    static func ==(lhs: SeatingChartConfig, rhs: SeatingChartConfig) -> Bool {
        lhs.id == rhs.id
    }
}

struct Coordinate: Identifiable, Hashable {
    var id = UUID()
    var col: String
    var row: String
}

struct Cell: Identifiable {
    var id = UUID()
    var coordinate: Coordinate
    var label: String
    var cellType: CellType
    var referenceId: Int?
}

enum CellType {
    case label
    case empty
    case available
    case unavailable
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

