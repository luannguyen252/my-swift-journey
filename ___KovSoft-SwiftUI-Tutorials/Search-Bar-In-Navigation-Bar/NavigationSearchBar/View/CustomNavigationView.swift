//
//  CustomNavigationView.swift
//  NavigationSearchBar
//
//  Created by Balaji on 29/11/20.
//

import SwiftUI

struct CustomNavigationView: UIViewControllerRepresentable {
    
    
    func makeCoordinator() -> Coordinator {
        return CustomNavigationView.Coordinator(parent: self)
    }
    
    // Just Change Your View That Requires Search Bar...
    var view: AnyView
    
    // Ease Of Use.....
    
    var largeTitle: Bool
    var title: String
    var placeHolder: String
    
    // onSearch And OnCancel Closures....
    var onSearch: (String)->()
    var onCancel: ()->()
    
    // requre closure on Call...
    
    init(view: AnyView,placeHolder: String? = "Search",largeTitle: Bool? = true,title: String,onSearch: @escaping (String)->(),onCancel: @escaping ()->()) {
      
        self.title = title
        self.largeTitle = largeTitle!
        self.placeHolder = placeHolder!
        self.view = view
        self.onSearch = onSearch
        self.onCancel = onCancel
    }
    
    // Integrating UIKit Navigation Controller With SwiftUI View...
    func makeUIViewController(context: Context) -> UINavigationController {
        
        // requires SwiftUI View...
        let childView = UIHostingController(rootView: view)
        
        let controller = UINavigationController(rootViewController: childView)
        
        // Nav Bar Data...
        
        controller.navigationBar.topItem?.title = title
        controller.navigationBar.prefersLargeTitles = largeTitle
        
        // search Bar....
        
        let searchController = UISearchController()
        searchController.searchBar.placeholder = placeHolder
        
        // setting delegate...
        searchController.searchBar.delegate = context.coordinator
        
        // setting Search Bar In NavBar...
        // disabling hide on scroll...
        
        // disabling dim bg..
        searchController.obscuresBackgroundDuringPresentation = false
        
        controller.navigationBar.topItem?.hidesSearchBarWhenScrolling = false
        controller.navigationBar.topItem?.searchController = searchController
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        
        // Updating Real Time...
        uiViewController.navigationBar.topItem?.title = title
        uiViewController.navigationBar.topItem?.searchController?.searchBar.placeholder = placeHolder
        uiViewController.navigationBar.prefersLargeTitles = largeTitle
    }
    
    // search Bar Delegate...
    
    class Coordinator: NSObject,UISearchBarDelegate{
        
        var parent: CustomNavigationView
        
        init(parent: CustomNavigationView) {
            self.parent = parent
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            // when text changes....
            self.parent.onSearch(searchText)
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            // when cancel button is clicked...
            self.parent.onCancel()
        }
    }
}
