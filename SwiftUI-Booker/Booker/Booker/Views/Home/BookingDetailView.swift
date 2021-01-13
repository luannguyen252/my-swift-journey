import SwiftUI

struct BookingDetailView: View {
    var data: BookingData
    
    @State var editing = false
    
    var body: some View {
        ScrollView {
            NavigationLink(destination: BookView(book: data.book)) {
                HStack(alignment: .center, spacing: 0) {
                    LinkImage(self.data.book.imageURL) {
                        Image(systemName: "book")
                            .font(.largeTitle)
                    }
                    .padding()
                    
                    VStack(alignment: .leading) {
                        self.data.book.writer.map(Text.init)
                        (self.data.book.releaseDate?.dayString).map(Text.init)
                    }
                }
            }
            .frame(height: UIScreen.main.bounds.width / 16 * 9)
            .foregroundColor(.primary)
            
            Divider()
            
            ForEach([("About", data.about), ("Opinion", data.opinion), ("Reading Date", data.createDate.dayString)], id: \.0) { (head, data) in
                VStack(alignment: .leading) {
                    Text(head).font(.title)
                        .padding(.leading)
                    Text(data)
                        .padding(.leading)
                }
            }
        }
        .navigationBarItems(trailing: Button(action: {
            self.editing.toggle()
        }) { Text("Edit") })
            .sheet(isPresented: $editing) {
                NewBookingView(data: self.data, searchModel: SearchModel())
        }
    }
}

struct BookingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookingDetailView(data: TestModel().bookingDatas[3])
    }
}
