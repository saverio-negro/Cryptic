//
//  ProductionCoinManager.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/1/26.
//

import SwiftUI

actor ProductionCoinManager: CoinDataService {
    
    var data: [Coin]  = []
    let networkService: any CoinNetworkService
    
    init(networkService: any CoinNetworkService) {
        self.networkService = networkService
    }
    
    func getData() async -> [Coin] {
        self.data = (try? await self.networkService.fetchData()) ?? []
        return self.data
    }
}
