

import SwiftUI

struct ContentView: View {
    
    let bunTypes: [String] = ["Patato roll", "SwissBun","SourDough"]
    let cheeseTypes = ["American","PeperJack","Swiss"]
    let proteinTypes = ["Beef","Chicken","Veggie"]
    
    
    @State var quantity: Int = 0
    @State var bun: String = ""
    @State var Cheese:String = ""
    @State var protein:String = ""
    @State var specialInstructions: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                
                VStack(alignment:.leading,spacing: 8){
                    Text("Awesome burger")
                        .foregroundColor(.gray)
                        .font(.title)
     //               Text("is the best burger there is!")
                     .foregroundColor(.gray)
                }
                
                
                // Quanity
                Section(header:Text("Quantity")){
                    Stepper(value: $quantity){
                        Text(quantity.description)
                        .foregroundColor(.gray)
                        
                    }
                }
                
                Section(header:Text("Options")){
                    Picker(selection: $bun, label: Text("Bun")) {
                        ForEach(bunTypes,id: \.self) { (bun) in
                            Text(bun)
                            .foregroundColor(.pink)
                        }
                    }
                    
                    Picker(selection: $Cheese, label: Text("Cheese")) {
                        ForEach(cheeseTypes,id: \.self) { (cheese) in
                            Text(cheese)
                            .foregroundColor(.orange)
                            
                        }
                        
                        
                        
                    }
                    
                    
                    Picker(selection: $protein, label: Text("Protein")) {
                        ForEach(proteinTypes,id: \.self) { (protein) in
                            Text(protein)
                            .foregroundColor(.yellow)
                            
                            
                        }
                        
                        
                        
                    }
                    
                    
                    
                    
                }
                Section(header:Text("Special Instructions")) {
                    TextField("special instructions",text:$specialInstructions)
                    .foregroundColor(.blue)
                }
                
                Button(action: SubmitOrder) {
                    Text("Submit Order")
                     .foregroundColor(.gray)
                    
                }
                
              
                
            }
            
        }
        
    }
    
    func SubmitOrder() {
         
        //do something
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

