import SwiftUI
import PlaygroundSupport

struct Screen: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue]        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.systemBlue]
    }
    @State var tasks = ["Meal Prep", "Call Family", "Do Laundry"]
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                List {
                    ForEach(self.tasks, id: \.self) { task in 
                        HStack {
                            Image(systemName: "circle").resizable().frame(width: 20, height: 20)
                            Text(task)
                        }
                    }.onDelete { indexSet in 
                        self.tasks.remove(atOffsets: indexSet)
                    }
                }
                Button(action:{}) {
                    HStack {
                        Image(systemName: "plus.circle.fill").resizable().frame(width: 20, height: 20)
                        Text("New Reminder").foregroundColor(.blue)
                    }
                }.padding()
            }.navigationBarTitle("Reminders").navigationBarItems(trailing: Button(action: {}) {
                Image(systemName: "ellipsis.circle")
            })
        }
    }
}

PlaygroundPage.current.setLiveView(Screen())
