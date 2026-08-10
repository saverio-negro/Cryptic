//
//  ProductionCoinDataService.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/10/26.
//

import Foundation
import Combine

actor ProductionCoinDataService: CoinDataService {
    
    @Published var data: [Coin] = []
    let networkService: any CombineCoinNetworkService
    var cancellables = Set<AnyCancellable>()
    
    
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
    
    private func getCoins() throws -> Void {
        try networkService.fetchData().sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            },
            receiveValue: { returnedCoins in
                self.data = returnedCoins
            }
        )
        .store(in: &cancellables)
    }
}
