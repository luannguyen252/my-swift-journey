import SwiftUI
import CoreData

struct ViewMemo: View {
    // Core Data Fetch Request
    // Were getting Memos At descending order by using added or modifed date
    @FetchRequest(entity: Memo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Memo.dateAdded, ascending: false)], animation: .easeIn) var results : FetchedResults<Memo>
    
    var body: some View {
        List(results) { item in
            HStack(spacing: 8) {
                VStack(alignment: .leading, spacing: 4, content: {
                    Text(item.title ?? "")
                        .font(.custom("TTFirsNeue-Bold", size: 12))
                        .foregroundColor(Color("light"))
                    
                    Text("Last Modified")
                        .font(.custom("TTFirsNeue-DemiBold", size: 8))
                        .foregroundColor(Color("light").opacity(0.5))
                        .padding(.top, 2)
                    
                    Text(item.dateAdded ?? Date(),style: .date)
                        .font(.custom("TTFirsNeue-DemiBold", size: 8))
                        .foregroundColor(Color("light").opacity(0.5))
                })
                
                Spacer(minLength: 4)
                
                // Edit Button
                NavigationLink(
                    destination: AddItem(memoItem: item),
                    label: {
                        Image(systemName: "square.and.pencil")
                            .font(.callout)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color("orange"))
                            .cornerRadius(8)
                    })
                    .buttonStyle(PlainButtonStyle())
            }
        }
        .listStyle(CarouselListStyle())
        .padding(.top)
        .overlay(
            Text(results.isEmpty ? "No Memo's found" : "")
                .font(.custom("TTFirsNeue-Bold", size: 14))
                .foregroundColor(Color("light"))
        )
        .navigationTitle("Memo List")
    }
}

#if DEBUG
struct ViewMemo_Previews: PreviewProvider {
    static var previews: some View {
        ViewMemo()
    }
}
#endif
