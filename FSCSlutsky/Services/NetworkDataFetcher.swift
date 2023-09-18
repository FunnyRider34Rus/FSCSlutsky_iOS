//
//  NetworkDataFetcher.swift
//  FSCSlutsky
//
//  Created by Павел on 08.09.2023.
//

import Foundation

protocol DataFetcher {
    func getFeed(response: @escaping (Feeds?) -> Void)
}

struct NetworkDataFetcher: DataFetcher {
    
    let networking: NetworkingProtocol
    
    init(networking: NetworkingProtocol) {
        self.networking = networking
    }
    
    func getFeed(response: @escaping (Feeds?) -> Void) {
        let params = ["filters": "all"]
        networking.request(path: API.newsFeed, params: params) { (data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }
            let decoded = self.decodeJSON(type: Response.self, from: data)
            //print(decoded?.response as Any)
            response(decoded?.response)
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else { return nil }
        return response
    }
}
