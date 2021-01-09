//
//  GettingStarted_CurvesExample.swift
//  SwiftUIAnimationsMastery
//
//  Created by CypherPoet on 2/4/20.
// ✌️
//

import SwiftUI

struct GettingStarted_CurvesExample {
    private var animationDuration: Double = 0.54
    @State private var isCircleOffset = false
}

// MARK: - View
extension GettingStarted_CurvesExample: View {
    var body: some View {
        VStack(spacing: 30) {
            descriptionSection
                .layoutPriority(1)

            Group {
                easeInOutSection
                easeInSection
                easeOutSection
                linearSection
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                self.isCircleOffset.toggle()
            }) {
                Text("Animate ⚡️")
                    .font(.title)
            }
        }
        .padding(.vertical)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

// MARK: - Computeds
extension GettingStarted_CurvesExample {
}

// MARK: - View Variables
extension GettingStarted_CurvesExample {
    private var easeInOutSection: some View {
        VStack(spacing: 10) {
            VStack(spacing: 4) {
                Text("EaseInOut (AKA `Animation.default`)")
                    .font(.headline)
                
                Text("Slower Start, Faster Middle, Slower Finish")
                    .textStyle(SubheadlineTextStyle())
            }
            
            GeometryReader { geometry in
                HStack {
                    ExampleCircle(container: geometry, isOffset: self.isCircleOffset)
                        // .animation(Animation.default)
                        .animation(.easeInOut(duration: self.animationDuration))
                }
                Spacer()
            }
        }
    }

    private var easeInSection: some View {
        VStack(spacing: 10) {
            VStack(spacing: 4) {
                Text("EaseIn")
                    .font(.headline)
                
                Text("Slower Start, Faster Finish")
                    .textStyle(SubheadlineTextStyle())
            }
            
            GeometryReader { geometry in
                HStack {
                    ExampleCircle(container: geometry, isOffset: self.isCircleOffset)
                        .animation(.easeIn(duration: self.animationDuration))
                }

                Spacer()
            }
        }
    }
    
    private var easeOutSection: some View {
        VStack(spacing: 10) {
            VStack(spacing: 4) {
                Text("EaseOut")
                    .font(.headline)
                
                Text("Faster Start, Slower Finish")
                    .textStyle(SubheadlineTextStyle())
            }
            
            GeometryReader { geometry in
                HStack {
                    ExampleCircle(container: geometry, isOffset: self.isCircleOffset)
                        .animation(.easeOut(duration: self.animationDuration))
                }
                Spacer()
            }
        }
    }

    private var linearSection: some View {
        VStack(spacing: 10) {
            VStack(spacing: 4) {
                Text("Linear")
                    .font(.headline)
                
                Text("Steady Speed Throughout")
                    .textStyle(SubheadlineTextStyle())
            }
            
            GeometryReader { geometry in
                HStack {
                    ExampleCircle(container: geometry, isOffset: self.isCircleOffset)
                        .animation(.linear(duration: self.animationDuration))
                }
                Spacer()
            }
        }
    }
    
    private var descriptionSection: some View {
        VStack(spacing: 12) {
            Text("Curves")
                .textStyle(TitleTextStyle())
            
            Text("Examples")
                .textStyle(SubtitleTextStyle())
            
            BannerTextView(text: "There are 4 built-in animation curves provided by SwiftUI.")
        }
    }
}



// MARK: - ExampleCircle
private struct ExampleCircle {
    var container: GeometryProxy
    var isOffset: Bool
    var diameter: CGFloat = 60
}

extension ExampleCircle: View {
    var body: some View {
        Circle()
            .fill(Color.pink)
            .frame(width: diameter, height: diameter)
            .offset(self.circleOffset)
    }
}

private extension ExampleCircle {
    var circleOffset: CGSize {
        CGSize(
            width: isOffset ? (container.size.width - diameter) : 0,
            height: 0
        )
    }
}

// MARK: - Preview
struct GettingStarted_CurvesExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GettingStarted_CurvesExample()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}
