//
//  CaloryIntakeView.swift
//  CaloryApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct CaloryIntakeView: View {
    // MARK: - PROPERTIEs
    let meals = [IntakeItem(name: "Breakfast", imageName: "breakfast", isAdded: true, recommandedLower: 799, recommandedHigher: 1000, caloryIntake: 156),
                 IntakeItem(name: "Lunch", imageName: "lunch", isAdded: false, recommandedLower: 799, recommandedHigher: 1000, caloryIntake: 0),
                 IntakeItem(name: "Dinner", imageName: "dinner", isAdded: false, recommandedLower: 799, recommandedHigher: 1000, caloryIntake: 0)]
    
    // MARK: - BODY
    var body: some View {
        VStack {
            ForEach(self.meals, id:  \.self) { meal in
                HStack(alignment: .top) {
                    Spacer(minLength: 21)
                    Image(meal.imageName)
                    Spacer(minLength: 30)
                    IntakeInfoView(meal: meal)
                    Spacer(minLength: 21)
                } //: HSTACK
            }
            
            Spacer()
        } //: VSTACK
    }
}
