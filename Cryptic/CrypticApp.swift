//
//  CrypticApp.swift
//  Cryptic
//
//  Created by Saverio Negro on 7/26/26.
//

import SwiftUI

@main
struct CrypticApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView(
                    homeViewModel: HomeViewModel(
                        dataService: ProductionCoinDataService(
                            networkService: ProductionCoinNetworkService(
                                urlString: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
                            )
                        )
                    )
                )
                .toolbar(.hidden)
            }
        }
    }
}
