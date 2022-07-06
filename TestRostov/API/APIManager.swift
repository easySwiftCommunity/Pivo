//
//  APIManager.swift
//  TestRostov
//
//  Created by mac on 06.07.2022.
//

import UIKit

enum APIManager {
    static func getData(request: URLRequest, completion: @escaping (Pivo) -> Void) {
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard error ==  nil else {
                print(String(describing: error?.localizedDescription))
                return
            }
            guard let data = data else {
                return
            }
            print(data)
            let jsonDecoder = JSONDecoder()
            
            do {
                let responseObject = try jsonDecoder.decode(
                    Pivo.self,
                    from: data
                )
                completion(responseObject)
            } catch let error {
                print(String(describing: error.localizedDescription))
            }
        }
        .resume()
    }
}
