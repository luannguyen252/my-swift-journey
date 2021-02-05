import SwiftUI

struct ItemView: View {
    var item: Item
    
    var body: some View {
        HStack {
            Image(item.image)
                .resizable()
                .frame(width: 144, height: 144)
                .cornerRadius(16)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(item.name)
                    .font(.custom("TTFirsNeue-Bold", size: 18))
                    .foregroundColor(Color("light"))
                Text(item.description)
                    .font(.custom("TTFirsNeue-Regular", size: 14))
                    .foregroundColor(Color("dark4"))
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 16)
            
            Spacer(minLength: 0)
        }
        .background(Color("dark").shadow(color: Color("light").opacity(0.05), radius: 5, x: 0, y: 4))
        .cornerRadius(16)
    }
}

struct Item {
    var name: String
    var description: String
    var image: String
}

var items: [Item] = [
    Item(name: "SwiftUI for Designers 1", description: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.", image: "avatar1"),
    Item(name: "SwiftUI for Designers 2", description: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.", image: "avatar2"),
    Item(name: "SwiftUI for Designers 3", description: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.", image: "avatar3"),
    Item(name: "SwiftUI for Designers 4", description: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.", image: "avatar4"),
        
    Item(name: "SwiftUI for Designers 5", description: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.", image: "avatar5"),
    Item(name: "SwiftUI for Designers 6", description: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.", image: "avatar6"),
    Item(name: "SwiftUI for Designers 7", description: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.", image: "avatar7"),
    Item(name: "SwiftUI for Designers 8", description: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.", image: "avatar8"),
    
    Item(name: "SwiftUI for Designers 9", description: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.", image: "avatar1"),
    Item(name: "SwiftUI for Designers 10", description: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.", image: "avatar2"),
    Item(name: "SwiftUI for Designers 11", description: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.", image: "avatar3"),
    Item(name: "SwiftUI for Designers 12", description: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.", image: "avatar4"),
]
