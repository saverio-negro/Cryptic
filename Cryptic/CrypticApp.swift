//
//  CrypticApp.swift
//  Cryptic
//
//  Created by Saverio Negro on 7/26/26.
//

import SwiftUI

@main
struct CrypticApp: App {
    
    let productionDependencyContainer = {
        
        let dependencyContainer = DependencyContainer()
        
        // Add data service for coins
        dependencyContainer.set(
            (any CombineCoinDataService).self,
            value: ProductionCoinDataService(
                networkService: ProductionCombineNetworkService(
                    urlString: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
                )
            )
        )
        
        return dependencyContainer
    }()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView(dependencyContainer: productionDependencyContainer)
                .toolbar(.hidden)
            }
        }
    }
}
