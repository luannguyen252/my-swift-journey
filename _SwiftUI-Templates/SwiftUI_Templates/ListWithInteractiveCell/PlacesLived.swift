//
//  PlacesLived.swift
//  SwiftUI_Templates
//
//  Created by Hui, Malachi | DCMS on 2020/05/06.
//  Copyright © 2020 Hui, Malachi | DCMS. All rights reserved.
//

import SwiftUI

let screen = UIScreen.main.bounds

struct PlaceList: View {
    @State var places = placeData
    @State var active = false
    @State var activeIndex = -1
    @State var activeView = CGSize.zero
    @State var location = ""
    
    enum location {
        case Boston
        case SanFrancisco
        case Tokyo
    }
    
    let cellTitle = "Places I've lived"
    
    var body: some View {
        ZStack {
            Color.black.opacity(Double(self.activeView.height / 500))
                .animation(.linear)
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 30.0) {
                    Text(cellTitle)
                        .font(.largeTitle).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                        .padding(.top, 30)
                        .blur(radius: active ? 20 : 0)
                    
                    ForEach(places.indices, id: \.self) { index in
                        GeometryReader { geometry in
                            PlaceView(show: self.$places[index].show,
                                       course: self.places[index],
                                       active: self.$active,
                                       index: index,
                                       activeIndex: self.$activeIndex,
                                       activeView: self.$activeView
                            )
                                .offset(y: self.places[index].show ? -geometry.frame(in: .global).minY : 0)
                                .opacity(self.activeIndex != index && self.active ? 0 : 1)
                                .scaleEffect(self.activeIndex != index && self.active ? 0.5 : 1)
                                .offset(x: self.activeIndex != index && self.active ? screen.width : 0)
                        }
                        .frame(height: 280)
                        .frame(maxWidth: self.places[index].show ? .infinity : screen.width - 60)
                        .zIndex(self.places[index].show ? 1: 0)
                    }
                }
                .frame(width: screen.width)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            }
            .statusBar(hidden: active ? true : false)
        }
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        PlaceList()
    }
}

struct PlaceView: View {
    @Binding var show:Bool
    var course: Course
    @Binding var active: Bool
    var index: Int
    @Binding var activeIndex: Int
    @Binding var activeView: CGSize
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text(course.title)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        Text(course.subtitle)
                            .foregroundColor(Color.white.opacity(0.7))
                    }
                    Spacer()
                    ZStack {
                        Image(uiImage: course.logo)
                            .opacity(show ? 0 : 1)
                        
                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .frame(width: 36, height: 36)
                        .background(Color.black)
                        .clipShape(Circle())
                        .opacity(show ? 1 : 0)
                    }
                }
                Spacer()
                Image(uiImage: course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140, alignment: .top)
            }
            .padding(show ? 30 : 20)
            .padding(.top, show ? 30 : 0)
                //        .frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 280)
                .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)
                .background(Color(course.color))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color(course.color).opacity(0.3), radius: 20, x: 0, y: 20)
            .gesture(
                show ?
                    DragGesture().onChanged { value in
                        guard value.translation.height < 300  else { return }
                        guard value.translation.height > 0 else { return }
                        
                        self.activeView = value.translation
                    }
                    .onEnded { value in
                        if self.activeView.height > 50 {
                            self.resetClose()
                        }
                        self.activeView = .zero
                    }
                    : nil
            )
            .onTapGesture {
                self.show.toggle()
                self.active.toggle()
                if self.show {
                    self.activeIndex = self.index
                } else {
                    self.activeIndex = -1
                }
            }
            
            if show {
                PlaceDetail(course: course, show: $show, active: $active, activeIndex: $activeIndex)
                    .background(Color.white)
                    .animation(nil)
            }
        }
        .frame(height: show ? screen.height : 280)
        .scaleEffect(1 - self.activeView.height / 1000)
        .rotation3DEffect(Angle(degrees: Double(self.activeView.height) / 10), axis: (x: 0.0, y: 10.0, z: 0.0))
        .hueRotation(Angle(degrees: Double(self.activeView.height)))
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .gesture(
            show ?
                DragGesture().onChanged { value in
                    guard value.translation.height < 300  else { return }
                    guard value.translation.height > 0 else { return }
                }
                .onEnded { value in
                    if self.activeView.height > 50 {
                        self.resetClose()
                    }
                    self.activeView = .zero
                }
                : nil
        )
            .edgesIgnoringSafeArea(.all)
    }
    
    func resetClose() {
        self.show = false
        self.active = false
        self.activeIndex = -1
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var image: UIImage
    var logo: UIImage
    var color: UIColor
    var show: Bool
}

let unicodeHaert = "\u{2661}"

var placeData = [
    Course(title: "Boston", subtitle: "It's Bean Town", image: #imageLiteral(resourceName: "Background1"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), show: false),
    Course(title: "San Francisco", subtitle: "Left my \(unicodeHaert) in San Francisco", image: #imageLiteral(resourceName: "Card3"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), show: false),
    Course(title: "Tokyo", subtitle: "Konnichiwa bitches!", image: #imageLiteral(resourceName: "Card4"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), show: false)
]
