import SwiftUI

struct RatingView: View {
    var rating: String
    
    var body: some View {
        switch rating {
         case "Today":
            return Image(systemName: "star.circle.fill")
        case "Someday":
            return Image(systemName: "calendar.circle.fill")
        case "Important":
            return Image(systemName: "exclamationmark.triangle.fill")
        default:
            return Image(systemName: "square.stack.3d.up.fill")
        }
    }
    
    init(for rating: String){
        self.rating = rating
    }

}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(for: "Today")
    }
}
