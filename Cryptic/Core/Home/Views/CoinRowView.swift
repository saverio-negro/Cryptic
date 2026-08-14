//
//  CoinRowView.swift
//  Cryptic
//
//  Created by Saverio Negro on 7/30/26.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: Coin
    let showHoldingsColumn: Bool
    
    var body: some View {
        GeometryReader { geoProxy in
            HStack(spacing: 0) {
                leftColumn
                Spacer()
                if showHoldingsColumn {
                    centerColumn
                }
                rightColumn(rowWidth: geoProxy.size.width)
            }
            .font(.subheadline)
        }
    }
}

struct CoinRowView_Light_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: previewService.coin, showHoldingsColumn: true)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
    }
}

struct CoinRowView_Dark_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: previewService.coin, showHoldingsColumn: true)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}

extension CoinRowView {
    
    // MARK: - Left Column
    @ViewBuilder private var leftColumn: some View {
        Text("\(coin.rank)")
            .font(.caption)
            .foregroundStyle(Color.theme.secondaryText)
            .frame(minWidth: 30)
        
        CoinImageView(
            dataService: ProductionCoinImageDataService(
                networkService: ProductionCombineNetworkService(
                    urlString: coin.image
                )
            )
        )
        .frame(width: 30, height: 30)
        
        Text(coin.symbol.uppercased())
            .font(.headline)
            .padding(.leading, 6)
            .foregroundStyle(Color.theme.accent)
    }
    
    // MARK: - Center Column
    @ViewBuilder private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWithDecimals(2))
                .bold()
            
            Text((coin.currentHoldings ?? 0).toStringWithDecimals(1))
        }
        .foregroundStyle(Color.theme.accent)
    }
    
    // MARK: - Right Column
    @ViewBuilder private func rightColumn(rowWidth: CGFloat) -> some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWithDecimals())
                .bold()
                .foregroundStyle(Color.theme.accent)
            
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundStyle(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ? .theme.green : .theme.red
                )
        }
        .frame(width: rowWidth / 3.5, alignment: .trailing)
    }
}
