import SwiftUI

struct TabBar: View {
    @State var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            FirstScreen()
                .tag(1)
            
            SecondScreen()
                .tag(2)
            
            ThirdScreen()
                .tag(3)
        }
        .overlay( // Overlay the custom TabView component here
            Color.white // Base color for Tab Bar
                .edgesIgnoringSafeArea(.vertical)
                .frame(height: 50) // Match Height of native bar
                .shadow(color: Color("dark").opacity(0.1), radius: 16, x: -4, y: 0)
                .overlay(HStack {
                    Spacer()

                    // First Tab Button
                    Button(action: {
                        self.selection = 1
                    }, label: {
                        Image(systemName: "house.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(Color(red: 32/255, green: 43/255, blue: 63/255))
                            .opacity(selection == 1 ? 1 : 0.4)
                    })
                    Spacer()
                    
                    // Second Tab Button
                    Button(action: {
                        self.selection = 2
                    }, label: {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(Color(red: 32/255, green: 43/255, blue: 63/255))
                            .opacity(selection == 2 ? 1 : 0.4)
                    })
                    
                    Spacer()
                    
                    // Third Tab Button
                    Button(action: {
                        self.selection = 3
                    }, label: {
                        Image(systemName: "gear")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(Color(red: 32/255, green: 43/255, blue: 63/255))
                            .opacity(selection == 3 ? 1 : 0.4)
                    })
                    Spacer()
                    
                })
        ,alignment: .bottom) // Align the overlay to bottom to ensure tab bar stays pinned.
    }
}

#if DEBUG
struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
#endif
