import SwiftUI

struct VStackView: View {
    var body: some View {
        Spacer(minLength: 0)
        
        VStack(spacing: 16) {
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
        
        VStack(alignment: .leading, spacing: 16) {
            Text("VStack have alignment is .leading")
                .font(.system(size: 16))
                .foregroundColor(Color("pink2"))
            
            Text("VStack have alignment .leading")
                .font(.system(size: 16))
                .foregroundColor(Color("orange"))
            
            Text("VStack have .leading")
                .font(.system(size: 16))
                .foregroundColor(Color("purple"))
        }
        
        Spacer(minLength: 0)
        
        VStack(alignment: .center, spacing: 16) {
            Text("VStack have alignment is .center")
                .font(.system(size: 16))
                .foregroundColor(Color("pink2"))
            
            Text("VStack have alignment .center")
                .font(.system(size: 16))
                .foregroundColor(Color("orange"))
            
            Text("VStack have .center")
                .font(.system(size: 16))
                .foregroundColor(Color("purple"))
        }
        
        Spacer(minLength: 0)
        
        VStack(alignment: .trailing, spacing: 16) {
            Text("VStack have alignment is .trailing")
                .font(.system(size: 16))
                .foregroundColor(Color("pink2"))
            
            Text("VStack have alignment .trailing")
                .font(.system(size: 16))
                .foregroundColor(Color("orange"))
            
            Text("VStack have .trailing")
                .font(.system(size: 16))
                .foregroundColor(Color("purple"))
        }
        
        Spacer(minLength: 0)
    }
}

struct VStackView_Previews: PreviewProvider {
    static var previews: some View {
        VStackView()
    }
}
