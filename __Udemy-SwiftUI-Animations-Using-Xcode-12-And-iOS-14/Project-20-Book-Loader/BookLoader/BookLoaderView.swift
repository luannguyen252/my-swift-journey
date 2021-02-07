//
//  ContentView.swift
//  BookLoader
//
//  Created by Stephen DeStefano on 1/20/21.
//

import SwiftUI

struct BookLoaderView: View {
    //MARK:- PROPERTIES
    @State var bookState: BookLoaderState = BookLoaderState.closeRight
    
    @State var leftCoverOffset: CGSize = CGSize(width: -84, height: 0)
    @State var leftRotationDegrees: Angle = .zero
    
    @State var middleBookOffset: CGSize = CGSize(width: -28, height: -28)
    @State var middleRotationDegrees: Angle = .degrees(-90)
    
    @State var rightCoverOffset: CGSize = CGSize(width: 84, height: 55.75)
    @State var rightRotationDegrees: Angle = .degrees(-180)
    
    @State var currentIndex = 0
    @State var animationStarted: Bool = false
    
    let bookCoverWidth: CGFloat = 120
    let animationDuration: TimeInterval = 0.4
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            //left book cover
            Capsule().foregroundColor(.white).frame(width: bookCoverWidth, height: 8).offset(leftCoverOffset)
                .rotationEffect(leftRotationDegrees)
            
            //spine
            BookHoldView().stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .miter))
                .foregroundColor(.white).rotationEffect(middleRotationDegrees).offset(middleBookOffset)
            
            //right book cover
            Capsule().foregroundColor(.white).frame(width: bookCoverWidth, height: 8).offset(rightCoverOffset)
                .rotationEffect(rightRotationDegrees)
            
            //pages in the middle
            BookPagesView(animationStarted: $animationStarted, animationDuration: animationDuration)
                .offset(y: -20)
        }.onTapGesture {
            animationStarted.toggle()
            animateBookCovers()
            
            Timer.scheduledTimer(withTimeInterval: animationDuration * 3.4, repeats: false) { _ in
                animateBookClosed()
                
                Timer.scheduledTimer(withTimeInterval: animationDuration * 5, repeats:  true) { _ in
                    animateBookClosed()
                }
            }
        }
    }
    
    //MARK:- FUNCTIONS
    func animateBookCovers() {
        //spine
        withAnimation(Animation.easeOut(duration: animationDuration)) {
            middleRotationDegrees = bookState.animationBegin.3
            middleBookOffset = bookState.animationBegin.2
        }
        
        //left and right book cover offsets
        withAnimation(Animation.easeOut(duration: animationDuration)) {
            leftCoverOffset = bookState.animationBegin.0
            rightCoverOffset = bookState.animationBegin.4
        }
        
        //rotation degrees for the left and right book covers
        withAnimation(Animation.easeOut(duration: animationDuration * 0.9).delay(animationDuration * 0.05)) {
            leftRotationDegrees = bookState.animationBegin.1
            rightRotationDegrees = bookState.animationBegin.5
        }
    }
    
    func animateBookClosed() {
        withAnimation(Animation.linear(duration: animationDuration)) {
            middleRotationDegrees = bookState.animationEnd.3
            leftCoverOffset = bookState.animationEnd.0
            rightCoverOffset = bookState.animationEnd.4
        }
        
        withAnimation(Animation.easeOut(duration: animationDuration)) {
            leftRotationDegrees = bookState.animationEnd.1
            rightRotationDegrees = bookState.animationEnd.5
            middleBookOffset = bookState.animationEnd.2
        }
        
        Timer.scheduledTimer(withTimeInterval: animationDuration * 1.6, repeats: false) { _ in
            bookState = getNextCase()
            animateBookCovers()
        }
    }
    
    func getNextCase()-> BookLoaderState {
        let allCases = BookLoaderState.allCases
        
        if currentIndex == allCases.count - 1 {
            currentIndex = -1
        }
        currentIndex += 1
        let index = currentIndex
        return allCases[index]
    }
}

enum BookLoaderState: CaseIterable {
    case closeRight
    case closeLeft
    
    var animationBegin: (CGSize, Angle, CGSize, Angle, CGSize, Angle) {
        switch self {
        case .closeRight:
            return (CGSize(width: -84, height: 0), Angle.degrees(0), CGSize(width: 0, height: 0), Angle.degrees(0), CGSize(width: 84, height: 0), Angle.degrees(0))
        case .closeLeft:
            return (CGSize(width: -84, height: 0), Angle.degrees(0), CGSize(width: 0, height: 0), Angle.degrees(0), CGSize(width: 84, height: 0), Angle.degrees(0))
        }
    }
    
    var animationEnd: (CGSize, Angle, CGSize, Angle, CGSize, Angle) {
        switch self {
        case .closeRight:
            return (CGSize(width: -84, height: 55.75), Angle.degrees(180), CGSize(width: 28, height: -28), Angle.degrees(90), CGSize(width: 84, height: 0), Angle.degrees(0))
        case .closeLeft:
            return (CGSize(width: -84, height: 0), Angle.degrees(0), CGSize(width: -28, height: -28), Angle.degrees(-90), CGSize(width: 84, height: 55.75), Angle.degrees(-180))
        }
    }
}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BookLoaderView()
    }
}
