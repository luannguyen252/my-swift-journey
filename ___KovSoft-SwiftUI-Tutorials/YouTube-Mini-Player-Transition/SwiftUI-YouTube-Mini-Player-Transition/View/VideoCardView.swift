import SwiftUI

struct VideoCardView: View {
    var video: Video
    
    var body: some View {
        VStack(spacing: 16) {
            Image(video.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 264)
            
            HStack(spacing: 16) {
                Image(uiImage: #imageLiteral(resourceName: "profile"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .cornerRadius(20)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(video.title)
                        .font(.system(size: 24, weight: .heavy, design: .default))
                        .foregroundColor(Color("dark"))
                    
                    HStack {
                        Text(video.author)
                            .font(.system(size: 16, weight: .regular, design: .default))
                        
                        Text("\(video.views, specifier: "%.3f") views - \(video.date)")
                            .font(.system(size: 14, weight: .regular, design: .default))
                    }
                    .foregroundColor(Color("dark3"))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.horizontal, 16)
    }
}

struct VideoCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
