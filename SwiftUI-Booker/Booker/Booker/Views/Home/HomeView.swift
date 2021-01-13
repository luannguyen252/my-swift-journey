import SwiftUI
import Combine

struct HomeView<ObservableModel: ModelProtocol>: View {
    @State var newIsPresented = false
    @ObservedObject var model: ObservableModel
    
    var body: some View {
        NavigationView {
            List(model.bookingDatas.sorted(by: >)) { data in
                NavigationLink(destination:
                    BookingDetailView(data: data)
                        .navigationBarTitle(data.book.name)
                ) {
                    BookingDataRow(data: data)
                }
            }
            .navigationBarTitle("Booker")
            .navigationBarItems(trailing: Button(action: {
                self.newIsPresented.toggle()
            }) {
                Image(systemName: "square.and.pencil").imageScale(.large)
            })
            .sheet(isPresented: $newIsPresented, onDismiss: nil) {
                NewBookingView(searchModel: SearchModel())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(model: TestModel())
    }
}
