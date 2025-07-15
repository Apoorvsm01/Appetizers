//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Apoorv Mahajan on 7/12/25.
//

import UIKit
//This is setting up a SingleTon
final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://apoorvsm01.github.io/"
    private let appetizerURL = baseURL + "appetizers.json"
    
    private init() {}
    
    //    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
    //        //        this func tries to get the appetizer. success = resulting name from the array, failure gives the APError
    //        guard let url = URL(string: appetizerURL) else {
    //            completed(.failure(.invalidURL))
    //            return
    //        }
    //
    //        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
    //            if let _ = error {
    //                completed(.failure(.unableToComplete))
    //                return
    //            }
    //            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
    //                //                200 means "hey things went good" acc to the standard status codes
    //                completed(.failure(.invalidResponse))
    //                return
    //            }
    //
    //            guard let data = data else {
    //                completed(.failure(.invalidResponse))
    //                return
    //            }
    //
    //            do {
    //                let decoder = JSONDecoder()
    //                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
    //                completed(.success(decodedResponse.request))
    //            } catch {
    //                completed(.failure(.invalidData))
    //            }
    //        }
    //        task.resume()
    //    }
    
    func getAppetizers() async throws -> [Appetizer] {
        //        this func tries to get the appetizer. success = resulting name from the array, failure gives the APError
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }
        
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        //            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        //                //                200 means "hey things went good" acc to the standard status codes
        //                completed(.failure(.invalidResponse))
        //                return
        //            }
        
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(AppetizerResponse.self, from: data).request
        } catch {
            throw APError.invalidData
        }
    }
    
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void ) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}

