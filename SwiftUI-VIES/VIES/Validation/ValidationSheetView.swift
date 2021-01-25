import SwiftUI

struct ValidationSheetView: View {
    var response: Response
    
    var body: some View {
        ZStack {
            if response.valid {
                Color.green.opacity(0.2)
            } else {
                Color.red.opacity(0.2)
            }
            
            VStack {
                Image(systemName: response.valid ? "checkmark.circle.fill" : "xmark.octagon.fill")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                
                Text(response.valid ? "Yes, valid VAT number" : "No, invalid VAT number")
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding()
                
                Group {
                    HStack {
                        Text("Member State")
                            .fontWeight(.bold)
                        Text("\(response.countryCode)")
                    }
                    
                    HStack {
                        Text("VAT Number")
                            .fontWeight(.bold)
                        Text("\(response.vatNumber)")
                    }
                    
                    HStack {
                        Text("Name")
                            .fontWeight(.bold)
                        Text("\(response.name)")
                    }
                    
                    HStack {
                        Text("Address")
                            .fontWeight(.bold)
                        Text("\(response.address)")
                    }
                }
                .allowsTightening(true)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ValidationSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ValidationSheetView(response: Response(valid: true, vatNumber: "12345678901", name: "Nikola Franičević", address: "Poljanica Mate Pečića 1", countryCode: "HR"))
    }
}
