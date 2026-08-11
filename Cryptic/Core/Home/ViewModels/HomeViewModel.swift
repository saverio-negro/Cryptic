//
//  HomeViewModel.swift
//  Cryptic
//
//  Created by Saverio Negro on 7/31/26.
//

import SwiftUI
@preconcurrency import Combine

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var coins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    private let dataService: any CombineCoinDataService
    private var cancellables: Set<AnyCancellable> = Set()
    
    init(dataService: any CombineCoinDataService) {
        self.dataService = dataService
        Task {
            await self.dataService.publisher.sink { emittedCoins in
                self.coins = emittedCoins
            }
            .store(in: &cancellables)
        }
    }
}

