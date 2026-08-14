//
//  CoinImageView.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/13/26.
//

import SwiftUI



struct CoinImageView: View {
    
    @StateObject private var coinImageViewModel: CoinImageViewModel
    
    init(
        dataService: any CombineCoinImageDataService
    ) {
        self._coinImageViewModel = StateObject(
            wrappedValue: CoinImageViewModel(
                dataService: dataService
            )
        )
    }
    
    var body: some View {
        ZStack {
            if let image = coinImageViewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if coinImageViewModel.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundStyle(.theme.secondaryText)
            }
        }
    }
}

struct CoinImageViewLight_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(
            dataService: ProductionCoinImageDataService(
                networkService: ProductionCombineNetworkService(
                    urlString: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400"
                )
            )
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

struct CoinImageViewDark_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(
            dataService: ProductionCoinImageDataService(
                networkService: ProductionCombineNetworkService(
                    urlString: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400"
                )
            )
        )
        .padding()
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
    }
}

