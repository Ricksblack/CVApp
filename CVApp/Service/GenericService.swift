//
//  GenericService.swift
//  CVApp
//
//  Created by Ricardo Moreno Martinez on 11/22/19.
//  Copyright © 2019 Ricardo Moreno Martinez. All rights reserved.
//

import Foundation

protocol HTTPService {
    associatedtype myType
    func fetchData(url: URL, completion: @escaping (myType) -> Void)
}

class GenericService<T: Decodable>: HTTPService {
    typealias myType = T
    func fetchData(url: URL, completion: @escaping (myType) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }
            do {
                let obtainedData = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(obtainedData)
                }
            } catch let error {
                print("There was an error", error)
            }}.resume()
    }
}
