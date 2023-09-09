//
//  NetworkingProtocol.swift
//  FSCSlutsky
//
//  Created by Павел on 31.08.2023.
//

import Foundation

protocol NetworkingProtocol {
    func request(path: String, params: [String: String], completion: @escaping (Data?, Error?) -> Void)
}
