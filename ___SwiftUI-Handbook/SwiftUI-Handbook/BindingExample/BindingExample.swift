import SwiftUI

struct BindingExample: View {
    @Binding var show: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(Color.blue)
            .padding()
            .onTapGesture {
                withAnimation(.spring()) {
                    show.toggle()
                }
            }
    }
}

#if DEBUG
struct BindingExample_Previews: PreviewProvider {
    static var previews: some View {
        BindingExample(show: .constant(true))
    }
}
#endif
