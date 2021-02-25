import SwiftUI

struct DataFromJSONExample: View {
    var body: some View {
        VStack {
            ForEach(animals) { animal in
                Text("\(animal.name) is a \(animal.type) and is \(animal.age) years old.")
            }
        }
    }
}

// Animal Data Model
struct Animal: Identifiable, Decodable {
    var id: Int
    var name: String
    var age: Int
    var type: String
}

#if DEBUG
struct DataFromJSONExample_Previews: PreviewProvider {
    static var previews: some View {
        DataFromJSONExample()
    }
}
#endif
