//
//  HabbitRow.swift
//  Habits
//
//  Created by Sandesh on 05/07/20.
//  Copyright © 2020 devsandesh. All rights reserved.
//

import SwiftUI

struct HabbitRow: View {
    
    var habit: Habit
    
    var body: some View {
        ZStack {
            HStack {
                Text(habit.name)
                    .padding()
                
                Spacer()
                
                Text("23/28")
                    .padding()
            }
        }
        .frame(width: .infinity, height: .infinity, alignment: .center)
        .background(Color.red)
        .cornerRadius(10)
    }
}

struct HabbitRow_Previews: PreviewProvider {
    static var previews: some View {
        HabbitRow(habit: Habit.testHabit)
            .previewLayout(.sizeThatFits)
    }
}
