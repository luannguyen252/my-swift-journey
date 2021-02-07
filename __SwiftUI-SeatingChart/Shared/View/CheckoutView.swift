//
//  PartialSheetWrapper.swift
//  SeatingSwfitUI
//
//  Created by Simon Bachmann on 13.12.20.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var config: SeatingChartConfig
    @State var txt = ""

    var body: some View {

        VStack {
            Capsule()
                    .frame(width: 50, height: 5)
                    .padding(.top)

            HStack {
                Text("Selected: \(config.selectedSeats.count)")
                        .font(.headline)
                        .foregroundColor(Color("systemBlack"))

                Spacer()
                Text("Total: \(config.price(amount: config.totalPrice))")
                        .font(.headline)
                        .foregroundColor(Color(UIColor.systemGray6))
                        .padding()
                        .background(Color("systemBlack"))
                        .cornerRadius(15)
            }
                    .padding(.vertical, 10)
                    .cornerRadius(15)
                    .padding(.horizontal)

            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(alignment: .leading, spacing: 15) {
                    ForEach(config.selectedSeats, id: \.id) { seat in
                        VStack {
                            HStack {
                                SeatView(selected: false, color: seat.color, fill: true)
                                        .frame(width: 20, height: 20)
                                Text("\(config.coordinate(id: seat.id).col)\(config.coordinate(id: seat.id).row) \(config.seatDetails[seat.char]?.category ?? "")")
                                Spacer()
                                if seat.price != 0 {
                                    Text("\(String(format: "%.2f", seat.price)) $")
                                }
                                Button(action: {
                                    withAnimation {
                                        config.toggle(id: seat.id)
                                    }
                                }, label: {
                                    Image(systemName: "xmark.circle")
                                })
                            }
                            Divider()
                                    .padding(.top, 10)
                        }
                    }

                }
            }
                    .padding()
                    .padding(.top)

            HStack {
                Spacer()
                Button("Checkout") {
                    print("User wants to checkout following tickets (\(config.price(amount: config.totalPrice))): ")
                    for ticket in config.selectedSeats {
                        let coordinates = config.coordinate(id: ticket.id)
                        print("\(coordinates.col)\(coordinates.row)")
                    }
                }
                        .font(.headline)
                        .foregroundColor(Color(UIColor.systemGray6))
                Spacer()
            }
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(15)
                    .padding()
                    .padding(.bottom, 30)


        }
                .background(Color("systemWhite"))
                .cornerRadius(15)
                .shadow(color: Color(.black).opacity(0.3), radius: 10.0)
    }
}
