//
//  ProfileViewModel.swift
//  Devui
//
//  Created by Emilio Schepis on 15/11/20.
//

import Foundation
import Resolver
import Combine

class ProfileViewModel: ObservableObject {
    struct ProfileDataViewModel {
        private let profile: Profile
        
        var username: String { profile.username }
        var summary: String { profile.summary }
        var imageURL: URL { URL(string: profile.profileImage)! }
        
        init(_ profile: Profile) {
            self.profile = profile
        }
    }
    
    @Injected private var auth: AuthService
    @Injected private var network: NetworkService
    
    @Published var profile: ProfileDataViewModel?
    @Published var loading = true
    @Published var error: NetworkService.NetworkError?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getProfile()
    }
    
    func signOut() {
        auth.removeAPIKey()
    }
    
    private func getProfile() {
        loading = true
        error = nil
        
        network.getProfile()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.loading = false
                
                if case let .failure(error) = completion {
                    self.error = error
                }
            }, receiveValue: { profile in
                self.loading = false
                self.profile = ProfileDataViewModel(profile)
            })
            .store(in: &cancellables)
    }
}
