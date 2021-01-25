//
//  BuyTickersView.swift
//  CartListViewWithSwiftUI
//
//  Created by park kyung suk on 2020/06/18.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import SwiftUI

struct BuyTickersView: View {
    
    let movie = Movie(name: "The Shape of Water", imageName: "movie2")
    
    let topDays: [Day] = [
    .init(month: "MAR", day: "09", dayOfWeek: "FRIDAY"),
    .init(month: "MAR", day: "10", dayOfWeek: "SATURDAY"),
    .init(month: "MAR", day: "11", dayOfWeek: "SUNDAY"),
    .init(month: "MAR", day: "12", dayOfWeek: "MONDAY"),
    .init(month: "MAR", day: "13", dayOfWeek: "TUESDAY")
    ]
    
    let middleDays: [Day] = [
       .init(month: "MAR", day: "14", dayOfWeek: "WEDNDAY"),
       .init(month: "MAR", day: "15", dayOfWeek: "THURSDAY"),
       .init(month: "MAR", day: "16", dayOfWeek: "FRIDAY"),
       .init(month: "MAR", day: "17", dayOfWeek: "SATURDAY"),
       .init(month: "MAR", day: "18", dayOfWeek: "SUNDAY")
    ]
    
    @State var selectedDay: Day?

    var body: some View {
        
        GeometryReader { geo in
            VStack (spacing: 14) {
                HStack {
                    Text("BUY TICKETS")
                        .font(.system(size: 20))
                }
                HStack (alignment: .top, spacing: 16){
                    Image("movie2")
                        .resizable()
                        .cornerRadius(12)
                        .scaledToFill()
                        .frame(width: 100, height: 150)
                        .shadow(radius: 10)
                    VStack (alignment: .leading, spacing: 8) {
                        Text("The Shape of Water")
                            .font(.system(size: 18, weight: .bold))
                        Text("Drema | Fantasy")
                        
                        HStack {
                            Button(action: {
                                
                            }, label: {
                                Text("MAR 10 FRIDAY")
                                    .font(.system(size: 12, weight: .bold))
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                                    .foregroundColor(.black)
                                
                            })
                                .overlay(RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.gray, lineWidth: 1))
                            
                            Button(action: {
                                
                            }, label: {
                                Text("7:00 PM")
                                    .font(.system(size: 12, weight: .bold))
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                                    .foregroundColor(.black)
                                
                            })
                                .overlay(RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.gray, lineWidth: 1))
                        }
                    }.padding(.top, 10)
                }
                
                VStack (alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Select Date")
                        Spacer()
                    }.padding(.leading, 16)
                    
                    HStack (spacing: 16) {
                        ForEach(self.topDays) { day in
                            
                            DayButton(day: day, size: geo.size, selectedDay: self.selectedDay ) { day in
                                self.selectedDay = day
                            }
                            
                            
                        }
                    }.padding(.horizontal, 16)
                    
                    HStack (spacing: 16) {
                        ForEach(self.middleDays) { day in
                            
                            DayButton(day: day, size: geo.size, selectedDay: self.selectedDay) { day in
                                self.selectedDay = day
                            }
                            
                            
                        }
                    }.padding(.horizontal, 16)
                    
                }
                Spacer()
            }
        }
    }
}

struct DayButton: View {
    
    let day: Day
    let size: CGSize
    
    var selectedDay: Day?
    var tapHandler: ((Day) -> ())?
    
    var body: some View {
        // Buttons
        Button(action: {
            guard let handler = self.tapHandler else { return }
            handler(self.day)
        }, label: {
            VStack (spacing: 8) {
                Text(day.month)
                    .font(.system(size: 14))
                    .foregroundColor((self.selectedDay?.day == self.day.day) ? Color.white : Color.gray)
                Text(day.day)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor((self.selectedDay?.day == self.day.day) ? Color.white : Color.black)
                Text(day.dayOfWeek)
                    .font(.system(size: 10))
                    .foregroundColor((self.selectedDay?.day == self.day.day) ? Color.white : Color.gray)
            }.padding(.vertical, 8)
            
            
        })
            .frame(width: (size.width - 6 * 16) / 5)
            .overlay(RoundedRectangle(cornerRadius: 12)
            .stroke(Color.gray, lineWidth: 1))
            .background((self.selectedDay?.day == self.day.day) ? Color.red : Color.white)
        .cornerRadius(12)
        
    }
}

struct Day: Identifiable {
    let id = UUID()
    let month, day, dayOfWeek: String
}

struct BuyTickersView_Previews: PreviewProvider {
    static var previews: some View {
        BuyTickersView()
    }
}
