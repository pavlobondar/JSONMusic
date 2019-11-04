//
//  SearchResponce.swift
//  JSONMusic
//
//  Created by Pavel Bondar on 11/4/19.
//  Copyright © 2019 Pavel Bondar. All rights reserved.
//

import Foundation

struct SearchResponce: Decodable {
    var resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    var trackName: String
    var collectionName: String?
    var artistName: String
    var artworkUrl60: String?
}
