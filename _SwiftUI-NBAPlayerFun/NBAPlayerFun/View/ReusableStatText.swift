import SwiftUI

struct ReusableStatText: View {
    var statName: String
    var statValue: String
    
    var body: some View {
        HStack(alignment: .center){ // Alignment center is default so actualy no need to label
            Text(statName)
                .font(.system(size:45))
                .fontWeight(.bold)
                .padding(.leading, 30)
            Text(statValue)
                .font(.system(size: 45))
                .fontWeight(.light)
                .padding(.trailing, 30)
            Spacer()
        }
        .minimumScaleFactor(0.5)
    }
}

struct ReusableStatText_Previews: PreviewProvider {
    static var previews: some View {
        ReusableStatText(statName: "Age", statValue: "32") // default
    }
}
