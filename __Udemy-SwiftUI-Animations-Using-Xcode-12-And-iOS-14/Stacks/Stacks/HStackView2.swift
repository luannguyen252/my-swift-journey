import SwiftUI

struct HStackView2: View {
    var body: some View {
        Spacer(minLength: 0)
        
        HStack(alignment: .center, spacing: 16) {
            Text("HStack is .center")
                .font(.system(size: 16))
                .foregroundColor(Color("pink2"))
            
            Text("HStack is .center")
                .font(.system(size: 16))
                .foregroundColor(Color("orange"))
            
            Text("HStack is .center")
                .font(.system(size: 16))
                .foregroundColor(Color("purple"))
        }
        
        Spacer(minLength: 0)
        
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Text("HStack is .firstTextBaseline")
                .font(.system(size: 16))
                .foregroundColor(Color("pink2"))
            
            Text("HStack is .firstTextBaseline")
                .font(.system(size: 16))
                .foregroundColor(Color("orange"))
            
            Text("HStack is .firstTextBaseline")
                .font(.system(size: 16))
                .foregroundColor(Color("purple"))
        }
        
        Spacer(minLength: 0)
        
        HStack(alignment: .lastTextBaseline, spacing: 16) {
            Text("HStack is .lastTextBaseline")
                .font(.system(size: 16))
                .foregroundColor(Color("pink2"))
            
            Text("HStack is .lastTextBaseline")
                .font(.system(size: 16))
                .foregroundColor(Color("orange"))
            
            Text("HStack is .lastTextBaseline")
                .font(.system(size: 16))
                .foregroundColor(Color("purple"))
        }
        
        Spacer(minLength: 0)
    }
}

struct HStackView2_Previews: PreviewProvider {
    static var previews: some View {
        HStackView2()
    }
}
