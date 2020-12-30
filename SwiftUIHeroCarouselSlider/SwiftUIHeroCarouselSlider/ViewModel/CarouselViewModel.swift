//
//  CarouselViewModel.swift
//  SwiftUIHeroCarouselSlider
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

class CarouselViewModel: ObservableObject {
  // Card Data
  @Published var cards = [
      Card(cardColor: Color("blue"), title: "The reward for work well done is the opportunity to do more."),
      Card(cardColor: Color("green"), title: "Opportunity is missed by most people because it is dressed in overalls and looks like work."),
      Card(cardColor: Color("pink"), title: "Be regular and orderly in your life, so that you may be violent and original in your work."),
      Card(cardColor: Color("purple"), title: "Working hard and working smart sometimes can be two different things."),
      Card(cardColor: Color("yellow"), title: "The harder I work, the luckier I get."),
  ]
    
  // Swipe Card
  @Published var swipedCard = 0
  
  // Detail Content
  @Published var showCard = false
  @Published var selectedCard = Card(cardColor: .clear, title: "")
  @Published var showContent = false
  var content = "We all have those days when completing our assigned tasks seems beyond reach. With the temptation of social media, mobile games, and the internet in general—not to mention the constant bustle of people in the office—it’s easy to fall prey to disruptions and distractions at work. So, what can we do about it? How to be productive at work? While we don’t have a foolproof system that can completely eliminate disturbances and diversions, we do have 9 ground rules that can be applied to help give your productivity levels a boost. Keep reading to find out our tips on work productivity."
}
