import SwiftUI

// Were going to create our own View by using View Builders
struct ScrollableTabBar<Content: View>: UIViewRepresentable {
    // To store our SwiftUI View
    var content: Content
    
    // Getting rect to calculate width and height of ScrollView
    var rect: CGRect
    
    // ContentOffset
    @Binding var offset: CGFloat

    // Tabs
    var tabs: [Any]
    
    // ScrollView for paging AKA scrollable tabs
    let scrollView = UIScrollView()
    
    init(tabs: [Any], rect: CGRect, offset: Binding<CGFloat>, @ViewBuilder content: () -> Content) {
        self.content = content()
        self._offset = offset
        self.rect = rect
        self.tabs = tabs
    }
    
    func makeCoordinator() -> Coordinator {
        return ScrollableTabBar.Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) ->  UIScrollView {
        setUpScrollView()
        scrollView.contentSize = CGSize(width: rect.width * CGFloat(tabs.count), height: rect.height) // Setting Content Size
        scrollView.addSubview(extractView())
        scrollView.delegate = context.coordinator
        
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        // Updating View
        if uiView.contentOffset.x != offset {
            // Animating, the animation glitch is because it's updating on two times
            uiView.delegate = nil // Removing delegate while animating
            
            UIView.animate(withDuration: 0.4) {
                uiView.contentOffset.x = offset
            } completion: { (status) in
                if status{uiView.delegate = context.coordinator}
            }
        }
    }
    
    // Setting up ScrollView
    func setUpScrollView() {
        scrollView.isPagingEnabled                  = true
        scrollView.bounces                          = false
        scrollView.showsVerticalScrollIndicator     = false
        scrollView.showsHorizontalScrollIndicator   = false
    }
    
    // Extracting SwiftUI View
    func extractView() -> UIView {
        // Since it depends upon tab size, so we getting tabs also
        let controller = UIHostingController(rootView: content)
        controller.view.frame = CGRect(x: 0, y: 0, width: rect.width * CGFloat(tabs.count), height: rect.height)
        
        return controller.view!
    }
    
    // Delegate function to get offset
    class Coordinator: NSObject, UIScrollViewDelegate {
        var parent: ScrollableTabBar
        
        init(parent: ScrollableTabBar) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            parent.offset = scrollView.contentOffset.x
        }
    }
}

#if DEBUG
struct ScrollableTabBar_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
#endif
