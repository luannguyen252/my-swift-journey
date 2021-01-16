import SwiftUI



struct MenuView: View {
    
    
    var body: some View {
        HStack {
            Button(action: {
                ActionView.Action.clear
                print("Menu button taped")
            }, label: {
                Image(systemName: "line.horizontal.3.decrease.circle")
                    .font(.system(size: 44))
                    .foregroundColor(Color.init(.label))
                
            })
            Spacer()
        }.padding()
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
