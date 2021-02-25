import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

// Home
struct Home: View {
    @State var maxHeight: CGFloat = UIScreen.main.bounds.height / 3

    // Slider Properties
    @State var sliderProgress: CGFloat = 0
    @State var sliderHeight: CGFloat = 0
    @State var lastDragValue: CGFloat = 0
    
    var body: some View {
        NavigationView {
            VStack {
                // Slider
                ZStack(alignment: .bottom, content: {
                    Rectangle()
                        .fill(Color("slider").opacity(0.15))
                        
                    Rectangle()
                        .fill(Color("slider"))
                        .frame(height: sliderHeight)
                })
                .frame(width: 100, height: maxHeight)
                .cornerRadius(35)
                // Container
                .overlay(
                    Text("\(Int(sliderProgress * 100))%")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.vertical,10)
                        .padding(.horizontal,18)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.vertical,30)
                        .offset(y: sliderHeight < maxHeight - 105 ? -sliderHeight : -maxHeight + 105), alignment: .bottom
                )
                .gesture(DragGesture(minimumDistance: 0).onChanged({ (value) in
                    // Getting drag value
                    let translation = value.translation
                    
                    // Limiting slider height value
                    sliderHeight = -translation.height + lastDragValue
                    sliderHeight = sliderHeight > maxHeight ? maxHeight : sliderHeight
                    sliderHeight = sliderHeight >= 0 ? sliderHeight : 0
                    
                    // Updating progress
                    let progress = sliderHeight / maxHeight

                    sliderProgress = progress <= 1.0 ? progress : 1
                }).onEnded({ (value) in
                    // Storing last drag value for restoration
                    sliderHeight = sliderHeight > maxHeight ? maxHeight : sliderHeight

                    // Negative height
                    sliderHeight = sliderHeight >= 0 ? sliderHeight : 0
                    lastDragValue = sliderHeight
                }))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("bg").ignoresSafeArea())
            .preferredColorScheme(.dark)
            .navigationTitle("Dashboard")
        }
    }
}
