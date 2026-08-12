//
//  ProductionCombineNetworkService.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/12/26.
//

import Foundation
import Combine

final class ProductionCombineNetworkService: ProductionNetworkService, CombineNetworkService {
    
    override init(urlString: String) {
        super.init(urlString: urlString)
    }
    
    func fetchData() throws -> AnyPublisher<Data, any Error> {
        
        guard
            let url = self.url
        else {
            throw URLError(.badURL)
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap(handleURLResponse)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
