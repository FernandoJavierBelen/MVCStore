//
//  HTTPClient.swift
//  MVCStore
//
//  Created by Fernado Belen on 02/10/2021.
//

import Foundation

class HTTPClient {
    
    init(){}
    
    func request<T: Codable>(urlString: String, method: String, completion: @escaping(T?, Bool) -> Void){
        let url = URL(string: urlString)
        var request = URLRequest(url: url! as URL)
        request.httpMethod = method
        URLSession.shared.dataTask(with: request) {data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("error=\(error)")
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let group = try decoder.decode(T.self, from: data!)
                    completion(group,true)
                }
                catch let jsonError {
                    print("Failed to decode", jsonError)
                    completion(nil,false)
                }
            }
        }.resume()
    }
}

