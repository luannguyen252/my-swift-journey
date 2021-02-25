import SwiftUI

struct StaticDataExample: View {
    var body: some View {
        // 3. Looping through the data
        List {
            ForEach(courses) { item in
                Text(item.title)
                    .padding()
                    .background(item.color)
                    .cornerRadius(10)
            }
        }
    }
}

// 1. Data Model
struct Course: Identifiable {
    var id = UUID()
    var title: String
    var color: Color
}

// 2. Sample Data
var courses = [
    Course(title: "SwiftUI", color: Color.blue),
    Course(title: "UI Design", color: Color.red)
]

#if DEBUG
struct StaticDataExample_Previews: PreviewProvider {
    static var previews: some View {
        StaticDataExample()
    }
}
#endif
