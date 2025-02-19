//
//  UserProfileViewModel.swift
//  GithubUserSearch
//
//  Created by Hakyung Sohn on 11/14/24.
//

import SwiftUI
import Combine

final class UserProfileViewModel: ObservableObject {
    
    var loginID: String
    
    let network: NetworkService
    
    @Published var seltectedUser: UserProfile?
    
    var subscriptions = Set<AnyCancellable>()
    
    init(network: NetworkService, loginID: String) {
        self.network = network
        self.loginID = loginID
    }
    
    func search(keyword: String) {
        let resource: Resource<UserProfile> = Resource(
            base: "https://api.github.com/",
            path: "users/\(keyword)",
            params: [:],
            header: ["Content-Type": "application/json"]
        )
        
        network.load(resource)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.seltectedUser = nil
                    print("Network error : \(error)")
                case .finished: break
                }
            }, receiveValue: { userProfile in
                self.seltectedUser = userProfile
            })
            .store(in: &subscriptions)
    }
    
    var name: String {
        return seltectedUser?.name ?? "n/a"
    }
    
    var login: String {
        return seltectedUser?.login ?? "n/a"
    }
    
    var followers: String {
        guard let result = seltectedUser?.followers else { return "" }
        return "followers: \(result)"
    }
    
    var following: String {
        guard let result = seltectedUser?.following else { return "" }
        return "following: \(result)"
    }
    
    var avatarUrl: URL? {
        return seltectedUser?.avatarUrl
    }
}
