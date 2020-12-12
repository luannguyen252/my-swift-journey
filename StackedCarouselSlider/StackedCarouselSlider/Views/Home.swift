//
//  Home.swift
//  StackedCarouselSlider
//
//  Created by Luan Nguyen on 12/12/2020.
//

import SwiftUI

struct Home: View {
    // MARK: - PROPERTIES
    // 40 = Padding Horizontal
    // 60 = 2 Cards To Right Side
    var width = UIScreen.main.bounds.width - (40 + 60)
    var height = UIScreen.main.bounds.height / 2

    // MARK: - BOOK DATA
    @State var books = [
        // Make sure id is in ascending order
        Book(id: 0, image: "p0", title: "The SwiftUI Book 1", author: "Luan Nguyen 1", rating: 3, offset: 0),
        Book(id: 1, image: "p1", title: "The SwiftUI Book 2", author: "Luan Nguyen 2", rating: 4, offset: 0),
        Book(id: 2, image: "p2", title: "The SwiftUI Book 3", author: "Luan Nguyen 3", rating: 4, offset: 0),
        Book(id: 3, image: "p3", title: "The SwiftUI Book 4", author: "Luan Nguyen 4", rating: 5, offset: 0),
        Book(id: 4, image: "p4", title: "The SwiftUI Book 5", author: "Luan Nguyen 5", rating: 4, offset: 0),
        Book(id: 5, image: "p5", title: "The SwiftUI Book 6", author: "Luan Nguyen 6", rating: 4, offset: 0),
    ]
    
    @State var swiped = 0

    // MARK: - BODY
    var body: some View {
        VStack {
            //: HEADER
            HStack {
                Text("Stacked Carousel Slider")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("lightDark"))
                    

                Spacer(minLength: 0)

                Button(action: {}) {
                    Image(systemName: "circle.grid.2x2.fill")
                        .font(.system(size: 22))
                        .foregroundColor(Color("lightDark"))
                }
            } //: HSTACK
            .foregroundColor(.white)
            .padding()
            
            Spacer(minLength: 0)
            
            //: BOOK CARDS
            ZStack {
                // Since its ZStack it overlay one on another so reversed
                ForEach(books.reversed()) { book in
                    HStack {
                        ZStack {
                            Image(book.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: width, height: getHeight(index: book.id))
                                .cornerRadius(25)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5)

                            CardView(card: book)
                                .frame(width: width, height: getHeight(index: book.id))
                        } //: ZSTACK
                        .offset(x: book.id - swiped < 3 ? CGFloat(book.id - swiped) * 30 : 60)
                        
                        Spacer(minLength: 0)
                    } //: HSTACK
                    // Content shape for drag gesture
                    .contentShape(Rectangle())
                    .padding(.horizontal, 20)
                    // Gesture
                    .offset(x: book.offset)
                    .gesture(DragGesture().onChanged({ (value) in
                        withAnimation { onScroll(value: value.translation.width, index: book.id) }
                    }).onEnded({ (value) in
                        withAnimation { onEnd(value: value.translation.width, index: book.id) }
                    }))
                }
            } //: ZSTACK
            // Max height
            .frame(height: height)
            
            PageViewController(total: books.count, current: $swiped)
                .padding(.top, 25)
            
            Spacer(minLength: 0)
        } //: VSTACK
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        .navigationBarHidden(true)
        .statusBar(hidden: true)
    }
    
    // MARK: - DYNAMIC HEIGHT CHANGE
    func getHeight(index: Int) -> CGFloat {
        // Two card = 80
        // All other are 80 at background
        // Automatic height and offset adjusting
        return height - (index - swiped < 3 ? CGFloat(index - swiped) * 40 : 80)
    }
    
    // MARK:- SCROLL
    func onScroll(value: CGFloat, index: Int) {
        if value < 0 {
            // Left swipe
            if index != books.last!.id {
                books[index].offset = value
            }
        }
        else {
            // Right swipe
            // Safe check
            if index > 0 {
                if books[index - 1].offset <= 20 {
                    books[index - 1].offset = -(width + 40) + value
                }
            }
        }
    }

    // MARK: - END
    func onEnd(value: CGFloat, index: Int) {
        if value < 0 {
            if -value > width / 2 && index != books.last!.id {
                books[index].offset = -(width + 100)
                swiped += 1
            }
            else {
                books[index].offset = 0
            }
        }
        else {
            if index > 0 {
                if value > width / 2 {
                    books[index - 1].offset = 0
                    swiped -= 1
                }
                else {
                    books[index - 1].offset = -(width + 100)
                }
            }
        }
    }
}

