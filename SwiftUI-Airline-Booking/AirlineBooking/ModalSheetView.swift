import SwiftUI

struct ModalSheetView: View {
    @Binding var place: String
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation(.spring()){
                    show.toggle()
                }
            }){
                Image(systemName: "xmark")
                    .font(Font.title.weight(.bold))
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Text(place)
                .fontWeight(.bold)
                .minimumScaleFactor(0.5)
                .foregroundColor(.white)
                .font(.system(size: 60))
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 10)
            {
                HStack{
                    Text(details[place]?.title ?? "")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                    
                    Spacer()
                    
                    Text(details[place]?.price ?? "")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                }
                
                Text("\(details[place]?.rating ?? "")/5")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                
                Text(details[place]?.description ?? "")
                    .foregroundColor(.white)
                    .lineLimit(3)
                
                Button(action: {
                    
                }){
                    HStack{
                        Spacer()
                        Text("BOOK NOW")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                }
                .padding()
                .background(Color("primary"))
                .buttonStyle(PlainButtonStyle())
                .clipShape(RoundedRectangle(cornerRadius: 40))
            }
            .padding(.horizontal, 30)
        }
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        .background(
            Image(place)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct Details: Identifiable {
    var id = UUID()
    var title: String
    var price: String
    var rating: String
    var description: String
}

var details = [
    "JAPAN" : Details(title: "Tokyo Trip", price: "$ 450", rating: "4.5", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae aliquam magna, in ultricies justo. Duis eget tempor lorem. Ut pretium velit sed nisi luctus, vitae mollis odio viverra. Aenean et tempor diam. Aliquam erat volutpat"),
    "MALDIVES" : Details(title: "FUVAHMULAH Trip", price: "$ 420", rating: "4.5", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae aliquam magna, in ultricies justo. Duis eget tempor lorem. Ut pretium velit sed nisi luctus, vitae mollis odio viverra. Aenean et tempor diam. Aliquam erat volutpat")
]
