import SwiftUI

struct MovingComments: View {
    var body: some View{
        
        VStack(spacing: 30) {
            HStack(alignment: .top) {
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30, alignment: .center)
                    .clipShape(Circle())
                
                Color(#colorLiteral(red: 0.862745098, green: 0.9294117647, blue: 1, alpha: 1))
                    .frame(width: 193, height: 50)
                    .cornerRadius(26)
                    .overlay(
                        Rectangle()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color(#colorLiteral(red: 0.862745098, green: 0.9294117647, blue: 1, alpha: 1)) )
                            .offset(x: 84, y: -12.5))
                    .overlay(VStack(alignment: .leading) {
                        Text("Luan Nguyen")
                            .fontWeight(.bold)
                        Text("This is awesome!")
                }
                .font(.caption)
                .foregroundColor(Color(#colorLiteral(red: 0.4666666667, green: 0.4666666667, blue: 0.4666666667, alpha: 1))))
            }
            
            HStack(alignment: .top) {
                
                Image("logo")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                
                Color(#colorLiteral(red: 0.862745098, green: 0.9294117647, blue: 1, alpha: 1))  // Color as a view
                    .frame(width: 193, height: 50)
                    .cornerRadius(26)
                    // Custom message bubble
                    .overlay(
                        Rectangle()
                            .frame(width: 25, height: 25)
                            .foregroundColor( Color(#colorLiteral(red: 0.862745098, green: 0.9294117647, blue: 1, alpha: 1)) )
                            .offset(x: 84, y: -12.5))
                    .overlay(VStack(alignment: .leading) {
                        Text("Steve")
                            .fontWeight(.bold)
                        Text("SwiftUI is AWESOME!")
                }
                .font(.caption)
                .foregroundColor(Color(#colorLiteral(red: 0.4666666667, green: 0.4666666667, blue: 0.4666666667, alpha: 1))))
            }
            
            HStack(alignment: .top) {
                Image("andras_profile")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)

                Color(#colorLiteral(red: 0.862745098, green: 0.9294117647, blue: 1, alpha: 1))  // Color as a view
                    .frame(width: 193, height: 50)
                    .cornerRadius(26)
                    // Custom message bubble
                    .overlay(
                        Rectangle()
                            .frame(width: 25, height: 25)
                            .foregroundColor( Color(#colorLiteral(red: 0.862745098, green: 0.9294117647, blue: 1, alpha: 1)) )
                            .offset(x: 84, y: -12.5))
                    .overlay(VStack(alignment: .leading) {
                        Text("Cook")
                            .fontWeight(.bold)
                        Text("Thank you, SwiftUI~")
                }
                .font(.caption)
                .foregroundColor(Color(#colorLiteral(red: 0.4666666667, green: 0.4666666667, blue: 0.4666666667, alpha: 1))))
            }
            
            HStack(alignment: .top) {
                Image(systemName: "b.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.3803921569, blue: 0.3803921569, alpha: 1)))

                Color(#colorLiteral(red: 0.862745098, green: 0.9294117647, blue: 1, alpha: 1))  // Color as a view
                    .frame(width: 193, height: 50)
                    .cornerRadius(26)
                    // Custom message bubble
                    .overlay(
                        Rectangle()
                            .frame(width: 25, height: 25)
                            .foregroundColor( Color(#colorLiteral(red: 0.862745098, green: 0.9294117647, blue: 1, alpha: 1)) )
                            .offset(x: 84, y: -12.5))
                    .overlay(VStack(alignment: .leading) {
                        Text("Bill")
                            .fontWeight(.bold)
                        Text("Hello, SwiftUI!")
                }
                .font(.caption)
                .foregroundColor(Color(#colorLiteral(red: 0.4666666667, green: 0.4666666667, blue: 0.4666666667, alpha: 1))))
            }
            
            HStack(alignment: .top) {
                Image(systemName: "c.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 1, alpha: 1)))
                
                Color(#colorLiteral(red: 0.862745098, green: 0.9294117647, blue: 1, alpha: 1))  // Color as a view
                    .frame(width: 193, height: 50)
                    .cornerRadius(26)
                    // Custom message bubble
                    .overlay(
                        Rectangle()
                            .frame(width: 25, height: 25)
                            .foregroundColor( Color(#colorLiteral(red: 0.862745098, green: 0.9294117647, blue: 1, alpha: 1)) )
                            .offset(x: 84, y: -12.5))
                    .overlay(VStack(alignment: .leading) {
                        Text("Collins")
                            .fontWeight(.bold)
                        Text("Take me there next time!!")
                }
                .font(.caption)
                .foregroundColor(Color(#colorLiteral(red: 0.4666666667, green: 0.4666666667, blue: 0.4666666667, alpha: 1))))
            }
        } // Container for all views
    }
}

#if DEBUG
struct MovingComments_Previews: PreviewProvider {
    static var previews: some View {
        MovingComments()
            .preferredColorScheme(.dark)
    }
}
#endif
