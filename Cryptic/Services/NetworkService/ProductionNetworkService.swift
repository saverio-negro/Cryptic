//
//  ProductionNetworkService.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/12/26.
//

import Foundation

class ProductionNetworkService: NetworkService {
    
    // Custom localized errors
    enum NetworkingError: LocalizedError {
        
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(let url):
                return "Bad response from the URL: \(url)"
            case .unknown:
                return "Unknown error occurred."
            }
        }
    }
    
    let urlString: String
    var url: URL? {
        return URL(string: urlString)
    }

    init(urlString: String) {
        self.urlString = urlString
    }
    
    func handleURLResponse(output: (Data, URLResponse)) throws -> Data {
        
        let (data, response) = output
        
        guard
            let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300
        else {
            throw NetworkingError.badURLResponse(url: URL(string: urlString)!)
        }
        return data
    }
}

