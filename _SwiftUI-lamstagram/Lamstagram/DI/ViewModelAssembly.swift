//
//  ViewModelAssembly.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 14/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import Swinject

// swiftlint:disable force_unwrapping
final class ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(FeedViewModel.self) { resolver in
            FeedViewModel(
                postService: resolver.resolve(PostServicing.self)!
            )
        }

        container.register(ProfileViewModel.self) { resolver in
            ProfileViewModel(
                userService: resolver.resolve(UserServicing.self)!
            )
        }
        
        container.register(PhotoDetailViewModel.self) { resolver in
            PhotoDetailViewModel()
        }
    }
}
