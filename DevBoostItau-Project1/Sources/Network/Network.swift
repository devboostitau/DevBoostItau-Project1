//
//  Network.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation

final class Network {
    
    static func get(url: URL, completion: @escaping (Data?, String?) -> Void) {
        debugPrint("==> Request GET: \(url.absoluteString)")
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                completion(nil, err.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(nil, "Serviço indisponível!")
                return
            }
            
            completion(data, nil)
        }.resume()
    }
}
