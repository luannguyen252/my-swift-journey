//   | @BigMtnStudio

import SwiftUI

struct TrianglesMask: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.themeBackground
                .edgesIgnoringSafeArea(.all)
            
            Image("pattern")
                .clipShape(Triangle())
                .scaleEffect(y: -1)
                .edgesIgnoringSafeArea(.top)
                .shadow(radius: 5, y: 10)
                .frame(height: 500)
            
            VStack {
                Spacer()
                
                Triangle(xOffset: 1)
                    .fill(Color.themeTertiary)
                    .frame(height: 500)
                    .shadow(radius: 5, y: -10)
                    .overlay(
                        Text("You can use this shape as a footer as well.")
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                            .frame(width: 300.0),
                        alignment: .bottom)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .foregroundColor(.themeForeground)
        .navigationTitle("Masking Triangle")
    }
}

struct TrianglesMask_Previews: PreviewProvider {
    static var previews: some View {
        TrianglesMask()
    }
}
