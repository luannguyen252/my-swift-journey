import SwiftUI

struct FloatingMenu: View {
    @State var showMenuItem1 = false
    @State var showMenuItem2 = false
    @State var showMenuItem3 = false
    @State var showMenuItem4 = false
    @State var showMenuItem5 = false
    
    var body: some View {
        VStack {
            Spacer()
            
            if showMenuItem1 {
                MenuItem(icon: "bolt.fill", foregroundColor: "yellow", backgroundColor: "yellow")
            }
            if showMenuItem2 {
                MenuItem(icon: "drop.fill", foregroundColor: "blue", backgroundColor: "blue")
            }
            if showMenuItem3 {
                MenuItem(icon: "leaf.fill", foregroundColor: "green", backgroundColor: "green")
            }
            if showMenuItem4 {
                MenuItem(icon: "flame.fill", foregroundColor: "red", backgroundColor: "red")
            }
            if showMenuItem5 {
                MenuItem(icon: "person.fill", foregroundColor: "purple", backgroundColor: "purple")
            }
            
            Button(action: {
                self.showMenu()
            }) {
                ZStack {
                    Circle()
                        .fill(Color("orange"))
                        .frame(width: 64, height: 64)
                    
                    Image(systemName: "swift")
                        .font(.system(size: 32))
                        .foregroundColor(Color("white"))
                }
            }
        }
    }
    
    // Show Menu
    func showMenu() {
        withAnimation {
            self.showMenuItem5.toggle()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            withAnimation {
                self.showMenuItem4.toggle()
            }
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            withAnimation {
                self.showMenuItem3.toggle()
            }
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            withAnimation {
                self.showMenuItem2.toggle()
            }
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
            withAnimation {
                self.showMenuItem1.toggle()
            }
        })
    }
}

#if DEBUG
struct FloatingMenu_Previews: PreviewProvider {
    static var previews: some View {
        FloatingMenu()
    }
}
#endif

// Menu Item
struct MenuItem: View {
    var icon: String
    var foregroundColor: String
    var backgroundColor: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(backgroundColor).opacity(0.15))
                .frame(width: 56, height: 56)
            Image(systemName: icon)
                .imageScale(.large)
                .foregroundColor(Color(foregroundColor))
        }
        .transition(.move(edge: .trailing))
    }
}
