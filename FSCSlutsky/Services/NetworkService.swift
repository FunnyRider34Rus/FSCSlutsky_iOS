//
//  NetworkService.swift
//  FSCSlutsky
//
//  Created by Павел on 31.08.2023.
//

import Foundation

protocol NetworkingProtocol {
    func request(path: String, params: [String: String], completion: @escaping (Data?, Error?) -> Void)
}

final class NetworkService: NetworkingProtocol {
    
    private let authService: AuthService
    
    init(authService: AuthService = SceneDelegate.shared().authService) {
        self.authService = authService
    }
    
    func request(path: String, params: [String : String], completion: @escaping (Data?, Error?) -> Void) {
        guard let token = authService.token else { return }
        var allParams = params
        allParams["access_token"] = token
        allParams["domain"] = API.domain
        allParams["count"] = String(API.count)
        allParams["v"] = API.version
        let url = self.url(from: API.newsFeed, params: allParams)
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
        print(url)
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
    
    private func url(from path: String, params:[String: String]) -> URL {
        var components = URLComponents()
        
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.newsFeed
        components.queryItems = params.map {
                URLQueryItem(name: $0, value: $1)
        }
        
        return components.url!
    }
}
