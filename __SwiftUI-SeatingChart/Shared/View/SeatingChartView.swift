//
//  SeatingChartView.swift
//  SeatingSwfitUI
//
//  Created by Simon Bachmann on 12.12.20.
//

import SwiftUI
import PartialSheet

struct SeatingChartView: View {
    @EnvironmentObject var config: SeatingChartConfig

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {

            VStack() {
                LazyVGrid(columns: config.layoutColumns) {
                    ForEach(config.columLabelCells, id: \.id) { cell in
                        ChartLabelView(text: String(cell.label))
                    }
                }

                ScrollView() {
                    LazyVGrid(columns: config.layoutColumns) {
                        ForEach(config.cells, id: \.id) { cell in
                            switch cell.cellType {
                            case .available:
                                SeatView(selected: config.seats[cell.coordinate]!.selected, color: config.seats[cell.coordinate]!.color)
                                        .onTapGesture {
//                                        withAnimation{
                                            config.toggle(coordinate: cell.coordinate)
//                                        }
                                        }
                            case .label:
                                ChartLabelView(text: String(cell.label))
                            case .unavailable:
                                SeatView(selected: false, color: config.seats[cell.coordinate]!.color, available: false)
                            case .empty:
                                SeatView(selected: false, color: .clear, available: false)
                                        .opacity(0)
                            }
                        }
                    }
                }
            }
        }
    }
}
