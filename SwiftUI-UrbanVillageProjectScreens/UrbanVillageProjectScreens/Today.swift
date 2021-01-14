import SwiftUI

// Colors
let buttonColor = Color(#colorLiteral(red: 0.7692624927, green: 0.3453927636, blue: 0.1849986017, alpha: 1))
let iconColor = Color(#colorLiteral(red: 0.5774407983, green: 0.5498628616, blue: 0.4827260375, alpha: 1))

struct Today_Previews: PreviewProvider {
  static var previews: some View {
    Today()
  }
}

// MARK - main return
struct Today: View {
  var body: some View {
    ScrollView {
      VStack(spacing: 10) {
        topStack()
        
        VStack(spacing: 10.0) {
          spendCard()
          
          horizontalScroll()
          
          otherCardsView()
        }
        .padding([.horizontal], 20)
      }
      .padding([.top], 75)
    }
    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height).background(backgroundColor)
  }
}

fileprivate func topStack() -> some View {
  return HStack {
    Text("Today")
      .kerning(-1)
      .foregroundColor(textColor)
      .font(.custom("HelveticaNeue-Medium", size: 25))
    
    Spacer()
    
    Image("woman")
      .resizable()
      .scaledToFill()
      .frame(width: 45, height: 45)
      .clipShape(Circle())
  }
  .padding([.horizontal], 20)
}

fileprivate func spendCard() -> some View {
  return // Spend Card
    VStack {
      HStack {
        VStack(alignment: .leading) {
          Text("Hi Jess,")
            .kerning(-0.5)
            .foregroundColor(.white)
            .font(.custom("HelveticaNeue", size: 24))
            
          Text("You can modify your next meal box until 16.00 today")
            .kerning(-0.5)
            .foregroundColor(.white)
            .font(.custom("HelveticaNeue", size: 24))
            
          Image(systemName: "ellipsis.circle.fill")
            .foregroundColor(buttonColor)
            .opacity(0.9)
            .font(.system(size: 28, weight: .regular))
        }
        Spacer()
        Color.clear.frame(width: 100)
      }
      
      Color.clear.frame(height: 250)
      
    }
    .padding([.all], 15)
      .background(
        ZStack {
          PlayerView()
            .scaleEffect(3.0)
          
          LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.55), Color.black.opacity(0.0)]), startPoint: .top, endPoint: .bottom)
      })
      .cornerRadius(25)
}

fileprivate func horizontalScroll() -> some View {
  return // Top Horizontal Scroll
    VStack {
      HStack(spacing: 2.0) {
        VStack(alignment: .leading) {
          HStack {
            Image(systemName: "b.square.fill")
              .foregroundColor(iconColor)
              .opacity(0.85)
              .font(.custom("HelveticaNeue-Medium", size: 35))
              .padding([.bottom], 25)
          }
          HStack {
            Text("Book workspace")
              .kerning(-0.5)
              .foregroundColor(iconColor)
              .font(.custom("HelveticaNeue-Medium", size: 14))
            Spacer()
          }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding([.all], 15)
        .background(Color.white)
        .cornerRadius(15)
        
        VStack(alignment: .leading) {
          HStack {
            Image(systemName: "l.square.fill")
              .foregroundColor(iconColor)
              .opacity(0.85)
              .font(.custom("HelveticaNeue-Medium", size: 35))
              .padding([.bottom], 25)
          }
          HStack {
            Text("Laundry service")
              .kerning(-0.5)
              .foregroundColor(iconColor)
              .font(.custom("HelveticaNeue-Medium", size: 14))
            Spacer()
          }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding([.all], 15)
        .background(Color.white)
        .cornerRadius(15)

        VStack(alignment: .leading) {
          HStack {
            Image(systemName: "r.square.fill")
              .foregroundColor(iconColor)
              .opacity(0.85)
              .font(.custom("HelveticaNeue-Medium", size: 35))
              .padding([.bottom], 25)
          }
          HStack {
            Text("Reserve")
              .kerning(-0.5)
              .foregroundColor(iconColor)
              .font(.custom("HelveticaNeue-Medium", size: 14))
            Spacer()
          }
          HStack {
            Text("bike")
              .kerning(-0.5)
              .foregroundColor(iconColor)
              .font(.custom("HelveticaNeue-Medium", size: 14))
            Spacer()
          }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding([.all], 15)
        .background(Color.white)
        .cornerRadius(15)
      }
      .frame(minWidth: 0, maxWidth: .infinity)
  }
}

fileprivate func otherCardsView() -> some View {
  return // Other Cards
    VStack(spacing: 0.0) {
      // First card
      HStack(alignment: .top) {
        VStack(alignment: .leading) {
          Text("My calendar")
            .kerning(-0.5)
            .foregroundColor(iconColor)
            .font(.custom("HelveticaNeue-Regular", size: 22))
        }
        
        Spacer()
        
        Image(systemName: "ellipsis")
          .foregroundColor(iconColor)
          .opacity(0.8)
          .font(.system(size: 22, weight: .light))
          .padding([.all], 2)
      }
      .padding([.all], 15)
      .background(Color.white)
      
      iconColor.frame(height: 1).brightness(0.35)
      
      // Second Card
      HStack(alignment: .top) {
          Text("19:00")
            .kerning(-0.5)
            .foregroundColor(iconColor)
            .font(.custom("HelveticaNeue-Regular", size: 15))
            .padding([.trailing], 5)
        
          Text("Spanish class booked")
            .kerning(-0.5)
            .foregroundColor(iconColor)
            .font(.custom("HelveticaNeue-Regular", size: 15))
        
        Spacer()
        
        Image(systemName: "plus")
          .foregroundColor(iconColor)
          .font(.system(size: 17, weight: .bold))
          .padding([.top], 0)
        
      }.padding([.all], 15)
        .background(Color.white)
      
      // Second card
      HStack(alignment: .top) {
        Text("19:00")
          .kerning(-0.5)
          .foregroundColor(iconColor)
          .font(.custom("HelveticaNeue-Regular", size: 15))
          .padding([.trailing], 5)
        
        Text("Spanish class booked")
          .kerning(-0.5)
          .foregroundColor(iconColor)
          .font(.custom("HelveticaNeue-Regular", size: 15))
        
        Spacer()
        
        Image(systemName: "plus")
          .foregroundColor(iconColor)
          .font(.system(size: 17, weight: .bold))
          .padding([.top], 0)
      }
      .padding([.all], 15)
      .background(Color.white)
    }
    .cornerRadius(25)
}
