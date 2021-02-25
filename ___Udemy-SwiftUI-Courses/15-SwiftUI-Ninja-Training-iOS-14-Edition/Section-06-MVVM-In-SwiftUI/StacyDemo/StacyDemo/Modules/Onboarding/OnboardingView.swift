//
//  OnboardingView.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 30/11/2020.
//

import SwiftUI

struct OnboardingView: View {
  @State private var showLogin = false
  @State private var showRegister = false
  @State private var animateLogin = false
  @State private var animate = false
  
  var onboardingData: [OnboardingItem] = [
    OnboardingItem(imageName: "onb_find_place", title: "Find Places to Live", description: "Find great verified places & people to share the home with."),
    OnboardingItem(imageName: "onb_match", title: "Match Your Preferencs", description: "Tell us your preferences and match with the right people."),
    OnboardingItem(imageName: "onb_like", title: "Like-minded People", description: "Live together with people who will inspire like you.")
  ]
  
  func animateViews(){
    withAnimation(Animation.interpolatingSpring(stiffness: 40, damping: 8)) {
      animate = true
    }
    
    withAnimation(.linear(duration: 2)) {
      animateLogin = true
    }
  }
  
  var body: some View {
    ZStack {
      VStack {
        TabView {
          ForEach(0 ..< onboardingData.count) { index in
            let element = onboardingData[index]
            OnboardingCard(onboardingItem: element)
          }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .offset(x: animate ? 0 : 400)
        
        Button(action: { showRegister.toggle() }) {
          Text("GET STARTED")
            .textStyle(GradientButtonStyle())
        }
        .offset(x: animate ? 0 : -400)
        .padding(.top, 25)
        .padding(.bottom, 20)
        
        Button(action: { showLogin.toggle() }) {
          Text("Login")
            .padding()
            .foregroundColor(.text)
            .opacity(animateLogin ? 1 : 0)
        }
      }
      .onAppear {
        animateViews()
      }
      .fullScreenCover(isPresented: $showLogin) {
        LoginView()
    }//vstack
      if showRegister {
        RegisterTypeView()
          .environmentObject(UserOnboardingDetails())
      }
    }//zstack
  }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
      OnboardingView()
    }
}

fileprivate struct OnboardingCard: View {
  let onboardingItem: OnboardingItem
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        Image(onboardingItem.imageName)
          .resizable()
          .frame(height: geometry.size.height / 1.5)
          .frame(maxWidth: .infinity)
        Text(onboardingItem.title)
          .font(.title)
          .foregroundColor(.title)
          .bold()
          .padding()
        Text(onboardingItem.description)
          .multilineTextAlignment(.center)
          .font(.body)
          .foregroundColor(.text)
          .padding(.horizontal, 15)
      }
    }
  }
}
