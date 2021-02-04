//
//  ContentView.swift
//  TinderSwipeTest
//
//  Created by Timothy Waters on 7/7/19.
//  Copyright © 2019 Timothy Waters. All rights reserved.
//

import SwiftUI

var commentText = ""

struct ContentView : View {
    var body: some View {
        ZStack {
            Image("plant")
                .resizable()
                ZStack {
                    NewCard()
                        .offset(x: -10, y: -20)
                    NewCard()
                        .offset(x: -5, y: -10)
                    NewCard()
                }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

struct NewCard : View {
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isActive: Bool {
            switch self {
            case .inactive:
                return false
            case .pressing, .dragging:
                return true
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .inactive, .pressing:
                return false
            case .dragging:
                return true
            }
        }
    }
    
    @GestureState var dragState = DragState.inactive
    @State var viewState = CGSize.zero
    @State var showAlert = false
    @State var comment: String = ""
    @ObservedObject private var kGuardian = KeyboardGuardian(textFieldCount: 1)
    var body: some View {
        var divisor: CGFloat
        let minimumLongPressDuration = 0.0
        let longPressDrag = LongPressGesture(minimumDuration: minimumLongPressDuration)
            .sequenced(before: DragGesture())
            .updating($dragState) { value, state, transaction in
                switch value {
                // Long press begins.
                case .first(true):
                    state = .pressing
                // Long press confirmed, dragging may begin.
                case .second(true, let drag):
                    state = .dragging(translation: drag?.translation ?? .zero)
                // Dragging ended or the long press cancelled.
                default:
                    state = .inactive
                }
        }
        .onEnded { value in
            guard case .second(true, let drag?) = value else { return }
            self.viewState.width += drag.translation.width
            self.viewState.height += drag.translation.height
            
            if(self.viewState.width < -150) {
                self.viewState = CGSize(width: -800, height: -20)
                self.showAlert = true
            } else if(self.viewState.width > 150) {
                self.viewState = CGSize(width: UIScreen.main.bounds.width + 800, height: -20)
                self.showAlert = true
            } else {
                self.viewState = CGSize.zero
            }
        }
        
        divisor = (UIScreen.main.bounds.width / 2) / 60
        let xFromCenter = viewState.width + dragState.translation.width
        let scale = min(50/abs(xFromCenter), 1)
 return VStack {
            Image("food")
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .gesture(longPressDrag)
            TextField("Leave a comment", text: $comment, onEditingChanged: { if $0 { self.kGuardian.showField = 0 } }) {
                commentText = self.comment
            }
                
                .padding()
                .background(GeometryGetter(rect: $kGuardian.rects[0]))
                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                .cornerRadius(10.0)
        }
            .rotation3DEffect(Angle(degrees: dragState.isActive ? (Double(xFromCenter / divisor)) : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
            .scaleEffect(x: scale, y: scale, anchor: .center)
            .offset(y: kGuardian.slide).animation(.easeInOut(duration: 1.5))
            .padding()
            .shadow(color: Color.black, radius: 15, x: 2, y: 2)
            .offset(
                    x: xFromCenter
            )
            .alert(isPresented: $showAlert) {
                Alert(title: Text("User commented on this photo!"), message: Text(commentText), primaryButton: .default(Text("OK")) {
                    commentText = ""
                    self.comment = ""
                    }, secondaryButton: .cancel()
                )
            }
    }
}

struct GeometryGetter: View {
    @Binding var rect: CGRect
    
    var body: some View {
        GeometryReader { geometry in
            Group { () -> AnyView in
                DispatchQueue.main.async {
                    self.rect = geometry.frame(in: .global)
                }
                
                return AnyView(Color.clear)
            }
        }
    }
}
