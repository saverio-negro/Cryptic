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
    let networkService: any CombineNetworkService
    var coinSubscription: AnyCancellable? = nil
    
    init(networkService: any CombineNetworkService) {
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
        self.coinSubscription = try networkService.fetchData()
            .decode(type: [Coin].self, decoder: JSONDecoder())
            .sink(
                receiveCompletion: networkService.handleCompletion,
                receiveValue: setCoins
            )
    }
}
