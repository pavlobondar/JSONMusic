//
//  NetworkService.swift
//  JSONMusic
//
//  Created by Pavel Bondar on 11/4/19.
//  Copyright © 2019 Pavel Bondar. All rights reserved.
//

import Foundation

class NetworkService {
    
    func request(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else{ return }
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else{ return }
                completion(.success(data))
            }
        }.resume()
    }
}
