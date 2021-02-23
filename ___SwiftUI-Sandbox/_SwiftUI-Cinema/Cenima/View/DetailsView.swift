
import SwiftUI
import Kingfisher
struct DetailsView: View {
    
    var data : CustomObject
    @ObservedObject var dashboardVM : DashboardViewModel
    var imageView = UIImageView()
    @Environment(\.presentationMode) var presentationMode
    
    init(data : CustomObject, dashboardVM : DashboardViewModel) {
        self.data = data
        self.dashboardVM = dashboardVM
        self.imageView.kf.setImage(with: URL(string: Utils.urlForImage + data.posterPath!))
        
    }
    
    var body: some View {
        ZStack{
          
            VStack{
                

                Image(uiImage: imageView.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height / 1.2), alignment: .top)
                
                
                Spacer()
            }
            
            VStack(alignment : .leading){
                HStack{
                Button(action : {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "arrow.backward")
                        .font(.system(size: 24, weight: .semibold, design: .default))
                        .foregroundColor(.blue)
                        .shadow(color: Color.white.opacity(0.6), radius: 6, x: 0.0, y: 0.0)
                        .padding()
                        .padding(.top, 8)
                }
                
                    Spacer()
                    Button(action : {
                        dashboardVM.writeToPhotoAlbum(image: imageView.image!)
                    }){
                        Image(systemName: "arrow.down.circle")
                            .font(.system(size: 26, weight: .semibold, design: .default))
                            .foregroundColor(.blue)
                            .padding()
                            .padding(.top, 8)
                            .shadow(color: Color.white.opacity(0.6), radius: 6, x: 0.0, y: 0.0)
                    }
                }
                Spacer()
            }
            .padding(.top, 8)
            
            VStack{
                Spacer()
                VStack{
                    VStack(alignment : .leading, spacing : 8){
                        Text("\(data.title ?? "Title not available")")
                            .font(.system(size: 32, weight: .bold, design: .default))
                        Text("\(dashboardVM.decodeTheGenre(genre_Id: data.genre_ids!))")
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .foregroundColor(Color.black.opacity(0.5))
                        Text("\(data.releaseDate!)")
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .foregroundColor(Color.black.opacity(0.5))
                        Text("\(data.overview!)")
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .lineSpacing(4)
                            .foregroundColor(Color.black.opacity(0.7))
                            .padding(.top, 4)
                        
                        HStack{
                            Button(action : {}){
                            Text("BUY TICKET")
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                
                                .padding(.horizontal, 32)
                                .frame(width: nil, height: 46, alignment: .center)
                                .background(Color.black)
                                .foregroundColor(Color.white)
                                .cornerRadius(16)
                                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0.0, y: 0.0)
                        }
                      
                            Spacer()
                            ProgressBar(arcAngle: dashboardVM.getTheAcrForProgressBar(data : data), rating: "\(data.voteAverage ?? "0.0")",size: 40)
                            
                        }
                        .padding(.top, 16)
                        .padding(.trailing, 16)
                        
                    }.padding(16)
                }.padding()
                .frame(width: UIScreen.main.bounds.width, height: nil, alignment: .topLeading)
                .background(Color.white)
                .cornerRadius(50, corners: [.topLeft, .topRight])
                
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0.0, y: 0.0)
            }.frame(minHeight: 0, maxHeight: UIScreen.main.bounds.height - 200, alignment: .top)
            .offset(x: 0, y: 100)
            
            
        }
        .alert(isPresented: $dashboardVM.imageSaved) {
                    Alert(title: Text("Image Saved"), message: Text("Image for this movie is saved in your photos"), dismissButton: .default(Text("Ok")))
                }
        .ignoresSafeArea()
    }
}


struct ProgressBar : View{
    
    @State var arcAngle : CGFloat
    @State var rating : String
    @State var size : CGFloat
    
    var body: some View{
        ZStack{
        RoundedRectangle(cornerRadius: size/2)
            .trim(from: arcAngle, to: 1)
                .stroke(
                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading),
                        style: StrokeStyle(lineWidth: 5, lineCap: .round)
                )
            .rotationEffect(Angle(degrees: 90))
            .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
            .shadow(color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 3, x: 0, y: 3)
            .frame(width: size, height: size)
            
            
            RoundedRectangle(cornerRadius: size/2)
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5))
                .frame(width: size, height: size)
            
            Text("\(rating)")
                    .font(.subheadline)
                    .fontWeight(.bold)
            
        }
    }
}



