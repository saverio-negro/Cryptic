//
//  CrypticApp.swift
//  Cryptic
//
//  Created by Saverio Negro on 7/26/26.
//

import SwiftUI

@main
struct CrypticApp: App {
    
    /*
     Instantiate a dependency container to be
     passed down the view hierarchy and be
     used to inject dependencies required
     by view models
     */
    let dependencyContainer = {
        let productionContainer = DependencyContainer()
        productionContainer.set(
            ProductionCoinManager.self,
            dependency: ProductionCoinManager(
                networkService: ProductionNetworkService(urlString: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")
            )
        )
        return productionContainer
    }()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView(homeViewModel: HomeViewModel(
                    delegate: ProductionHomeViewModelDelegate(
                        productionContainer: dependencyContainer
                        )
                    )
                )
                .toolbar(.hidden)
            }
        }
    }
}
