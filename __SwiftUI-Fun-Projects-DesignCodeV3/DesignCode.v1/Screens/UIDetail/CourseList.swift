//
//  CourseList.swift
//  DesignCode.v2
//
//  Created by Tee Becker on 10/31/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct CourseList: View {
    //    @State var show  = false
    //    @State var show2  = false
//    @State var courses = courseData
    @ObservedObject var store = CourseStore()
    @State var active = false // for status bar
    @State var activeIndex = -1
    @State var activeView = CGSize.zero
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    
    var body: some View {
        
        GeometryReader { bounds in
            ZStack { // to add background color
                Color.yellow.opacity( Double(activeView.height / 500))
                    
                
                ScrollView {
                    VStack(spacing: 30) {
                        Text("Courses")
                            .font(.largeTitle)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 30)
                            .padding(.top, 30)
                            .blur(radius: active ? 20 : 0)
                        
                        //                CourseView(show: $show)
                        //                    .frame(height: show ? screen.height : 280)
                        
                        
                        ForEach(store.courses.indices, id: \.self) { index in
                            
                            GeometryReader { geometry in
                                // needs $ because its binding to all items within courses array,  and will add / remove based on how many items inside array that the for loop should run.
                                CourseView(
                                    show: $store.courses[index].show,
                                    course: store.courses[index],
                                    active: $active,
                                    index: index,
                                    activeIndex: $activeIndex,
                                    activeView: $activeView
                                )
                                // if show2 is true, use the - minY position (all the way up top), otherwise do nothing.
                                .offset(y: store.courses[index].show ? -geometry.frame(in: .global).minY : 0)
                                .opacity(activeIndex != index && self.active ? 0 : 1 )
                                .scaleEffect(activeIndex != index && self.active ? 0.5 : 1)
                                .offset(x: activeIndex != index && self.active ? bounds.size.width : 0)
                                
                            } // end of geo reader
                            .frame(height: horizontalSizeClass == .regular ? 80 : 280)
                            .frame(maxWidth: store.courses[index].show ? .infinity : getCardWidth(bounds: bounds) - 60)
                            // to change the zIndex to be 1 if its being shown so its ON TOP of all other cards.
                            .zIndex(store.courses[index].show ? 1 : 0)
                        }//end of forloop
                    }
                    .frame(width: bounds.size.width)
                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                    
                }
            }
            .statusBar(hidden: active ? true : false)
        } // time , battery
    }
}


func getCardWidth(bounds: GeometryProxy) -> CGFloat{
    if bounds.size.width > 712{
        return 712
    }
    return bounds.size.width
}


struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    @Binding var show: Bool
    var course: Course
    @Binding var active: Bool
    var index: Int
    @Binding var activeIndex: Int
    @Binding var activeView: CGSize
    
    
    var body: some View {
        
        ZStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 30) {
                
                Text("Take your SwiftUI app to the App store with advanced techniques like API data, packages and CMS.")
                
                Text("About this course")
                    .font(.title)
                    .bold()
                
                Text("Doggo ipsum floofs big ol pupper noodle horse doing me a frighten adorable doggo, wow such tempt yapper blop. boofers heckin good boys and girls. Tungg you are doin me a concern wow such tempt doing me a frighten, extremely cuuuuuute much ruin diet. Heck borkf puggorino much ruin diet, tungg such treat. stop it fren. Boof smol borking doggo with a long snoot for pats super chub fat boi noodle horse stop it fren shibe, noodle horse shoober floofs lotsa pats. Heck heckin good boys the neighborhood pupper lotsa pats shibe heckin angery woofer adorable doggo, blop heck corgo lotsa pats.")
                
                Text("Heck long doggo shoober he made many woofs smol borkf, h*ck shibe puggo. Maximum borkdrive such treat smol smol borking doggo with a long snoot for pats very hand that feed shibe, much ruin diet the neighborhood pupper mlem.")
            }
            .padding(30)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity : 280, alignment: .top)
            .offset(y: show ? 460 : 0)
            .background(Color("background2"))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .opacity(show ? 1 : 0)
            
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
                        course.logo
                            .frame(width: 44, height: 44, alignment: .top)
                            .opacity(show ? 0 : 1)
                        
                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .frame(width: 36, height:36)
                        .background(Color.black.clipShape(Circle()))
                        .opacity(show ? 1 : 0)
                        
                    }
                } // end H
                
                Spacer()
                
                WebImage(url: course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                //                .frame(height: 140, alignment: .top)
                
            } //end V
            .padding( show ? 30 : 20)
            .padding(.top, show ? 30 : 0)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)
            //        .frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 290)
            .background(course.backgroundColor)
            .cornerRadius(30)
            //        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: course.backgroundColor.opacity(0.4), radius: 20, x: 0, y: 20)
            .onTapGesture(count: 1, perform: {
                show.toggle()
                active.toggle()
                if show {
                    activeIndex = index
                } else {
                    activeIndex = -1
                }
            })
            
            if show {
                //                CourseDetail(show: $show, course: course, active:$active, activeIndex: $activeIndex )
                //                    .background(Color.white)
                //                    .animation(nil)
            }
        } // end Z
        .frame(height: show ? screen.height : 280)
        .scaleEffect(
            1 - (activeView.height / 1000))
        .rotation3DEffect(Angle(degrees: Double(activeView.height/10)), axis: (x: 0.0, y: 10.0, z: 0.0))
        .hueRotation(Angle(degrees: Double(activeView.height)))
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .gesture(
            show ? // only if the card is shown can we use this drag gesture animation
                DragGesture()
                .onChanged({ (value) in
                    guard value.translation.height < 300 else {return} // can not drag lower than 300
                    guard value.translation.height > 0 else {return} // can not drag up
                    activeView = value.translation
                    
                })
                
                .onEnded({ (value) in
                    if activeView.height > 50 {
                        // reset state
                        show = false
                        active = false
                        activeIndex = -1
                    }
                    activeView = .zero
                })
                : nil
        )
        .edgesIgnoringSafeArea(.all)
    }
}


// Date Model:

struct Course: Identifiable{
    var id = UUID()
    var title: String
    var subtitle: String
    var logo: Image
    var image: URL
    var backgroundColor: Color
    var show: Bool
}

// Good for Prototyping: 
let courseData = [
    Course(title: "Prototype designs in SwiftUI", subtitle: "18", logo: Image("Logo1"), image: URL(string: "https://dl.dropbox.com/s/pmggyp7j64nvvg8/Certificate%402x.png?dl=0")!, backgroundColor: Color("card1"), show: false),
    
    Course(title: "Build an SwiftUI app", subtitle: "20", logo: Image("Logo1"), image: URL(string: "https://dl.dropbox.com/s/i08umta02pa09ns/Card3%402x.png?dl=0")!, backgroundColor: Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)), show: false),
    
    Course(title: "SwiftUI Advanced", subtitle: "25", logo: Image("Logo1"), image: URL(string: "https://dl.dropbox.com/s/etdzsafqqeq0jjg/Card6%402x.png?dl=0")!, backgroundColor: Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)), show: false)
]
