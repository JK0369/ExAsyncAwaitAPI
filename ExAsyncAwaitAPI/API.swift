//
//  API.swift
//  ExAsyncAwaitAPI
//
//  Created by 김종권 on 2022/12/02.
//

import Foundation

enum APIError: Error {
  case invalidURL
  case noData
}

enum API {
  // MARK: not Async & Await
  static func fetchAlbums(completion: @escaping (Result<AlbumResult, Error>) -> Void) {
    guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=album") else {
      completion(.failure(APIError.invalidURL))
      return
    }
    
    URLSession.shared.dataTask(with: url) { data, _, error in
      if let error = error {
        completion(.failure(error))
        return
      }
      
      guard let data = data else {
        completion(.failure(APIError.noData))
        return
      }
      
      do {
        let result = try JSONDecoder().decode(AlbumResult.self, from: data)
        completion(.success(result))
      } catch {
        completion(.failure(error))
      }
      
    }
    .resume()
  }
  
  // MARK: Async & Await
  static func fetchAlbums() async throws -> AlbumResult {
    guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=album") else {
      throw APIError.invalidURL
    }
    let (data, _) = try await URLSession.shared.data(from: url)
    let result = try JSONDecoder().decode(AlbumResult.self, from: data)
    return result
  }
  
}
