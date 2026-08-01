//
//  ProductionHomeViewModelDelegate.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/1/26.
//

import SwiftUI

@MainActor
struct ProductionHomeViewModelDelegate: HomeViewModelDelegate {
    
    let coinService: any CoinDataService
    
    init(productionContainer: DependencyContainer) {
        self.coinService = productionContainer.get(ProductionCoinManager.self) as! ProductionCoinManager
    }
    
    func getCoins() async -> [Coin] {
        return await self.coinService.getData()
    }
}
