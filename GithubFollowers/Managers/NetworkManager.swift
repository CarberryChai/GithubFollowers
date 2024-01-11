//
//  NetworkManager.swift
//  GithubFollowers
//
//  Created by changlin on 2024/1/10.
//

import Foundation
import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"
    let cache = NSCache<NSString, UIImage>()

    private init() {}

    func getFollowers(for username: String, page: Int) async -> Result<[Follower], GFError> {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"

        guard let url = URL(string: endpoint) else { return .failure(.invalidUsername) }

        do {
            let data = try await URLSession.shared.fetch(with: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let followers = try decoder.decode([Follower].self, from: data)
            return .success(followers)
        } catch {
            return .failure(.invalidData)
        }
    }
}

enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again"
}
