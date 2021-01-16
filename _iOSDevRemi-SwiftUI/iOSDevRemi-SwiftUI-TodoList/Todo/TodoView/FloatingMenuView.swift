import SwiftUI

struct FloatingMenuView: View {
    @State var showMenuItem1 = false
    @State var showMenuItem2 = false
    @State var showMenuItem3 = false

    var body: some View {
        VStack {
            Spacer()
            if showMenuItem1 {
                Button(action: {
                }) {
                    MenuItem(icon: "square")
                }
            }
            if showMenuItem2 {
                Button(action: {
                }) {
                    MenuItem(icon: "photo.on.rectangle")
                }
            }
            if showMenuItem3 {
                Button(action: {
                }) {
                    MenuItem(icon: "square.and.arrow.up")
                }
                
            }
            Button(action: {
                self.showMenu()
            }) {
                if self.showMenuItem3 {
                    Image(systemName: "minus.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.init(.systemBlue))
                        .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
                } else {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.init(.systemBlue))
                    .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
                }
            }
        }
    }
    
    func showMenu() {
          withAnimation {
              self.showMenuItem3.toggle()
          }
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
              withAnimation {
                  self.showMenuItem2.toggle()
              }
          })
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
              withAnimation {
                  self.showMenuItem1.toggle()
              }
          })
      }
}

struct FloatingMenuView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingMenuView()
    }
}

struct MenuItem: View {
    var icon: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.init(.systemBlue))
                .frame(width: 40, height: 40)
            Image(systemName: icon)
                .imageScale(.medium)
                .foregroundColor(Color.init(.systemBackground))
        }
        .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
        .transition(.move(edge: .trailing))
    }
}
