import SwiftUI

struct HStackView1: View {
    var body: some View {
        Spacer(minLength: 0)
        
        HStack(spacing: 16) {
            Image(systemName: "swift")
                .font(.system(size: 48))
                .foregroundColor(Color("pink2"))
            
            Image(systemName: "swift")
                .font(.system(size: 48))
                .foregroundColor(Color("orange"))
            
            Image(systemName: "swift")
                .font(.system(size: 48))
                .foregroundColor(Color("purple"))
        }
        
        Spacer(minLength: 0)
        
        HStack(alignment: .top, spacing: 16) {
            Text("HStack is .top")
                .font(.system(size: 16))
                .foregroundColor(Color("pink2"))
            
            Text("HStack is .top")
                .font(.system(size: 16))
                .foregroundColor(Color("orange"))
            
            Text("HStack is .top")
                .font(.system(size: 16))
                .foregroundColor(Color("purple"))
        }
        
        Spacer(minLength: 0)
        
        HStack(alignment: .bottom, spacing: 16) {
            Text("HStack is .bottom")
                .font(.system(size: 16))
                .foregroundColor(Color("pink2"))
            
            Text("HStack is .bottom")
                .font(.system(size: 16))
                .foregroundColor(Color("orange"))
            
            Text("HStack is .bottom")
                .font(.system(size: 16))
                .foregroundColor(Color("purple"))
        }
        
        Spacer(minLength: 0)
    }
}

struct HStackView1_Previews: PreviewProvider {
    static var previews: some View {
        HStackView1()
    }
}
