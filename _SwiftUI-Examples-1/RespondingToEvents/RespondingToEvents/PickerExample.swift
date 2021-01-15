//
//  PickerExample.swift
//  RespondingToEvents
//
//  Created by kim sunchul on 2020/05/04.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct PickerExample: View {
    var colors = ["Red", "Green", "Blue", "Tartan"]
    
    @State private var selectedColor = 0
    
    var dateFormatter:DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    @State private var birthDate = Date()
    
    @State private var favoriteColor = 0
    
    @State private var selectedNumber = 0
    
    var body: some View {
        VStack {
            Picker(selection:$selectedColor, label:Text("Please choose a color")) {
                ForEach(0 ..< colors.count) {
                    Text(self.colors[$0])
                }
            }
            Text("You selected: \(colors[selectedColor])")
            DatePicker(selection:$birthDate, in: ...Date(), displayedComponents: .date) {
                Text("Select a date")
            }
            Text("Date is \(birthDate, formatter:dateFormatter)")
            Picker(selection:$favoriteColor, label:Text("What is your favorite color?")) {
                ForEach(0..<colors.count) { index in
                    Text(self.colors[index]).tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            Text("Value : \(favoriteColor)")
            
//            피커 내부 라벨을 지우는 역할은 labelsHidden() modifier로 하는게 옳습니다.
//            나쁜 방법으로는 EmptyView()를 파라매터에 대신 넣는 방법이 있는데, 해당 방법은 옳지 않습니다.
//            그것은 라벨을 hidden 시키는것이 아니라 그저 비어있는 공간을 할당하는것 뿐이기 때문이다.
            Picker("Select a number", selection: $selectedNumber) {
                ForEach(0..<10) {
                    Text("\($0)")
                }
            }.labelsHidden()

        }
    }
}

struct PickerExample_Previews: PreviewProvider {
    static var previews: some View {
        PickerExample()
    }
}
