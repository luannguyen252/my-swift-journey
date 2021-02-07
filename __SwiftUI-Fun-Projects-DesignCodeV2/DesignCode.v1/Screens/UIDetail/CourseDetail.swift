//
//  CourseDetail.swift
//  DesignCode.v2
//
//  Created by Tee Becker on 11/2/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct CourseDetail: View {
    
    @Binding var show: Bool
    var course : Course
    @Binding var active: Bool
    @Binding var activeIndex: Int
    
    var body: some View {
        ScrollView {
            
            VStack {
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 8.0) {
                            
                            Text(course.title)
                                .font(.system(size: 25, weight: .bold))
                                .lineLimit(1)
                                .foregroundColor(.white)
                            
                            Text("\(course.subtitle) Sections")
                                .font(.system(size: 19))
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        ZStack {
//                            course.logo
//                                .frame(width: 44, height: 44, alignment: .top)
//                                .opacity(show ? 0 : 1)
                            
                            VStack {
                                Image(systemName: "xmark")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                            }
                            .frame(width: 36, height:36)
                            .background(Color.black.clipShape(Circle()))
//                            .opacity(show ? 1 : 0)
                            .onTapGesture(count: 1, perform: {
                                show = false
                                active = false
                                activeIndex = -1
                            })
                            
                        }
                    } // end H
                    
                    Spacer()
                    
                    WebImage(url: course.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                    
                } //end V
                .padding( show ? 30 : 20)
                .padding(.top, show ? 30 : 0)
                .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)
                //        .frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 290)
                .background(course.backgroundColor)
                .cornerRadius(30)
                //        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: course.backgroundColor.opacity(0.4), radius: 20, x: 0, y: 20)
                
                
                VStack(alignment: .leading, spacing: 30) {
                    
                    Text("Take your SwiftUI app to the App store with advanced techniques like API data, packages and CMS.")
                    
                    Text("About this course")
                        .font(.title)
                        .bold()
                    
                    Text("Doggo ipsum floofs big ol pupper noodle horse doing me a frighten adorable doggo, wow such tempt yapper blop. boofers heckin good boys and girls. Tungg you are doin me a concern wow such tempt doing me a frighten, extremely cuuuuuute much ruin diet. Heck borkf puggorino much ruin diet, tungg such treat. stop it fren. Boof smol borking doggo with a long snoot for pats super chub fat boi noodle horse stop it fren shibe, noodle horse shoober floofs lotsa pats. Heck heckin good boys the neighborhood pupper lotsa pats shibe heckin angery woofer adorable doggo, blop heck corgo lotsa pats.")
                    
                    Text("Heck long doggo shoober he made many woofs smol borkf, h*ck shibe puggo. Maximum borkdrive such treat smol smol borking doggo with a long snoot for pats very hand that feed shibe, much ruin diet the neighborhood pupper mlem.")
                } // end of second VStack
                .padding(30)
            }
        } // scrollview
        .edgesIgnoringSafeArea(.all)
    }
}

struct CourseDetail_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetail(
            show: .constant(true),
            course: courseData[0],
            active: .constant(true),
            activeIndex: .constant(-1))
    }
}
