import SwiftUI

struct FloatingAddView: View {
    @State private var showingAddTodo = false
    
    var body: some View {
        VStack {
            Button(action: {
               self.showingAddTodo.toggle()
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.init(.systemBlue))
                    .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
            }
        }
        .sheet(isPresented: $showingAddTodo) {
            AddTodoView()
        }
    }
}

struct FloatingAddView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingAddView()
    }
}
