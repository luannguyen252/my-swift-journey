//
//  PhotoDetailShowing.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 14/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import UIKit

protocol PostDetailShowing {}

extension PostDetailShowing where Self: NavigationControllerCoordinator {
    func showPostDetail(post: Post) {
        let photoDetailViewController = storyboard.instantiateViewController(identifier: "PhotoDetailViewController") { coder -> UIViewController? in
            let viewModel = DIContainer.current.assembler.resolver.resolve(PhotoDetailViewModel.self)!
            let viewController = PhotoDetailViewController(coder: coder, viewModel: viewModel)
            
            viewModel.photoName = post.imageName
            
            return viewController
        }
        
        navigationController.visibleViewController?.present(photoDetailViewController, animated: true)
    }
}
