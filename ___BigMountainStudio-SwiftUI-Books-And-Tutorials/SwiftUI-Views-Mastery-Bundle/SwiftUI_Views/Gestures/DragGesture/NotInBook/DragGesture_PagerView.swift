//
//  DragGesture_PagerView.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 12/26/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//


import SwiftUI

struct Park: View {
    var name = ""
    var picture: Image
    
    var body: some View {
        VStack(spacing: 40) {
            picture
                .cornerRadius(10)
                .shadow(color: .gray, radius: 18, x: 0, y: 15)
                .padding(.bottom)
            
            Text(name)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
                .font(.system(size: 42, weight: .bold, design: .default))
        }
    }
}

//  This is created by Majid Jabrayilov on 12/5/19.
//  Copyright © 2019 Majid Jabrayilov. All rights reserved.
//  From Majid's post: https://swiftwithmajid.com/2019/12/25/building-pager-view-in-swiftui/

struct PagerView<Content: View>: View {
    let pageCount: Int
    @Binding var currentIndex: Int
    let content: Content

    @GestureState private var translation: CGFloat = 0

    init(pageCount: Int, currentIndex: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self.content = content()
    }

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                self.content.frame(width: geometry.size.width)
            }
            .frame(width: geometry.size.width, alignment: .leading)
            .offset(x: -CGFloat(self.currentIndex) * geometry.size.width)
            .offset(x: self.translation)
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.width
                }.onEnded { value in
                    let offset = value.translation.width / geometry.size.width
                    let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                    self.currentIndex = min(max(Int(newIndex), 0), self.pageCount - 1)
                }
            )
            .animation(Animation.easeInOut)
        }
    }
}

struct DragGesture_PagerView: View {
    @State private var currentPage = 0
    
    private var parks = [Park(name: "Arches National Park", picture: Image("arches")),
    Park(name: "Canyonlands National Park", picture: Image("canyonlands")),
    Park(name: "Bryce Canyon National Park", picture: Image("bryce"))]
    
    
    var body: some View {
        VStack {
            Text("U T A H")
                .font(.system(size: 50, weight: .black, design: .default))
            
            PagerView(pageCount: 3, currentIndex: $currentPage) {
                Park(name: "Arches National Park", picture: Image("arches"))
                Park(name: "Canyonlands National Park", picture: Image("canyonlands"))
                Park(name: "Bryce Canyon National Park", picture: Image("bryce"))
            }
        }
    }
}


struct DragGesture_PagerView_Previews: PreviewProvider {
    static var previews: some View {
        DragGesture_PagerView()
    }
}
