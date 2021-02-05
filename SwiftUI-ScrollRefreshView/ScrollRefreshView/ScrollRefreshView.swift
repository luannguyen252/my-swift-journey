import SwiftUI

struct ScrollRefreshView<Content: View>: UIViewControllerRepresentable {
    var content: () -> Content
    let onRefresh: () -> Void
    let onScroll: (CGSize, CGRect, CGPoint) -> Void
    let onScrollWillEnd: () -> Void
    
    @Binding var isRefreshing: Bool

    init(_ isRefreshing: Binding<Bool>, onRefresh: @escaping () -> Void = {}, onScroll: @escaping (CGSize, CGRect, CGPoint) -> Void = {_,_,_  in }, onScrollWillEnd: @escaping () -> Void = {}, @ViewBuilder content: @escaping () -> Content) {
        self._isRefreshing = isRefreshing
        self.content = content
        self.onRefresh = onRefresh
        self.onScroll = onScroll
        self.onScrollWillEnd = onScrollWillEnd
    }

    func makeUIViewController(context: Context) -> ScrollRefreshViewController {
        let vc = ScrollRefreshViewController()
        vc.hostingController.rootView = AnyView(self.content())
        vc.onRefresh = self.onRefresh
        vc.startRefreshing = {
            self.isRefreshing = true
        }
        vc.onScroll = self.onScroll
        vc.onScrollWillEnd = self.onScrollWillEnd
        vc.onViewDidLoad = {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                if self._isRefreshing.wrappedValue {
                    self.onRefresh()
                }
            }
        }
        return vc
    }

    func updateUIViewController(_ viewController: ScrollRefreshViewController, context: Context) {
        viewController.hostingController.rootView = AnyView(self.content())
        if self.isRefreshing && !viewController.scrollView.refreshControl!.isRefreshing {
            viewController.scrollView.refreshControl?.beginRefreshing()
        }
        if !self.isRefreshing && viewController.scrollView.refreshControl!.isRefreshing {
            viewController.scrollView.refreshControl?.endRefreshing()
        }
    }
}

class ScrollRefreshViewController: UIViewController, UIScrollViewDelegate {
    var onRefresh: () -> Void = {}
    var onViewDidLoad: () -> Void = {}
    var startRefreshing: () -> Void = {}
    var onScroll: (CGSize, CGRect, CGPoint) -> Void = {_,_,_  in }
    var onScrollWillEnd: () -> Void = {}
    var hostingController: UIHostingController<AnyView> = UIHostingController(rootView: AnyView(EmptyView()))
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()

        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
        view.refreshControl = refreshControl
        
        return view
    }()
    
    @objc func handleRefreshControl() {
        self.onRefresh()
        self.startRefreshing()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.delegate = self
        self.view.addSubview(self.scrollView)
        self.pinEdges(of: self.scrollView, to: self.view)
        self.hostingController.willMove(toParent: self)
        self.scrollView.addSubview(self.hostingController.view)
        self.pinEdges(of: self.hostingController.view, to: self.scrollView)
        self.hostingController.didMove(toParent: self)
        self.onViewDidLoad()

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.onScroll(scrollView.contentSize, scrollView.frame,  scrollView.contentOffset)
        
        if scrollView.contentOffset.y > 0 && (scrollView.contentSize.height - scrollView.frame.height - scrollView.contentOffset.y < 100) {
            self.onScrollWillEnd()
        }
   
    }

    func pinEdges(of viewA: UIView, to viewB: UIView) {
        viewA.translatesAutoresizingMaskIntoConstraints = false
        viewB.addConstraints([
            viewA.leadingAnchor.constraint(equalTo: viewB.leadingAnchor),
            viewA.trailingAnchor.constraint(equalTo: viewB.trailingAnchor),
            viewA.topAnchor.constraint(equalTo: viewB.topAnchor),
            viewA.bottomAnchor.constraint(equalTo: viewB.bottomAnchor),
            viewA.widthAnchor.constraint(equalTo: viewB.widthAnchor)
        ])
    }
}
