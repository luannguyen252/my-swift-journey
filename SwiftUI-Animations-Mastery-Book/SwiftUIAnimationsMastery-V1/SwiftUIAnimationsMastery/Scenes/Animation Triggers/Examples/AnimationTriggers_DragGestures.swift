//
//  AnimationTriggers_DragGestures.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/16/20.
// ✌️
//

import SwiftUI

struct AnimationTriggers_DragGestures {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private var panelAnimationDuration: Double = 0.25

    private let titleText = "Animation Triggers"
    private let subtitleText = "Drag Gestures"
    private let descriptionText = "Dragging a view will move it but you can add animation to complete moving a view into its final location smoothly."

    /// The percentage of the menu panel's height that needs to be dragged in order
    /// to trigger an open/close toggling
    private let menuToggleDragPercentageThreshold: CGFloat = 0.43
    
    @GestureState private var menuPanelDragState: DragState = .inactive
    @State private var isMenuPanelOpen = false
}

// MARK: - View
extension AnimationTriggers_DragGestures: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 22) {
                self.descriptionSection
                    .layoutPriority(1)
            
            Spacer()
            
            self.menuPanel
                .frame(height: self.menuPanelHeight(in: geometry))
                .offset(x: 0, y: self.idealMenuYOffset(in: geometry))
                .animation(self.menuPanelDragAnimation)
                .gesture(self.menuPanelDragGesture(in: geometry))
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

// MARK: - Computeds
extension AnimationTriggers_DragGestures {
    var menuPanelDragAnimation: Animation {
        .easeOut(duration: panelAnimationDuration)
    }
    
    func idealMenuYOffset(in geometry: GeometryProxy) -> CGFloat {
        switch menuPanelDragState {
        case .inactive:
            return self.startingMenuPanelOffset(in: geometry)
        case .dragging(let height):
            return self.startingMenuPanelOffset(in: geometry) + height
        }
    }
    
    func menuPanelHeight(in geometry: GeometryProxy) -> CGFloat {
        min(600, max(300, geometry.size.height * 0.33))
    }
    
    func startingMenuPanelOffset(in geometry: GeometryProxy) -> CGFloat {
        isMenuPanelOpen ? 0.0 : self.menuPanelHeight(in: geometry) * 0.9
    }

    func menuPanelDragGesture(in geometry: GeometryProxy) -> some Gesture {
        let dragDistanceForToggle = menuPanelHeight(in: geometry) * menuToggleDragPercentageThreshold
        
        return DragGesture()
            .updating($menuPanelDragState) { (value, menuPanelDragState, _) in
                menuPanelDragState = .dragging(value.translation.height)
            }
            .onEnded { gestureValue in
                if gestureValue.translation.height >= dragDistanceForToggle {
                    self.isMenuPanelOpen = false
                } else if gestureValue.translation.height <= -dragDistanceForToggle {
                    self.isMenuPanelOpen = true
                }
            }
    }
}

// MARK: - View Variables
extension AnimationTriggers_DragGestures {
    private var descriptionSection: some View {
        VStack(spacing: 12) {
            Text(titleText)
                .textStyle(TitleTextStyle())
            
            Text(subtitleText)
                .textStyle(SubtitleTextStyle())
            
            BannerTextView(
                text: descriptionText,
                textColor: .white,
                backgroundColor: .purple,
                font: horizontalSizeClass == .regular ? .title : .headline
            )
        }
    }
    
    private var menuPanel: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: geometry.size.width / 50)
                    .fill(Color.pink)
                    .frame(
                        width: self.horizontalSizeClass == .regular ? 200 : 100,
                        height: self.horizontalSizeClass == .regular ? 100 : 60
                    )
                    .overlay(
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(.white)
                            .font(self.horizontalSizeClass == .regular ? .largeTitle : .title)
                            .offset(x: 0, y: self.horizontalSizeClass == .regular ? -20 : -15)
                    )
                    .offset(x: 0, y: self.horizontalSizeClass == .regular ? -60 : -30)
                
                HStack {
                    Spacer()
                    
                    VStack(spacing: 22) {
                        Spacer()
                        
                        Text("More Options")
                            .fontWeight(.bold)
                        
                        Text("🦊")
                        Text("🐺")
                        Text("🦄")
                        
                        Spacer()
                    }
                
                    Spacer()
                }
                .font(self.horizontalSizeClass == .regular ? .largeTitle : .title)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: geometry.size.width * 0.04)
                        .fill(Color.purple)
                )
            }
        }
    }
}

// MARK: - Private Helpers
private extension AnimationTriggers_DragGestures {
    enum DragState {
        case inactive
        case dragging(_ height: CGFloat)
    }
}

// MARK: - Preview
struct AnimationTriggers_DragGestures_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationTriggers_DragGestures()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
