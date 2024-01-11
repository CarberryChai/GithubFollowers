//
//  URLSession.swift
//  GithubFollowers
//
//  Created by changlin on 2024/1/11.
//

import Foundation

extension URLSession {
    func fetch(with url: URL) async throws -> Data {
        let (data, response) = try await data(from: url)
        guard let response = response as? HTTPURLResponse,
              200 ... 299 ~= response.statusCode else {
            throw URLError(.badServerResponse)
        }
        return data
    }
}
