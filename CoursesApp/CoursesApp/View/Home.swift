//
//  Home.swift
//  CoursesApp
//
//  Created by Luan Nguyen on 13/12/2020.
//

import SwiftUI

struct Home: View {
    // MARK: - PROPERTIES
    @State var txt = ""
    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Unicorn Courses")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("text"))

                    Text("Let's upgrade your skill!")
                        .font(.title3)
                        .foregroundColor(Color("text")).opacity(0.4)
                } //: VSTACK
                .foregroundColor(.black)
                
                Spacer(minLength: 0)
                
                Button(action: {
                    print("Go to Profile")
                }) {
                    Image("profile")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 40, height: 40)
                        .cornerRadius(40)
                }
            } //: HSTACK
            .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack(spacing: 16) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("text")).opacity(0.4)
                        
                        TextField("Search Courses", text: $txt)
                    } //: HSTACK
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .background(Color("textField"))
                    .clipShape(Capsule())
                    
                    HStack {
                        Text("Categories")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color("text"))
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            print("View all Category")
                        }) {
                            Text("View all")
                                .fontWeight(.semibold)
                                .foregroundColor(Color("link"))
                        }
                    } //: HSTACK
                    .foregroundColor(.black)
                    .padding(.top, 25)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2),spacing: 20) {
                        ForEach(courses) { course in
                            NavigationLink(destination: DetailView(course: course)) {
                                CourseCardView(course: course)
                            }
                        }
                    } //: LAZYVGRID
                    .padding(.top)
                } //: VSTACK
                .padding()
                .padding(.bottom, edge!.bottom + 70)
            } //: SCROLLVIEW
        } //: VSTACK
    }
}
