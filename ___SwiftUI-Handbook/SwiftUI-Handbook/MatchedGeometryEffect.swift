import SwiftUI

/// Namespace
/* @Namespace var namespace
 @State var show = false */

// Transition Between Two Views
/*
 ZStack {
     if !show {
         Rectangle()
             .matchedGeometryEffect(id: "shape", in: namespace)
             .frame(width: 100, height: 100)
     } else {
         Rectangle()
             .matchedGeometryEffect(id: "shape", in: namespace)
             .frame(maxWidth: .infinity, maxHeight: 400)
     }
 }
 .onTapGesture {
     withAnimation {
         show.toggle()
     }
 }
 */

// Flexibility with Layout
/*
 ScrollView {
     HStack {
         Rectangle()
             .matchedGeometryEffect(id: "shape", in: namespace)
             .frame(width: 100, height: 100)
         Rectangle()
             .frame(width: 100, height: 100)
         Spacer()
     }
     .padding()
 }
 */

// Elements vs Containers
/*
 VStack {
     Text("Title").foregroundColor(.white)
         .matchedGeometryEffect(id: "title", in: namespace)
 }
 .frame(width: 100, height: 100)
 .background(
     Rectangle().matchedGeometryEffect(id: "shape", in: namespace)
 )
 */

struct MatchedGeometryEffect: View {
    @State var show = false
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            if !show {
                ScrollView {
                    HStack {
                        VStack {
                            Text("Title").foregroundColor(.white)
                                .matchedGeometryEffect(id: "title", in: namespace)
                        }
                        .frame(width: 100, height: 100)
                        .background(
                            Rectangle().matchedGeometryEffect(id: "shape", in: namespace)
                        )
                        Rectangle()
                            .frame(width: 100, height: 100)
                        Spacer()
                    }
                    .padding(8)
                }
            } else {
                VStack {
                    Text("Title").foregroundColor(.white)
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: 400)
                .background(
                    Rectangle().matchedGeometryEffect(id: "shape", in: namespace)
                )
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                show.toggle()
            }
        }
    }
}

#if DEBUG
struct MatchedGeometryEffect_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffect()
    }
}
#endif
