import SwiftUI

struct HomeScreen: View {
    var animation: Namespace.ID
    @EnvironmentObject var detail: DetailViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("31 January 2021")
                            .font(.custom("TTFirsNeue-DemiBold", size: 16))
                            .foregroundColor(Color("dark4"))
                        
                        Text("Today")
                            .font(.custom("TTFirsNeue-Bold", size: 40))
                            .foregroundColor(Color("light"))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        print("Go to Profile.")
                    }) {
                        Image(uiImage: #imageLiteral(resourceName: "profile"))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 32, alignment: .center)
                            .cornerRadius(16)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .padding(.bottom, 0)
                
                ForEach(items) { item in
                    if detail.show {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: 320)
                            .padding(.horizontal, 16)
                            .padding(.top, 16)
                    } else {
                        CardView(item: item,animation: animation)
                            .padding(.horizontal, 16)
                            .padding(.top, 4)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    detail.selectedItem = item
                                    detail.show.toggle()
                                }
                            }
                    }
                }
            }
            .padding(.bottom, 16)
        }
        .statusBar(hidden: true)
        .background(Color("dark").ignoresSafeArea())
    }
}
