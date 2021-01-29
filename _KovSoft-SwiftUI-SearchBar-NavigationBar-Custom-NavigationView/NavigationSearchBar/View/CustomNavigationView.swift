import SwiftUI

struct CustomNavigationView: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        return CustomNavigationView.Coordinator(parent: self)
    }
    
    // Just Change Your View That Requires Search Bar
    var view: AnyView
    
    // Ease Of Use
    var largeTitle: Bool
    var title: String
    var placeHolder: String
    
    // onSearch And OnCancel Closures
    var onSearch: (String)->()
    var onCancel: ()->()
    
    // Require Closure On Call
    init(view: AnyView,
         placeHolder: String? = "Search Apps or Games",
         largeTitle: Bool? = true,
         title: String,
         onSearch: @escaping (String)->(),
         onCancel: @escaping ()->()) {
        self.title = title
        self.largeTitle = largeTitle!
        self.placeHolder = placeHolder!
        self.view = view
        self.onSearch = onSearch
        self.onCancel = onCancel
    }
    
    // Integrating UIKit Navigation Controller With SwiftUI View
    func makeUIViewController(context: Context) -> UINavigationController {
        // Requires SwiftUI View
        let childView = UIHostingController(rootView: view)
        let controller = UINavigationController(rootViewController: childView)
        
        // Nav Bar Data
        controller.navigationBar.topItem?.title = title
        controller.navigationBar.prefersLargeTitles = largeTitle
        
        // Search Bar
        let searchController = UISearchController()
        searchController.searchBar.placeholder = placeHolder
        
        // Setting Delegate
        searchController.searchBar.delegate = context.coordinator
        
        // Setting Search Bar In NavBar
        // Disabling Hide On Scroll
        // Disabling Dim background
        searchController.obscuresBackgroundDuringPresentation = false
        
        controller.navigationBar.topItem?.hidesSearchBarWhenScrolling = false
        controller.navigationBar.topItem?.searchController = searchController
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // Updating Real Time
        uiViewController.navigationBar.topItem?.title = title
        uiViewController.navigationBar.topItem?.searchController?.searchBar.placeholder = placeHolder
        uiViewController.navigationBar.prefersLargeTitles = largeTitle
    }
    
    // Search Bar Delegate
    class Coordinator: NSObject,UISearchBarDelegate {
        var parent: CustomNavigationView
        
        init(parent: CustomNavigationView) {
            self.parent = parent
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            // When Text Changes
            self.parent.onSearch(searchText)
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            // When Cancel button Is Clicked
            self.parent.onCancel()
        }
    }
}
