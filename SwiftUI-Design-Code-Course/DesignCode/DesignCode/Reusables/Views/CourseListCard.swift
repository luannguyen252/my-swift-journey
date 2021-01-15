//
//  CourseListCard.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/24/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct CourseListCard: View {
    @Binding var course: Course
    
    var cardWidth: CGFloat = 246
    var cardHeight: CGFloat = 360
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(course.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .lineLimit(4)
            
            Spacer()
        }
        .padding()
        .frame(width: cardWidth, height: cardHeight)
        .background(
            VStack {
                Spacer()
                
                Image(course.imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .padding(.vertical)
                    .frame(width: cardWidth * 0.9, height: cardHeight * 0.6, alignment: .bottom)
            }
        )
        .background(course.backgroundColor)
        .cornerRadius(30)
        .shadow(color: course.shadowColor, radius: 16, x: 0, y: 10)
    }
}


struct CourseListCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CourseListCard(course: .constant(CoursesStore.defaultCourses[0]))
            
            CourseListCard(course: .constant(CoursesStore.defaultCourses[1]))
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        }
        
    }
}
