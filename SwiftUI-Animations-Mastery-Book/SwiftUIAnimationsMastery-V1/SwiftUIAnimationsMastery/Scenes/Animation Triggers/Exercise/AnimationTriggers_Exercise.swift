//
//  AnimationTriggers_Exercise.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/27/20.
// ✌️
//

import SwiftUI

struct AnimationTriggers_Exercise {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private let titleText = "Animation Triggers"
    private let subtitleText = "Popup Exercise"
    private let descriptionText = "Popups can animate when appearing and disappearing."
    
    @State private var isShowingPopupModal = false
    
    /// This will allow us to fade out the modal before completely removing it
    @State private var popupModalOpacity = 1.0
    @State private var popupModalDragOffset: CGSize = .zero
    
    @GestureState private var popupModalDragState: ModalDragState = .inactive
}

// MARK: - View
extension AnimationTriggers_Exercise: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 12) {
                    self.descriptionSection
                        .layoutPriority(2)
                    
                    Spacer()
                    
                    self.popupModalShowButton
                }
                
                ZStack {
                    self.popupModalBackground
                        
                    if self.isShowingPopupModal {
                        PopupModalView(
                            onClose: { self.togglePopupModal(isShowing: false) }
                        )
                        .frame(width: geometry.size.width * 0.8, height: geometry.size.width * 0.8 * 0.8)
                        .offset(
                            x: self.popupModalDragState.dragOffset.width + self.popupModalDragOffset.width,
                            y: self.popupModalDragState.dragOffset.height + self.popupModalDragOffset.height
                        )
                        .animation(.easeOut)
                        .transition(self.popupEntranceTransition)
                        .gesture(self.popupModalDragGesture)
                        .opacity(self.popupModalOpacity)
                        .onDisappear(perform: self.resetPopupModalState)
                    }
                }
            }
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

// MARK: - Computeds
extension AnimationTriggers_Exercise {
    var popupEntranceTransition: AnyTransition {
        AnyTransition
            .move(edge: .top)
            .combined(with: .opacity)
    }
    
    var popupEntranceAnimation: Animation {
        Animation
            .spring(response: 0.35, dampingFraction: 0.6, blendDuration: 0)
    }
    
    var popupModalDragGesture: some Gesture {
        DragGesture()
            .updating($popupModalDragState) { (dragValue, popupModalDragState, _) in
                popupModalDragState = .dragging(translation: dragValue.translation)
            }
            .onEnded { dragValue in
                self.handleModalDragEnd(predictedEndTranslation: dragValue.predictedEndTranslation)
            }
    }
}

// MARK: - View Variables
extension AnimationTriggers_Exercise {
    private var descriptionSection: some View {
        VStack(spacing: 12) {
            Text(titleText)
                .textStyle(TitleTextStyle())
            
            Text(subtitleText)
                .textStyle(SubtitleTextStyle())
            
            BannerTextView(
                text: descriptionText,
                textColor: .black,
                backgroundColor: .accentColor,
                font: horizontalSizeClass == .regular ? .largeTitle : .title
            )
        }
    }

    private var popupModalShowButton: some View {
        Button(action: {
            self.togglePopupModal(isShowing: true)
        }) {
            Text("Show Popup Modal")
                .fontWeight(.medium)
                .padding()
                .foregroundColor(.black)
                .background(Color.accentColor)
                .cornerRadius(12)
                .shadow(color: Color.accentColor, radius: 6, x: 0, y: 2)
                .shadow(color: .white, radius: 4, x: 0, y: -2)
        }
    }

    private var popupModalBackground: some View {
        Color.gray
            .opacity(isShowingPopupModal ? 0.4 : 0.0)
            .edgesIgnoringSafeArea(.all)
            .onTapGesture(perform: { self.togglePopupModal(isShowing: false) })
    }
}

// MARK: - Private Helpers
private extension AnimationTriggers_Exercise {
    func togglePopupModal(isShowing: Bool, delay: Double = 0.0) {
        withAnimation(self.popupEntranceAnimation.delay(delay)) {
            self.isShowingPopupModal = isShowing
        }
    }
    
    func fadeOutModalBeforeRemoving() {
        withAnimation(Animation.easeIn(duration: 0.5)) {
            self.popupModalOpacity = 0.0
        }
        
        self.togglePopupModal(isShowing: false, delay: 0.5)
    }

    func resetPopupModalState() {
        self.popupModalDragOffset = .zero
        self.popupModalOpacity = 1.0
    }

    func handleModalDragEnd(predictedEndTranslation: CGSize) {
        let distance = sqrt(
            (predictedEndTranslation.width * predictedEndTranslation.width) +
            (predictedEndTranslation.height * predictedEndTranslation.height)
        )
        
        if distance > 150 {
            popupModalDragOffset = predictedEndTranslation
            fadeOutModalBeforeRemoving()
        } else {
            resetPopupModalState()
        }
    }
}

extension AnimationTriggers_Exercise {
    enum ModalDragState {
        case inactive
        case dragging(translation: CGSize)
        
        var dragOffset: CGSize {
            switch self {
            case .inactive:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
    }
}

// MARK: - Preview
struct AnimationTriggers_Exercise_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationTriggers_Exercise()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
        .accentColor(.yellow)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
