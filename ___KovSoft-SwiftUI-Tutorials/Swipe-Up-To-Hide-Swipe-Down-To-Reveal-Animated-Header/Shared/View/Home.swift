import SwiftUI

/// Edges
var edges = UIApplication.shared.windows.first?.safeAreaInsets

/// Rect
var rect = UIScreen.main.bounds

struct Home: View {
    @Environment(\.colorScheme) var scheme
    
    @StateObject var headerData = HeaderViewModel()
    
    init() {
        UIScrollView.appearance().bounces = false // Disabling bounces
    }
    
    var body: some View {
        ZStack(alignment: .top, content: {
            // Header View
            HeaderView()
                .zIndex(1)
                .offset(y: headerData.headerOffset)
            
            // Video View
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 16) {
                    ForEach(1...8,id: \.self) { index in
                        Image("thumb\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: rect.width - 30, height: 250)
                            .cornerRadius(16)
                        
                        HStack(spacing: 8) {
                            Image("profile")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 32, height: 32)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4, content: {
                                Text("SwiftUI - Build Apps. Less Code.")
                                    .font(.custom("TTFirsNeue-Bold", size: 18))
                                    .foregroundColor(Color(scheme == .dark ? "light" : "dark" ))
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)

                                Text("Luan Nguyen - 1 hours ago")
                                    .font(.custom("TTFirsNeue-Regular", size: 14))
                                    .foregroundColor(Color("dark4"))
                            })
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom, 16)
                    }
                }
                .padding(.top, 72)
                .overlay(
                    // Geometry Reader for getting offset values
                    GeometryReader { proxy -> Color in
                        let minY = proxy.frame(in: .global).minY

                        DispatchQueue.main.async {
                            // Storing intial minY value
                            if headerData.startMinY == 0 {
                                headerData.startMinY = minY
                            }
                            
                            // Getting exact offset value by subtracting current from start
                            let offset = headerData.startMinY - minY
                            
                            // Getting scroll direction
                            if offset > headerData.offset {
                                // If top hiding Header View, same clearing bottom offset
                                headerData.bottomScrollOffset = 0
                                
                                if headerData.topScrollOffset == 0 {
                                    // Storing intially to subtract the maxOffset
                                    headerData.topScrollOffset = offset
                                }
                                
                                let progress = (headerData.topScrollOffset + getMaxOffset()) - offset
                                
                                // All conditions were going to use ternary operator
                                // because if we use if else while swiping fast it ignore some conditions
                                let offsetCondition = (headerData.topScrollOffset + getMaxOffset()) >= getMaxOffset() && getMaxOffset() - progress <= getMaxOffset()
                                
                                let headerOffset = offsetCondition ? -(getMaxOffset() - progress) : -getMaxOffset()
                                
                                headerData.headerOffset = headerOffset
                            }
                            
                            if offset < headerData.offset {
                                // If bottom revelaing header view, clearing topscrollvalue and setting botttom
                                headerData.topScrollOffset = 0
                                
                                if headerData.bottomScrollOffset == 0 {
                                    headerData.bottomScrollOffset = offset
                                }
                                
                                // Moving if little bit of screen is swiped down, for eg 40 offset
                                withAnimation(.easeOut(duration: 0.2)) {
                                    let headerOffset = headerData.headerOffset
                                    
                                    let conditions = headerData.bottomScrollOffset > offset + 40
                                    
                                    headerData.headerOffset = conditions ? 0 : (headerOffset != -getMaxOffset() ? 0 : headerOffset)
                                }
                            }
                            
                            headerData.offset = offset
                        }
                        
                        return Color.clear
                    }
                    .frame(height: 0)
                    
                    ,alignment: .top
                )
            })
        })
        .statusBar(hidden: true)
    }
    
    // Getting max top offset including top safe area
    func getMaxOffset() -> CGFloat {
        return headerData.startMinY + (edges?.top ?? 0) + 10
    }
}

#if DEBUG
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
#endif
