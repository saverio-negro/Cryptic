//
//  MockHomeViewModelDelegate.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/1/26.
//

import SwiftUI

@MainActor
struct MockHomeViewModelDelegate: HomeViewModelDelegate {
    
    let coinService: any CoinDataService
    
    init(testContainer: DependencyContainer) {
        self.coinService = testContainer.get(MockCoinManager.self) as! MockCoinManager
    }
    
    func getCoins() async -> [Coin] {
        return await self.coinService.getData()
    }
}

