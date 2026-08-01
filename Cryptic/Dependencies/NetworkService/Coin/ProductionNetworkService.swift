//
//  ProductionNetworkService.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/1/26.
//

import SwiftUI

/*
 Since `NetworkService` is stateless, and doesn't hold mutable state,
 any concrete type of `NetworkService` can easily be declared as a struct
*/
struct ProductionNetworkService: CoinNetworkService {
    
    let urlString: String
    
    func fetchData() async throws -> [Coin] {
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let coins = try JSONDecoder().decode(Array<Coin>.self, from: data)
        return coins
    }
}
