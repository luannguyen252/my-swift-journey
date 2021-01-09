//
//  AnimationTriggers_Challenge.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 3/1/20.
// ✌️
//

import SwiftUI
import CypherPoetSwiftUIKit

struct AnimationTriggers_Challenge {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private var detailsAnimationDuration: TimeInterval = 0.28
    private var detailsToggleDragThreshold: CGFloat = 150.0
    private var toggleSectionButtonHeight: CGFloat = 80.0
    
    private var detailsTextLine1 = "The Louvre, or the Louvre Museum, is the world's largest art museum and a historic monument in Paris, France. A central landmark of the city, it is located on the Right Bank of the Seine in the city's 1st arrondissement (district or ward). Approximately 38,000 objects from prehistory to the 21st century are exhibited over an area of 72,735 square meters (782,910 square feet). In 2019, the Louvre received 9.6 million visitors."

    private var detailsTextLine2 = "The museum is housed in the Louvre Palace, originally built as the Louvre castle in the late 12th to 13th century under Philip II. Remnants of the fortress are visible in the basement of the museum. Due to urban expansion, the fortress eventually lost its defensive function, and in 1546 Francis I converted it into the primary residence of the French Kings. The building was extended many times to form the present Louvre Palace. In 1682, Louis XIV chose the Palace of Versailles for his household, leaving the Louvre primarily as a place to display the royal collection, including, from 1692, a collection of ancient Greek and Roman sculpture. In 1692, the building was occupied by the Académie des Inscriptions et Belles-Lettres and the Académie Royale de Peinture et de Sculpture, which in 1699 held the first of a series of salons. The Académie remained at the Louvre for 100 years. During the French Revolution, the National Assembly decreed that the Louvre should be used as a museum to display the nation's masterpieces."

    private var detailsTextLine3 = "The museum opened on 10 August 1793 with an exhibition of 537 paintings, the majority of the works being royal and confiscated church property. Because of structural problems with the building, the museum was closed in 1796 until 1801. The collection was increased under Napoleon and the museum was renamed Musée Napoléon, but after Napoleon's abdication, many works seized by his armies were returned to their original owners. The collection was further increased during the reigns of Louis XVIII and Charles X, and during the Second French Empire the museum gained 20,000 pieces. Holdings have grown steadily through donations and bequests since the Third Republic. The collection is divided among eight curatorial departments: Egyptian Antiquities; Near Eastern Antiquities; Greek, Etruscan and Roman Antiquities; Islamic Art; Sculpture; Decorative Arts; Paintings; Prints and Drawings."

    @State private var isShowingDetails = false
    @GestureState private var detailsToggleDragState: DragState = .inactive
}

// MARK: - View
extension AnimationTriggers_Challenge: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                VStack {
                    self.imageSection
                        .frame(
                            width: geometry.size.width,
                            height: geometry.size.width * self.imageFrameHeightRatio + 30
                        )
                        .animation(self.imageScaleAnimation)
                    
                    self.detailsSection
                    
                    Spacer()
                }
                .embedInScrollView(axes: [.vertical], showsIndicators: false)
                .disabled(self.isShowingDetails == false)
                
                self.detailsToggleSection
                    .offset(self.toggleSectionOffset(in: geometry))
                    .animation(self.imageScaleAnimation)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

// MARK: - Computeds
extension AnimationTriggers_Challenge {
    var imageScaleEffect: CGFloat {
        isShowingDetails ? 1.0 : 5.0
    }
    
    var imageFrameWidthFactor: CGFloat {
        isShowingDetails ? 1.0 : 1.0
    }
    
    var imageFrameHeightRatio: CGFloat {
        isShowingDetails ? 0.6 : 0.8
    }
    
    var imageScaleAnimation: Animation {
        .easeOut(duration: detailsAnimationDuration)
    }
    
    func toggleSectionOffset(in geometry: GeometryProxy) -> CGSize {
        let imageSectionHeight: CGFloat = geometry.size.width * self.imageFrameHeightRatio
        let toggleSectionBottomDistance = geometry.size.height - toggleSectionButtonHeight
        
        switch detailsToggleDragState {
        case .inactive:
            return CGSize(
                width: 0,
                height: isShowingDetails ? toggleSectionBottomDistance : imageSectionHeight
            )
        case .dragging(let translation):
            return CGSize(
                width: 0,
                height: isShowingDetails ? toggleSectionBottomDistance : max(imageSectionHeight, imageSectionHeight + translation.height)
            )
        }
    }

    var detailsToggleGesture: some Gesture {
        detailsToggleDragGesture.exclusively(before: detailsToggleTapGesture)
    }
    
    var detailsToggleTapGesture: some Gesture {
        TapGesture()
            .onEnded { _ in self.isShowingDetails.toggle() }
    }
    
    var detailsToggleDragGesture: some Gesture {
        DragGesture()
            .updating($detailsToggleDragState) { (gestureValue, detailsToggleDragState, _) in
                detailsToggleDragState = .dragging(translation: gestureValue.translation)
            }
            .onEnded { gestureValue in
                // print("onEnded::translation height: \(gestureValue.translation.height)")
                if gestureValue.translation.height > self.detailsToggleDragThreshold {
                    self.isShowingDetails = true
                }
            }
    }
}

// MARK: - View Variables
extension AnimationTriggers_Challenge {
    private var imageSection: some View {
        GeometryReader { geometry in
            Image("louvre")
                .resizable()
                .aspectRatio(contentMode: self.isShowingDetails ? .fill : .fit)
                .scaleEffect(self.imageScaleEffect, anchor: UnitPoint(x: 0.5, y: 0.55))
                .frame(width: geometry.size.width, height: geometry.size.height)
                .animation(self.imageScaleAnimation)
                .clipped()
        }
    }
    
    private var detailsToggleSection: some View {
        VStack {
            self.detailsToggleTab
                .frame(height: toggleSectionButtonHeight)
                .background(Color("Background3"))
                .gesture(self.detailsToggleGesture)
            
            Group {
                Text("Hint")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .padding(.bottom)
                
                Text("This museum houses the Mona Lisa.")
                    .scaledSystemFont(size: 20)
            }
            .foregroundColor(.white)
            
            Spacer()
        }
        .background(Color("DarkAccent2"))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    private var detailsToggleTab: some View {
        HStack {
            Spacer()
            Image(systemName: "chevron.down")
                .scaleEffect(CGSize(width: 2.0, height: 1.0), anchor: .center)
                .rotationEffect(.radians(isShowingDetails ? .pi : 0))
                .animation(imageScaleAnimation)
            Spacer()
        }
        .font(.largeTitle)
        .foregroundColor(.accentColor)
    }
    
    private var detailsSection: some View {
        VStack(spacing: 20) {
            Text("The Louvre")
                .font(.largeTitle)
            
            Group {
                Text(detailsTextLine1)
                Text(detailsTextLine2)
                Text(detailsTextLine3)
            }
            .padding(.horizontal, 20)
            .font(.body)
        }
    }
}

// MARK: - Private Helpers
private extension AnimationTriggers_Challenge {  }

// MARK: - DragState
extension AnimationTriggers_Challenge {
    enum DragState {
        case inactive
        case dragging(translation: CGSize)
    }
}

// MARK: - Preview
struct AnimationTriggers_Challenge_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationTriggers_Challenge()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
