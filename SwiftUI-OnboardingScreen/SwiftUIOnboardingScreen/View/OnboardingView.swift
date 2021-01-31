//
//  OnboardingView.swift
//  SwiftUIOnboardingScreen
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    var subviews = [
        UIHostingController(rootView: SubView(imageString: "meditating")),
        UIHostingController(rootView: SubView(imageString: "skydiving")),
        UIHostingController(rootView: SubView(imageString: "sitting"))
    ]
    
    var titles = ["Take some time out", "Conquer personal hindrances", "Create a peaceful mind"]
    
    var captions =  ["Take your time out and bring awareness into your everyday life", "Meditating helps you dealing with anxiety and other psychic problems", "Regular medidation sessions creates a peaceful inner mind"]
    
    @State var currentPageIndex = 0
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            // MARK: - ONBOARDING IMAGES
            PageViewController(currentPageIndex: $currentPageIndex, viewControllers: subviews)
                .frame(height: 600)
            
            // MARK: - ONBOARDING CONTENT
            VStack(alignment: .leading, spacing: 16) {
                Text(titles[currentPageIndex])
                    .font(.title)
                    .lineLimit(nil)
                Text(captions[currentPageIndex])
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(nil)
            }
            .padding()
            
            // MARK: - ONBOARDING FOOTER
            HStack() {
                PageControl(numberOfPages: subviews.count, currentPageIndex: $currentPageIndex)
                Spacer()
                Button(action: {
                    if self.currentPageIndex+1 == self.subviews.count {
                        self.currentPageIndex = 0
                    } else {
                        self.currentPageIndex += 1
                    }
                }) {
                    ButtonContent()
                }
            } //: HSTACK
            .padding()
        } //: VSTACK
    }
}

// MARK: - PREVIEW
#if DEBUG
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
#endif
