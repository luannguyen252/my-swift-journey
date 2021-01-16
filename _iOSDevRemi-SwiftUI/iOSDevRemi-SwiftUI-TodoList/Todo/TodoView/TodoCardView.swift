import SwiftUI

struct TodoCardView: View {
    var todos: MyTodo
    
    var body: some View {
        VStack{
            HStack {
                RatingView(for: todos.rating)
                Text(todos.setup)
            }
        }
    }
}
