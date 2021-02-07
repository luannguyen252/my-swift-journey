//
//  UpdateList.swift
//  DesignCode.v1
//
//  Created by Tee Becker on 10/30/20.
//

import SwiftUI

struct UpdateList: View {
    
    @ObservedObject var store = UpdateStore()
    
    func addUpdate(){
        store.updates.append(lesson(title: "New Item", logo: Image("logo1"), image: Image("Card4"), detail: "Some new stuff", date: "JAN 1"))
    }
    
    var body: some View {
        
        // Basically the Navigation Controller
        NavigationView {
            
// To add the swipe to delete function, we can not use a List, therefore making a changge from List to forEach loop.
        // List(store.updates) { item in
        //    NavigationLink(destination: UpdateDetail(update: item)) {
            
            List {
                ForEach(store.updates) { item in
                    NavigationLink(destination: UpdateDetail(update: item)) {
                        //what each row should look like
                        HStack {
                            
                            item.image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(Color.black)
                                .cornerRadius(20)
                                .padding(.trailing, 4)
                                
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(item.title)
                                    .font(.system(size: 20, weight: .bold))
                                
                                Text(item.detail)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                                
                                Text(item.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
    //                                .frame(width: 90, height: 30)
    //                                .background(Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)))
    //                                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }// end of forloop
                
                // adding editing and delete functions to the list
                .onDelete(perform: { indexSet in
                    store.updates.remove(at: indexSet.first!)})
                .onMove(perform: { indices, newOffset in
                    store.updates.move(fromOffsets: indices, toOffset: newOffset)
                })
                .listRowBackground(Color.clear)
            }
            .navigationBarTitle(Text("Updates"))
            
            // adding the buttons to show add and delete functions.
            .navigationBarItems(
                leading: Button(action: addUpdate) { Image(systemName: "plus")},
                trailing: EditButton()
                    
            )
        }
    }
}



struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        
        UpdateList()
    }
}


struct lesson: Identifiable{
    var id = UUID()
    var title: String
    var logo: Image
    var image: Image
    var detail: String
    var date: String
}

let lessons = [
    
    lesson(title: "SwiftUI Advanced", logo: Image("Logo1"), image: Image("Card1"), detail: "Want to test concepts using real techniques? This is the perfect course to learn design using SwiftUI", date: "DEC 14"),
    
    lesson(title: "SwiftUI Prototyping", logo: Image("Logo1"), image: Image("Card2"), detail: "Take your SwiftUI app to the App store with advanced techniques like API data, packages and CMS.", date: "NOV 26"),
    
    lesson(title: "ProtoPie", logo: Image("Logo1"), image: Image("Card3"), detail: "Quickly prototype advanced animations and interactions for mobile and web.", date: "AUG 27")
    
]
