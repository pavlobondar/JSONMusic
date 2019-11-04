//
//  NetworkDataFetcher.swift
//  JSONMusic
//
//  Created by Pavel Bondar on 11/4/19.
//  Copyright © 2019 Pavel Bondar. All rights reserved.
//

import Foundation

class NetworkDataFetcher {
    let networkService = NetworkService()
    
    func fetchTracks(urlString: String, responce: @escaping (SearchResponce?) -> Void) {
        networkService.request(urlString: urlString) { (result) in
            switch result {
            case .success(let data):
                do {
                    let tracks = try JSONDecoder().decode(SearchResponce.self, from: data)
                    responce(tracks)
                } catch let jsonError {
                    print("Faild to decode JSON", jsonError)
                    responce(nil)
                }
            case .failure(let error):
                print("Error received requesting data: ", error.localizedDescription)
                responce(nil)
            }
        }
    }
}
