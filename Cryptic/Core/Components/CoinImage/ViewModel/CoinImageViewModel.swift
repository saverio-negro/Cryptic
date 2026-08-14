//
//  CoinImageViewModel.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/14/26.
//

import SwiftUI
@preconcurrency import Combine

@MainActor
class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    private let dataService: any CombineCoinImageDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(dataService: any CombineCoinImageDataService) {
        self.dataService = dataService
        Task {
            await self.dataService.publisher.sink(
                receiveCompletion: { [weak self] _ in
                    self?.isLoading = false
                },
                receiveValue: { [weak self] emittedImage in
                    self?.image = emittedImage
                }
            )
            .store(in: &cancellables)
        }
        self.isLoading = true
    }
}
