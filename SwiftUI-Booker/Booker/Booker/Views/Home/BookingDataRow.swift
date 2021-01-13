import SwiftUI

struct BookingDataRow: View {
    var data: BookingData
    
    var body: some View {
        HStack(alignment: .center) {
            LinkImage(data.book.imageURL) {
                Image(systemName: "book").font(.title)
            }
            .padding(5)
            .frame(width: 60, height: 60)
            
            VStack(alignment: .leading) {
                Text(data.book.name)
                    .font(.body)
                    .lineLimit(1)
                Text(data.about)
                    .font(.callout)
                    .lineLimit(1)
            }
            Spacer()
            if data.readAgain {
                Image(systemName: "checkmark")
            }
        }.padding(.trailing, 15)
    }
}

struct BookingDataRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BookingDataRow(data: TestModel().bookingDatas[0])
            BookingDataRow(data: TestModel().bookingDatas[1])
            // BookingDataRow(data: TestModel().bookingDatas[2])
        }
        .previewLayout(.fixed(width: 375, height: 60))
    }
}
