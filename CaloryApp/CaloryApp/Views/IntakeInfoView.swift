//
//  IntakeInfoView.swift
//  CaloryApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct IntakeInfoView: View {
    // MARK: - PROPERTIES
    let meal: IntakeItem
    
    // MARK: - BODY
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
        } //: VSTACK
    }
}
