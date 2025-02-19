//: [Previous](@previous)

import Foundation
import Combine

enum NetworkError: Error {
    case invalidRequest
    case responseError(statusCode: Int)
}

struct GithubProfile: Codable {
    let login: String
    let avatarUrl: String
    let htmlUrl: String
    let followers: Int
    let following: Int
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
        case followers
        case following
    }
}

final class NetworkService {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }
    
    func fetchProfile(userName: String) -> AnyPublisher<GithubProfile, Error> { // publisher는 통로의 의미. 네트워크에 요청한 데이터를 받아서, 전달( return) 해주는 역할로 fetchProfile()이 만들어짐
        let urlString = "https://api.github.com/users/\(userName)"
        let url = URL(string: urlString)!
        
        return session
            .dataTaskPublisher(for: url)
            .tryMap { result -> Data in
                guard let response = result.response as? HTTPURLResponse,
                      (200..<300).contains(response.statusCode)
                else {
                    let response = result.response as? HTTPURLResponse
                    let statusCode = response?.statusCode ?? -1
                    throw NetworkError.responseError(statusCode: statusCode)
                }
                return result.data
            }
            .decode(type: GithubProfile.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}


let networkService = NetworkService(configuration: .default)
let subscription = networkService
    .fetchProfile(userName: "cafielo") // fetchProfile()을 통해 네트워트요청&받은데이터 전달하는 publisher 구독
    .receive(on: RunLoop.main)
    .sink { error in
        print("error: \(error)")
    } receiveValue: { profile in
        print("profile: \(profile)")
    }

//: [Next](@next)



