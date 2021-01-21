import SwiftUI

struct LocationView: View {
    var row: [GridItem]
    var cardHeight: CGFloat
    var location = ["JAPAN", "MALDIVES", "NYC", "LONDON", "PARIS"]
    
    @State private var showModal = false
    @State private var selected = ""
    
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false){
                LazyHGrid(rows: row, spacing: 10){
                    ForEach(location, id: \.self) {loc in
                        Button(action: {
                            self.showModal = true
                            self.selected = loc
                        }){
                            VStack(alignment: .leading, spacing: 15){
                                Spacer()
                                
                                HStack{
                                    Text(loc)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                
                                    Spacer()
                                }
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                            .frame(width: 165, height: self.cardHeight)
                            .background(
                                Image(loc)
                                    .resizable()
                                    .scaledToFill()
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .shadow(color: Color.gray.opacity(0.5), radius: 5, x:0, y:2)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .sheet(isPresented: self.$showModal) {
                            ModalSheetView(place: $selected, show: $showModal)
                        }
                    }
                }
            }
        }
    }
}
