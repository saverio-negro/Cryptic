//
//  CoinImageViewModel.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/14/26.
//


class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    let dataService: any CombineCoinImageDataService
    
    init(dataService: any CombineCoinImageDataService) {
        Task {
            
        }
    }
}