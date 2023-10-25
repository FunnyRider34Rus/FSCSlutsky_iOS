//
//  NetworkDataFetcher.swift
//  FSCSlutsky
//
//  Created by Павел on 08.09.2023.
//

import Foundation

protocol DataFetcher {
    func getFeed(nextFrom: Int, response: @escaping (Feeds?) -> Void)
}

struct NetworkDataFetcher: DataFetcher {
    
    let networking: NetworkingProtocol
    
    init(networking: NetworkingProtocol) {
        self.networking = networking
    }
    
    func getFeed(nextFrom: Int, response: @escaping (Feeds?) -> Void) {
        var params = ["filters": "owner"]
        params["offset"] = String(nextFrom)
        networking.request(path: API.newsFeed, params: params) { (data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }
            let decoded = self.decodeJSON(type: Response.self, from: data)
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
