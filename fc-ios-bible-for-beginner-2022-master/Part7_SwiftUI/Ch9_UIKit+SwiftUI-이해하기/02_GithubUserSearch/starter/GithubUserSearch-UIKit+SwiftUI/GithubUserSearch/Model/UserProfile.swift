//
//  UserProfile.swift
//  GithubUserSearch
//
//  Created by Hakyung Sohn on 11/14/24.
//

import Foundation

struct UserProfile: Hashable, Identifiable, Decodable {
    
    var id: Int64
    var login: String
    var name: String
    var avatarUrl: URL
    var htmlUrl: String
    var followers: Int
    var following: Int
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case login
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
        case followers
        case following
    }
}

extension UserProfile {
    static let mock = UserProfile(
        id: 5119292,
        login: "hortenssiaa",
        name: "Hakyung Sohn",
        avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/5119286?v=4")!,
        htmlUrl: "https://github.com/hortenssiaa",
        followers: 100,
        following: 50
    )
}
