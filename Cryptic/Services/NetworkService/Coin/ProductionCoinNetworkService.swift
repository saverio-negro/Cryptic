//
//  ProductionCoinNetworkService.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/10/26.
//

import Foundation
import Combine

/*
 Since the `ProductionCoinNetworkService` is a stateless type — it doesn't
 hold member variables whose state can mutate — we can make it a struct
 or a final class — ideal for stateless services.
 */
final class ProductionCoinNetworkService: CombineCoinNetworkService {
    let urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func fetchData() throws -> AnyPublisher<[Coin], Error> {
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                
                let (data, response) = output
                
                guard
                    let response = response as? HTTPURLResponse,
                    response.statusCode >= 200 && response.statusCode < 300
                else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [Coin].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
