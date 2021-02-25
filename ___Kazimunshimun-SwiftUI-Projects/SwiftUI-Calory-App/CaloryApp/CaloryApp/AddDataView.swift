//
//  AddDataView.swift
//  CaloryApp
//
//  Created by Anik on 29/6/20.
//  Copyright © 2020 a7studio. All rights reserved.
//

import SwiftUI

struct AddDataView: View {
    
    let width: CGFloat
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(ColorConstants.todayViewGradientColor)
                .frame(height: 140)
            
            DateDropDownView(width: width)
            
            CaloryIntakeView()
        }
    }
}

struct IntakeItem: Hashable {
    let name: String
    let imageName: String
    let isAdded: Bool
    let recommandedLower: Int
    let recommandedHigher: Int
    let caloryIntake: Int
}

struct CaloryIntakeView: View {
    let meals = [IntakeItem(name: "Breakfast", imageName: "breakfast", isAdded: true, recommandedLower: 799, recommandedHigher: 1000, caloryIntake: 156),
                 IntakeItem(name: "Lunch", imageName: "lunch", isAdded: false, recommandedLower: 799, recommandedHigher: 1000, caloryIntake: 0),
                 IntakeItem(name: "Dinner", imageName: "dinner", isAdded: false, recommandedLower: 799, recommandedHigher: 1000, caloryIntake: 0)]
    var body: some View {
        VStack {

            ForEach(self.meals, id:  \.self) { meal in
                HStack(alignment: .top) {
                    Spacer(minLength: 21)
                    Image(meal.imageName)
                    Spacer(minLength: 30)
                    IntakeInfoView(meal: meal)
                    Spacer(minLength: 21)
                }
                
            }
            Spacer()
        }
    }
}

struct IntakeInfoView: View {
    let meal: IntakeItem
    var body: some View {
        VStack(alignment: .leading) {
            Text(meal.isAdded ? meal.name : "Add \(meal.name)")
                .foregroundColor(.black)
                .font(.system(size: 20, weight: .bold))
            
            Text(meal.isAdded ? "Completed" : "Recommend \(meal.recommandedLower) to \(meal.recommandedHigher)kcal")
                .foregroundColor(meal.isAdded ? ColorConstants.greenTextColor : Color.init(white: 0.7))
                .font(.system(size: 12))
            
            Divider()
            
            Text(meal.isAdded ? String("\(meal.caloryIntake) kcal").uppercased() : "+ ADD")
                .foregroundColor(.black)
                .font(.system(size: 30))
            
            if meal.isAdded {
                Text(String("543 kcal under").uppercased())
                .foregroundColor(.black)
                .font(.system(size: 10))
            }
            
            
            Spacer()
            
        }
    }
}

struct DateDropDownView: View {
    let width: CGFloat
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
            .frame(width: width - 42, height: 60)
            .foregroundColor(.white)
            .shadow(color: Color(white: 0.92), radius: 6, x: 0, y: 3)
            
            HStack {
                Text(String("today, 03 feb").uppercased())
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .bold))
                Image("drop_down")
            }
            
        }.offset(x: 0, y: -30)
    }
}

struct AddDataView_Previews: PreviewProvider {
    static var previews: some View {
        AddDataView(width: 375)
    }
}
