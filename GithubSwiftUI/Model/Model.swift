//
//  Model.swift
//  GithubSwiftUI
//
//  Created by A'zamjon Abdumuxtorov on 23/02/24.
//

import Foundation

struct GithubAPI {
    static let baseURL = "https://api.github.com"
    static var username = ""

    static func getUserInfo(completion: @escaping (Result<User, Error>) -> Void) {
        let url = URL(string: "\(baseURL)/users/\(username)")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(error ?? NSError(domain: "GitHubAPI", code: -1, userInfo: nil)))
                print(data!)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user = try decoder.decode(User.self, from: data)
                completion(.success(user))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

struct User: Codable {
    let login: String
    let name: String?
    let followers: Int
    let following: Int
    let location: String?
    let publicRepos: Int?
    let company: String?
    let avatarUrl: String?
    let bio: String?

    enum CodingKeys: String, CodingKey {
        case login, name, followers, following, location, company,bio
        case publicRepos = "public_repos"
        case avatarUrl = "avatar_url"
    }
}

