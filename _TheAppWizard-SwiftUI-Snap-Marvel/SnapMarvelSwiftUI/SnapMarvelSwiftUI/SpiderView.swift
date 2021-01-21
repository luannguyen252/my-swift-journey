import SwiftUI

struct SpiderView: View {
    let des = "Spider-Man is a fictional superhero created by writer-editor Stan Lee and writer-artist Steve Ditko. "
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
                .edgesIgnoringSafeArea(.all)
            
            Image("pslogo").opacity(0.4)
                 .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("spiderman")
                    .resizable()
                    .frame(width: 600, height: 600, alignment: .center)
                    .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 400, height: 200, alignment: .center)
                        .padding(.all)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                    
                    VStack {
                        HStack {
                            Text("SPIDERMAN")
                                .font(.largeTitle)
                                .fontWeight(.regular)
                                .foregroundColor(Color.black)
                    
                            Spacer()
                                .frame(width: 70, height: 0, alignment: .center)
                    
                            Image("star")
                                .resizable()
                                .frame(width: 90, height: 20, alignment: .center)
                        }
                        
                        HStack {
                            Text(des)
                                .font(.footnote)
                                .fontWeight(.thin)
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.leading)
                                .frame(width:370, height: 80, alignment: .center)
                        }
                        
                        HStack {
                            Text("25$")
                                .font(.title3)
                                .fontWeight(.regular)
                                .foregroundColor(.black)
                            
                            Spacer()
                                .frame(width: 215, height: 0, alignment: .center)
                    
                            ZStack {
                                RoundedRectangle(cornerRadius: 25.0)
                                    .frame(width: 100, height: 40, alignment: .center)
                                    .foregroundColor(.black).opacity(0.8)
                    
                                RoundedRectangle(cornerRadius: 25.0)
                                    .frame(width: 100, height: 40, alignment: .center)
                                    .foregroundColor(.red).opacity(0.8)
                                    .shadow(color: .white, radius: 10, x: 0.0, y: 0.0)
                                
                                Text("BUY")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct SpiderView_Previews: PreviewProvider {
    static var previews: some View {
        SpiderView()
    }
}
