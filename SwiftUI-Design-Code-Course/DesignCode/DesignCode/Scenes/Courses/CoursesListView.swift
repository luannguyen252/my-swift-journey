//
//  CoursesListView.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/23/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct CoursesListView: View {
    @EnvironmentObject var coursesStore: CoursesStore
    
    @State private var isShowingCourseSheet = false
    
    private var cardWidth: CGFloat = 246
    private var cardHeight: CGFloat = 360
    private var cardInnerSpacing: CGFloat = 26
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: cardInnerSpacing) {
                ForEach(coursesStore.courses.indexed(), id: \.1.id) { index, course in
                    GeometryReader { geometry in
                        Button(action: {
                            self.isShowingCourseSheet.toggle()
                        }) {
                            CourseListCard(
                                course: self.$coursesStore.courses[index],
                                cardWidth: self.cardWidth,
                                cardHeight: self.cardHeight
                            )
                        }
                        .rotation3DEffect(
                            .radians(
                                Double(geometry.frame(in: .global).minX - self.cardInnerSpacing) / (.pi * 200)
                            ),
                            axis: (x: 1.0, y: 1.0, z: 0.5)
                        )
                        .accessibility(label: Text("Open details for the course \"\(course.title)\""))
                    }
                    .frame(width: self.cardWidth, height: self.cardHeight)
                }
            }
            .padding(.vertical, cardInnerSpacing * 2)
            .padding(.leading, cardInnerSpacing)
        }
        .sheet(isPresented: self.$isShowingCourseSheet) {
            CertificateDetailView(certificate: .constant(CertificatesStore.defaultCertificates[0]))
        }
    }
}

struct CoursesListView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesListView()
            .environmentObject(CoursesStore())
    }
}
