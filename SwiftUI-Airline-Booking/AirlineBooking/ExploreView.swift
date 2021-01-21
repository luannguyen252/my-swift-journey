import SwiftUI

struct ExploreView: View {
    var column = [GridItem(.flexible()), GridItem(.flexible())]
    var explore = ["CULTURE", "ARCHITECTURE", "ESTHETIC", "SCENERY"]
    
    var body: some View {
        LazyVGrid(columns: column, spacing: 15){
            ForEach(explore, id: \.self){exp in
                VStack(spacing: 15){
                    HStack{
                        Spacer()
                        
                        Text(exp)
                            .font(.custom("Helvetica Neue", size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                        
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                .frame(height:116)
                .background(
                    Image(exp)
                        .resizable()
                )
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .shadow(color: Color.gray.opacity(0.5), radius: 5, x:0, y:2)
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
