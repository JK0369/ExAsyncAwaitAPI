//
//  Entity.swift
//  ExAsyncAwaitAPI
//
//  Created by 김종권 on 2022/12/02.
//

import Foundation

struct AlbumResult: Codable {
  let results: [Album]
}

struct Album: Codable, Hashable {
  let collectionId: Int
  let collectionName: String
  let collectionPrice: Double
}
