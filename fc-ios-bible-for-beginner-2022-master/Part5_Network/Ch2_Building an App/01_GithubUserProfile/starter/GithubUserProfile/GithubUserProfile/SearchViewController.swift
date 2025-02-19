//
//  SearchViewController.swift
//  GithubUserSearch
//
//  Created by joonwon lee on 2022/05/25.
//

import UIKit
import Combine
import Kingfisher

class UserProfileViewController: UIViewController {
    
    @Published private(set) var user: UserProfile?
    
    var subscriptions = Set<AnyCancellable>()
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bind()
        searchControl()
    }
    
    private func setUI() {
        self.thumbnail.layer.cornerRadius = self.thumbnail.layer.bounds.width / 2
    }
    
    private func searchControl() {
        self.navigationItem.title = "Search"
        
        var searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "hortenssiaa"
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
    
    private func bind() {
        $user
            .receive(on: RunLoop.main)
            .sink { [unowned self] profile in
                // update
                self.update(profile)
            }.store(in: &subscriptions)
    }
    
    private func update(_ user: UserProfile?) {
        // $user에 넣어진 데이터지만, error check 해야함
        guard let user = user else {
            self.nameLabel.text = "n/a"
            self.loginLabel.text = "n/a"
            self.followerLabel.text = ""
            self.followingLabel.text = ""
            self.thumbnail.image = nil
            return
        }
        
        self.nameLabel.text = user.name
        self.loginLabel.text = user.login
        self.followerLabel.text = "follower: \(user.followers)"
        self.followingLabel.text = "following: \(user.following)"
        self.thumbnail.kf.setImage(with: user.avatarUrl)
    }
}

extension UserProfileViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let keyword = searchController.searchBar.text
        print("updating: \(keyword)")
    }
}

extension UserProfileViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("[Button clicked] \(searchBar.text)")
        
        // searchBar.text 가 nil 이 아니고, keyword가 not empty일 때
        guard let keyword = searchBar.text, !keyword.isEmpty else { return }
        
        /*
        // Network Connect 방법 1
        // [REFECTORING (1~5) - Resource]
        // 1
        let base = "https://api.github.com/"
        let path = "users/\(keyword)"
        let params: [String:String] = [:]
        let header: [String:String] = ["Content-Type": "application/json"]
        
        // 2
        var urlComponent = URLComponents(string: base + path)!
        // 3
        let queryItems = params.map { (key: String, value: String) in
            return URLQueryItem(name: key, value: value)
        }
        urlComponent.queryItems = queryItems
        
        // 4
        var request = URLRequest(url: urlComponent.url!)
        // 5
        header.forEach { (key: String, value: String) in
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        // [REFECTORING (6) - NetworkService]
        // 6
        URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { (data: Data, response: URLResponse) -> Data in // error 처리 : tryMap
                guard let response  = response as? HTTPURLResponse,
                      (200..<300).contains(response.statusCode) else {
                    let response = response as? HTTPURLResponse
                    let statusCode = response?.statusCode ?? -1
                    throw NetworkError.responseError(statusCode: statusCode)
                }
                return data
            }
            .decode(type: UserProfile.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.user = nil
                case .finished: break
                }

            } receiveValue: { user in
                self.user = user
            }.store(in: &subscriptions)
        */
        
        /// [REFACTORING]
        /// Network Connect 방법 2
        /// network연결에 필요한 resources ( url 등등)를 load()에 넣어준다.
        /// load() 에서는, urlRequest 를 뽑아서 session에 넣어 - dataTask 만들어줘~ 넘겨준다.
        /// ** Resource<UserProfile>
        /// UserProfile 을 받기 위한 Resource 니, 타입은 <UserProfile> 이다.
        let network = NetworkService(configuration: .default)
        
        // Resource
        let resource = Resource<UserProfile>(
            base: "https://api.github.com/",
            path: "users/\(keyword)",
            params: [:],
            header: ["Content-Type":"application/json"])
        
        // NetworkService
        network.load(resource) // publisher를 통해 data 받아옴
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.user = nil
                case .finished: break
                }
            } receiveValue: { user in
                self.user = user
            }.store(in: &subscriptions)
    }
}
