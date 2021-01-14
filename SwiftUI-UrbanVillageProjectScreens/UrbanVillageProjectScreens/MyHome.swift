import SwiftUI

// Colors
let backgroundColor = Color(#colorLiteral(red: 0.9478042722, green: 0.9413100481, blue: 0.937730968, alpha: 1))
let textColor = Color(#colorLiteral(red: 0.2569463253, green: 0.2420758605, blue: 0.2151646316, alpha: 1))
let secondaryColor = Color(#colorLiteral(red: 0.5676505566, green: 0.5602197647, blue: 0.5466300845, alpha: 1))
let accentTextColor = Color(#colorLiteral(red: 0.6852199435, green: 0.6780956984, blue: 0.6678422093, alpha: 1))
let firstCardColor = Color(#colorLiteral(red: 0.6142973304, green: 0.6206635833, blue: 0.583666563, alpha: 1))
let secondaryAccentTextColor = Color(#colorLiteral(red: 0.7871719599, green: 0.7800607085, blue: 0.7697893977, alpha: 1))
let secondCardColor = Color(#colorLiteral(red: 0.5775497556, green: 0.5494823456, blue: 0.4757016897, alpha: 1))
let thirdCardColor = Color(#colorLiteral(red: 0.4129932523, green: 0.3736724257, blue: 0.3598947823, alpha: 1))
let fourthCardColor = Color(#colorLiteral(red: 0.2431854308, green: 0.2543239295, blue: 0.3014985323, alpha: 1))
let dividerColor = Color(#colorLiteral(red: 0.2628910542, green: 0.2736267447, blue: 0.3174280226, alpha: 1))
let opaqueColor = Color(#colorLiteral(red: 0.3335806727, green: 0.343891114, blue: 0.3843034506, alpha: 1))

fileprivate func topStack() -> some View {
  return HStack {
    Text("My home")
      .kerning(-1)
      .foregroundColor(textColor)
      .font(.custom("HelveticaNeue-Medium", size: 25))
    
    Spacer()
    
    Image("woman")
      .resizable()
      .scaledToFill()
      .frame(width: 45, height: 45)
      .clipShape(Circle())
  }.padding([.horizontal], 20)
}

fileprivate func spendCard() -> some View {
  return // Spend Card
    VStack {
      HStack {
        Text("Your total monthly spend")
          .kerning(-0.5)
          .foregroundColor(accentTextColor)
          .font(.custom("HelveticaNeue-Medium", size: 14))
        
        Spacer()
        
        HStack {
          Text("March")
            .kerning(-0.5)
            .foregroundColor(accentTextColor)
            .font(.custom("HelveticaNeue-Medium", size: 13))
          
          Color.clear.frame(width: 0)
          
          Image(systemName: "arrowtriangle.down.fill")
            .foregroundColor(accentTextColor)
            .font(.system(size: 8, weight: .black))
        }.padding([.vertical], 2)
          .padding([.horizontal], 8)
          .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(accentTextColor.opacity(0.5), lineWidth: 1))
      }
      
      Color.clear.frame(height: 30)
      
      HStack {
        
        Spacer()
        
        Text("1,938")
          .kerning(-0.5)
          .foregroundColor(secondaryColor)
          .font(.custom("HelveticaNeue-Light",
                        size: 55))
      }
    }.padding([.all], 15)
      .background(Color.white)
      .cornerRadius(25)
}

// MARK - Main Return
struct MyHome: View {
  var body: some View {
    ScrollView {
      VStack(spacing: 0) {
        
        topStack()
        
        horizontalScroll()
        
        VStack(spacing: 0.0) {
          
          spendCard()
          
          // Other cards
          VStack(spacing: 0.0) {
            
            // First Card
            HStack(alignment: .top) {
              VStack(alignment: .leading) {
                Text("Base rent")
                  .kerning(-0.5)
                  .foregroundColor(Color.white)
                  .font(.custom("HelveticaNeue-Regular",
                                size: 22))
                Text("1,430")
                  .kerning(-0.5)
                  .foregroundColor(firstCardColor)
                  .brightness(0.15)
                  .font(.custom("HelveticaNeue-Regular",
                                size: 22))
              }
              
              Spacer()
              
              Image(systemName: "b.circle.fill")
                .foregroundColor(Color.white.opacity(0.8))
                .font(.system(size: 35,
                              weight: .regular))
                .padding([.top], 5)
              
            }.padding([.all], 15)
              .background(firstCardColor)
            
            // Second Card
            HStack(alignment: .top) {
              VStack(alignment: .leading) {
                Text("Energy")
                  .kerning(-0.5)
                  .foregroundColor(Color.white)
                  .font(.custom("HelveticaNeue-Regular",
                                size: 22))
                Text("120")
                  .kerning(-0.5)
                  .foregroundColor(secondCardColor)
                  .brightness(0.15)
                  .font(.custom("HelveticaNeue-Regular",
                                size: 22))
              }
              
              Spacer()
              
              Image(systemName: "e.circle.fill")
                .foregroundColor(Color.white.opacity(0.8))
                .font(.system(size: 35,
                              weight: .regular))
                .padding([.top], 5)
              
            }.padding([.all], 15)
              .background(secondCardColor)
            
            // Third Card
            HStack(alignment: .top) {
              VStack(alignment: .leading) {
                Text("Recreation")
                  .kerning(-0.5)
                  .foregroundColor(Color.white)
                  .font(.custom("HelveticaNeue-Regular", size: 22))
                Text("78")
                  .kerning(-0.5)
                  .foregroundColor(thirdCardColor)
                  .brightness(0.15)
                  .font(.custom("HelveticaNeue-Regular", size: 22))
              }
              
              Spacer()
              
              Image(systemName: "r.circle.fill")
                .foregroundColor(Color.white.opacity(0.8))
                .font(.system(size: 35, weight: .regular))
                .padding([.top], 5)
              
            }.padding([.all], 15).background(thirdCardColor)
            
            // Fourth Card
            VStack {
              HStack {
                VStack(alignment: .leading) {
                  Text("Food")
                    .kerning(-0.5)
                    .foregroundColor(Color.white)
                    .font(.custom("HelveticaNeue-Regular", size: 22))
                  Text("23")
                    .kerning(-0.5)
                    .foregroundColor(fourthCardColor)
                    .brightness(0.15)
                    .font(.custom("HelveticaNeue-Regular", size: 22))
                }
                
                Spacer()
                
                Image(systemName: "f.circle.fill").foregroundColor(Color.white.opacity(0.8)).font(.system(size: 35, weight: .regular))
                    .padding([.top], 5)
              }
              .padding([.bottom], 50)
              
              dividerColor.frame(height: 2)
              
              HStack(alignment: .top) {
                VStack(alignment: .leading) {
                  Text("Your meal box")
                    .kerning(-0.5)
                    .foregroundColor(Color.white)
                    .font(.custom("HelveticaNeue-Regular",
                                  size: 16))
                  Text("Vegetarian").kerning(-0.5)
                    .foregroundColor(fourthCardColor)
                    .brightness(0.15)
                    .font(.custom("HelveticaNeue-Regular", size: 14))
                }
                
                VStack(alignment: .leading) {
                  Text("People")
                    .kerning(-0.5)
                    .foregroundColor(Color.white)
                    .font(.custom("HelveticaNeue-Regular", size: 16))
                  Text("2")
                    .kerning(-0.5)
                    .foregroundColor(fourthCardColor)
                    .brightness(0.15)
                    .font(.custom("HelveticaNeue-Regular", size: 14))
                }
                
                VStack(alignment: .leading) {
                  Text("Days")
                    .kerning(-0.5)
                    .foregroundColor(Color.white)
                    .font(.custom("HelveticaNeue-Regular", size: 16))
                  Text("5")
                    .kerning(-0.5)
                    .foregroundColor(fourthCardColor)
                    .brightness(0.15)
                    .font(.custom("HelveticaNeue-Regular", size: 14))
                }
                
                Spacer()
                
                HStack {
                  Text("Change plan")
                    .kerning(-0.5)
                    .foregroundColor(fourthCardColor)
                    .brightness(0.40)
                    .font(.custom("HelveticaNeue-Medium", size: 14))
                }
                .padding([.vertical], 2)
                .padding([.horizontal], 7)
                .background(opaqueColor.opacity(0.9))
                .cornerRadius(10)
              }
              .padding([.bottom], 10)
              
              dividerColor.frame(height: 2)
              
              HStack {
                VStack(alignment: .leading) {
                  Text("Next Delivery")
                    .kerning(-0.5)
                    .foregroundColor(Color.white)
                    .font(.custom("HelveticaNeue-Regular", size: 16))
                  Text("Monday 4th 4pm")
                    .kerning(-0.5)
                    .foregroundColor(fourthCardColor)
                    .brightness(0.15)
                    .font(.custom("HelveticaNeue-Regular", size: 14))
                }
                
                Spacer()
                
              }
              .padding([.bottom], 10)
              
            }
            .padding([.all], 15).background(fourthCardColor)
          }
          .cornerRadius(25)
        }
        .padding([.horizontal], 20)
      }
      .padding([.top], 75)
    }
    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height).background(backgroundColor)
  }
}

struct MyHome_Previews: PreviewProvider {
  static var previews: some View {
    MyHome()
  }
}

fileprivate func horizontalScroll() -> some View {
  var selected = true
  
  return // Top Horizontal Scroll
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        Color.clear.frame(width: 13)
        
        VStack {
          Text("Subscriptions")
            .kerning(-0.5)
            .foregroundColor(secondaryColor)
            .font(.custom("HelveticaNeue-Medium", size: 18))
            .padding([.vertical], 5)
            .padding([.horizontal], 10)
            .background(selected ? Color.white : Color.clear)
            .cornerRadius(15)
        }
        .onTapGesture {
          print("tapped")
          selected.toggle()
        }
        
        Color.clear.frame(width: 90)
        
        Text("Utilities").kerning(-0.5)
          .foregroundColor(secondaryAccentTextColor)
          .font(.custom("HelveticaNeue-Medium", size: 18))
        
        Color.clear.frame(width: 20)
        
        Text("Finances")
          .kerning(-0.5)
          .foregroundColor(secondaryAccentTextColor)
          .font(.custom("HelveticaNeue-Medium", size: 18))
      }
    }
    .padding([.bottom], 20).padding([.top], 15)
}
