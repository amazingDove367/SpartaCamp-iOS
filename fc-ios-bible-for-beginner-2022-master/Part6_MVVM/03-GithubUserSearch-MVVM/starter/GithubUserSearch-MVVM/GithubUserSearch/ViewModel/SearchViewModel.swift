//
//  SearchViewModel.swift
//  GithubUserSearch
//
//  Created by Hakyung Sohn on 10/30/24.
//

import Foundation
import Combine

final class SearchViewModel {
    
    let network: NetworkService
    var subscriptions = Set<AnyCancellable>()
    
    init(network: NetworkService) {
        self.network = network
    }
    
    // Data -> Output
//    @Published private(set) var users = [SearchResult]()
    var users = CurrentValueSubject<[SearchResult], Never>([])
    
    // User Action -> Input
    func search(keyword: String) {
        let resource: Resource<SearchUserResponse> = Resource(
            base: "https://api.github.com/",
            path: "search/users",
            params: ["q": keyword],
            header: ["Content-Type": "application/json"]
        )
        
        network.load(resource)
            .map { $0.items }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.users.value, on: self)
            .store(in: &subscriptions)
    }
}
