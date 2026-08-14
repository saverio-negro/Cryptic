//
//  ProductionCoinImageDataService.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/13/26.
//

import SwiftUI
import Combine

actor ProductionCoinImageDataService: CombineCoinImageDataService {
    
    @Published var data: UIImage? = nil
    var publisher: Published<UIImage?>.Publisher {
        return self.$data
    }
    let networkService: any CombineNetworkService
    private var imageSubscription: AnyCancellable? = nil
    
    init(networkService: any CombineNetworkService) {
        self.networkService = networkService
        Task {
            do {
                try await self.getCoinImage()
            } catch {
                print("Error fetching coin image: \(error.localizedDescription)")
            }
        }
    }
    
    func setCoinImage(coinImage: UIImage?) -> Void {
        self.data = coinImage
        self.imageSubscription?.cancel()
    }
    
    private func getCoinImage() throws -> Void {
        self.imageSubscription = try networkService.fetchData()
            .tryMap { (data) -> UIImage? in
                return UIImage(data: data)
            }
            .sink(
                receiveCompletion: networkService.handleCompletion,
                receiveValue: setCoinImage
            )
    }
}

