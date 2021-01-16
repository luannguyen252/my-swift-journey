import SwiftUI

struct MyTodo {
    var setup: String
    var rating: String
    var dealine: String
}

struct ContentView: View {
    let todos = [
    MyTodo(setup: "Clean the garage hahahahahaah", rating: "Important", dealine: "06/06"),
    MyTodo(setup: "Buy banana  ", rating: "Today", dealine: "09/09"),
    MyTodo(setup: "Book trip for christmas holiday", rating: "Today", dealine: "03/11"),
         MyTodo(setup: "check flight to Alpes", rating: "Today", dealine: "05/11")
    ]
    
    @State private var showingAddTodo = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                List {
                    ForEach(todos, id: \.setup) { todos in
                        GeometryReader { geometry in
                            NavigationLink(destination: BigView(todos: todos)) {
                                HStack {
                                    RatingView(for: todos.rating)
                                        .font(.system(size: 22))
                                    Text(todos.setup)
                                        .baselineOffset(400)
                                    Spacer()
                                    VStack(alignment: .trailing) {
                                        Text(todos.dealine)
                                            .font(.system(size: 10))
                                        Text(todos.dealine)
                                            .font(.system(size: 8))
                                    }
                                }
                            }
                            .padding()
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .frame(width: geometry.size.width * 1.15 )
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.init(.secondarySystemBackground)))
                        }
                        .frame(height: 18)
                        .padding()
                    }
                    .onDelete(perform: removeTodo)
                }
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Button(action: {
                    self.showingAddTodo.toggle()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.init(.label))
                        .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
                }
                .padding()
            }
            .onAppear { UITableView.appearance().separatorStyle = .none }
            .navigationBarTitle("My Todo")
            .navigationBarItems(leading: EditButton() , trailing: Button("Menu") {
                self.showingAddTodo.toggle()
            })
            .foregroundColor(Color.init(.label))
            .sheet(isPresented: $showingAddTodo) {
                AddTodoView()
            }
        }
    }
    
    func removeTodo(at offsets: IndexSet) {
        for index in offsets {
            let thisTodo = todos[index]
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone Pro")
            
            ContentView()
                .previewDevice("iPhone SE")
        }
    }
}
