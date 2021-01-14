import SwiftUI

// Colors
let backgroundC = Color(#colorLiteral(red: 0.1650918126, green: 0.1748427451, blue: 0.2085632682, alpha: 1))
let innerBackground = Color(#colorLiteral(red: 0.2431854308, green: 0.2543239295, blue: 0.3014985323, alpha: 1))
let icon = Color(#colorLiteral(red: 0.5456703305, green: 0.5545823574, blue: 0.5814659595, alpha: 1))

struct Hub_Previews: PreviewProvider {
  static var previews: some View {
    Hub()
  }
}

// MARK - Main Return
struct Hub: View {
  var body: some View {
    ZStack {
      backgroundC
      
      spendCard().padding([.horizontal], 10).padding([.vertical], 40)
    }
    .edgesIgnoringSafeArea([.all])
  }
}

fileprivate func spendCard() -> some View {
  return // Spend Card
    VStack(spacing: 2.0) {
      HStack(alignment: .top) {
        VStack(alignment: .leading) {
          Text("Hi Jess,")
            .kerning(-0.5)
            .foregroundColor(.white)
            .font(.custom("HelveticaNeue", size: 35))
          Text("How can we help you?")
            .kerning(-0.5)
            .foregroundColor(icon)
            .font(.custom("HelveticaNeue", size: 35))
        }
        Color.clear.frame(width: 50)
        Spacer()
        Image(systemName: "xmark.circle.fill")
          .foregroundColor(icon)
          .font(.custom("HelveticaNeue-light", size: 35))
          .padding([.all], 3)
          .padding([.top], 2)
      }
      
      Spacer()
      
      horizontalScroll()
      
      horizontalScroll()
    }
    .frame(maxHeight: .infinity)
    .padding([.all], 15)
    .background(innerBackground)
    .cornerRadius(25)
}

fileprivate func horizontalScroll() -> some View {
  return // Top Horizontal Scroll
    VStack {
      HStack(spacing: 2.0) {
        VStack(alignment: .leading) {
          HStack {
            Image(systemName: "b.square.fill")
              .foregroundColor(icon)
              .opacity(0.85)
              .font(.custom("HelveticaNeue-Medium", size: 35))
              .padding([.bottom], 25)
          }
          HStack {
            Text("Book workspace")
              .kerning(-0.5)
              .foregroundColor(icon)
              .font(.custom("HelveticaNeue-Medium", size: 14))
            Spacer()
          }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding([.all], 15)
        .background(backgroundC)
        .cornerRadius(15)
        
        VStack(alignment: .leading) {
          HStack {
            Image(systemName: "l.square.fill")
              .foregroundColor(icon)
              .opacity(0.85)
              .font(.custom("HelveticaNeue-Medium", size: 35))
              .padding([.bottom], 25)
          }
          HStack {
            Text("Laundry service")
              .kerning(-0.5)
              .foregroundColor(icon)
              .font(.custom("HelveticaNeue-Medium", size: 14))
            Spacer()
          }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding([.all], 15)
        .background(backgroundC)
        .cornerRadius(15)
        
        VStack(alignment: .leading) {
          HStack {
            Image(systemName: "r.square.fill")
              .foregroundColor(icon)
              .opacity(0.85)
              .font(.custom("HelveticaNeue-Medium", size: 35))
              .padding([.bottom], 25)
          }
          HStack {
            Text("Reserve")
              .kerning(-0.5)
              .foregroundColor(icon)
              .font(.custom("HelveticaNeue-Medium", size: 14))
            Spacer()
          }
          HStack {
            Text("bike")
              .kerning(-0.5)
              .foregroundColor(icon)
              .font(.custom("HelveticaNeue-Medium", size: 14))
            Spacer()
          }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding([.all], 15)
        .background(backgroundC)
        .cornerRadius(15)
      }
      .frame(minWidth: 0, maxWidth: .infinity)
  }
}
