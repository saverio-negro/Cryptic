//
//  ProductionCoinDataService.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/10/26.
//

import Foundation
import Combine

actor ProductionCoinDataService: CombineCoinDataService {
    
    @Published var data: [Coin] = []
    var publisher: Published<[Coin]>.Publisher {
        return self.$data
    }
    let networkService: any CombineCoinNetworkService
    var coinSubscription: AnyCancellable? = nil
    
    init(networkService: any CombineCoinNetworkService) {
        self.networkService = networkService
        Task {
            do {
                try await self.getCoins()
            } catch {
                print("Failed fetching coins: \(error.localizedDescription)")
            }
        }
    }
    
    func setCoins(coins: [Coin]) -> Void {
        self.data = coins
        self.coinSubscription?.cancel()
    }
    
    private func getCoins() throws -> Void {
        self.coinSubscription = try networkService.fetchData().sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            },
            receiveValue: setCoins
        )
    }
}
