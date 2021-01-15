

import SwiftUI


struct SingleRowView: View {
    
    var pet: PetModel
    
    var body: some View {
        HStack {
            
            Image(pet.imageName)
                .resizable()
                .frame(width: 96, height: 96)
                .mask(Capsule(style: .continuous))
                
            VStack(alignment: .leading, spacing: 2) {
                
                Text(pet.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                
                Text(pet.type)
                    .font(.body)
                    .foregroundColor(.secondary)
                
            }
            .padding()
            
        }
    }
    
}


struct SingleRowView_Previews: PreviewProvider {
    static var previews: some View {

        Group {
            SingleRowView(pet: PetModel.cat3)
                .previewLayout(.sizeThatFits)

            SingleRowView(pet: PetModel.cat2)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)

            SingleRowView(pet: PetModel.cat1)
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
                .previewLayout(.sizeThatFits)

        }

    }
}
