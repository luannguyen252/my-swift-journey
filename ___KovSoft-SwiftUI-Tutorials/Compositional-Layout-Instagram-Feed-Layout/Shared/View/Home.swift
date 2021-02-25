import SwiftUI

struct Home: View {
    @StateObject var jsonModel = JSONViewModel()
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    TextField("Enter your photo name", text: $jsonModel.search)
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 8)
                .background(Color.primary.opacity(0.06))
                .cornerRadius(8)
                
                Button(action: {
                    print("Go to Profile Page.")
                }, label: {
                    Image(uiImage: #imageLiteral(resourceName: "profile"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32, height: 32, alignment: .center)
                        .cornerRadius(16)
                })
            }
            .padding(.top, 16)
            .padding(.bottom, 8)
            .padding(.horizontal, 16)
            
            if jsonModel.cards.isEmpty {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ScrollView {
                    // Compositional Layout
                    VStack(spacing: 4) {
                        ForEach(jsonModel.compositionalArray.indices, id: \.self) { index in
                            // Basic Logic For Mixing Layouts
                            if index == 0 || index % 6 == 0 {
                                Layout1(cards: jsonModel.compositionalArray[index])
                            } else if index % 3 == 0 {
                                Layout3(cards: jsonModel.compositionalArray[index])
                            } else {
                                Layout2(cards: jsonModel.compositionalArray[index])
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
