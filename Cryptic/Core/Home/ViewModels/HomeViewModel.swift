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
    
    @Published private var _coins: [Coin] = []
    @Published private var _portfolioCoins: [Coin] = []
    private let dataService: any CombineCoinDataService
    private var cancellables: Set<AnyCancellable> = Set()
    
    var coins: [Coin] {
        get {
            self._coins
        }
        
        set {
            self._coins = newValue
        }
    }
    
    var portfolioCoins: [Coin] {
        get {
            self._portfolioCoins
        }
        
        set {
            self._portfolioCoins = newValue
        }
    }
    
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

