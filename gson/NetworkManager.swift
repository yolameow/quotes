//
//  NetworkManager.swift
//  gson
//
//  Created by Mac on 17.11.2020.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    init() {}
    
   func fetchData(from URLAddress: String, with complition: @escaping (Quote) -> Void) {
        
        guard let url = URL(string: URLAddress) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let quoteData = try JSONDecoder().decode(Quote.self, from: data)
                DispatchQueue.main.async {
                    complition(quoteData)
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
    } 
    
  
}
