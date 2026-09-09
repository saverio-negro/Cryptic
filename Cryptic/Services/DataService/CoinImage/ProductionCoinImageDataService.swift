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
    let coinImageId: String
    let networkService: any CombineNetworkService
    let imageFMService: ImageFileManagerService
    private var imageSubscription: AnyCancellable? = nil
    
    init(
        coinImageId: String,
        networkService: any CombineNetworkService,
        imageFMService: ImageFileManagerService
    ) {
        self.coinImageId = coinImageId
        self.networkService = networkService
        self.imageFMService = imageFMService
        Task {
            await self.getCoinImage()
        }
    }
    
    func setCoinImage(coinImage: UIImage?) -> Void {
        self.imageSubscription?.cancel()
        
        guard let coinImage = coinImage else { return }
        
        self.data = coinImage
        
        do {
            try self.imageFMService.save(value: coinImage, fileName: coinImageId)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    private func getCoinImage() {
        do {
            let savedImage = try imageFMService.get(fileName: coinImageId)
            self.data = savedImage
            print("Successfully retrieved image from the File Manager!")
        } catch {
            print("Error: \(error.localizedDescription)")
            do {
                print("Downloading image now...")
                try downloadCoinImage()
            } catch {
                print("Error fetching coin image: \(error.localizedDescription)")
            }
        }
    }
    
    private func downloadCoinImage() throws -> Void {
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

