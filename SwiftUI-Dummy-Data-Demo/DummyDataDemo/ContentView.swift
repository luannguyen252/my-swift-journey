

import SwiftUI


struct ContentView: View {
    
    @State var pets = dummyPetData
    
    var body: some View {
        
        NavigationView {
            
            List {
                ForEach(pets) {
                    pet in
                    
                    NavigationLink(destination: Image(pet.imageName).resizable().aspectRatio(contentMode: .fit)) {
                        SingleRowView(pet: pet)
                            .contextMenu(ContextMenu(menuItems: {
                                Label("Favorite", systemImage: "star.fill")
                            }))
                    }
                    
                }
                .onDelete(perform: {
                    indexSet in
                    if let i = indexSet.first {
                        self.pets.remove(at: i)
                    }
                })
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Pets")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        pets.append(PetModel.cat2)
                                    }, label: {
                                        Image(systemName: "plus.circle.fill")
                                        Text("Add Pet")
                                    })
            )

            
            
        }
        
    }
}



// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewLayout(.sizeThatFits)
        }
    }
}



// MARK: - Model
struct PetModel: Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var imageName: String
    var isFavorite: Bool = false
}


extension PetModel {
    static var cat1 = PetModel(name: "Grumpy Cat", type: "Britisch Kurzhaar", imageName: "cat1")
    static var cat2 = PetModel(name: "Suspicious Cat", type: "Hauskatze", imageName: "cat2")
    static var cat3 = PetModel(name: "Sneaky Cat", type: "Ragdoll-Katze", imageName: "cat3")
}


let dummyPetData = [PetModel.cat1, PetModel.cat2, PetModel.cat3]
