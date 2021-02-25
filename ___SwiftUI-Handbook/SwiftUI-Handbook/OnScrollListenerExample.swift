import SwiftUI
import SwiftUITrackableScrollView

/// https://github.com/maxnatchanon/trackable-scroll-view.git

struct OnScrollListenerExample: View {
    @State private var scrollViewContentOffset = CGFloat(0)
    
    var body: some View {
        TrackableScrollView(.vertical, showIndicators: false, contentOffset: $scrollViewContentOffset) {
            Text("\(scrollViewContentOffset)")
        }
        .onChange(of: scrollViewContentOffset, perform: { value in
                print("scrollViewContentOffset", scrollViewContentOffset)
                // Do something
        })
    }
}

#if DEBUG
struct OnScrollListenerExample_Previews: PreviewProvider {
    static var previews: some View {
        OnScrollListenerExample()
    }
}
#endif
