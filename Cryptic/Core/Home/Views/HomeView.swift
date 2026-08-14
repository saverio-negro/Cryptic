//
//  HomeView.swift
//  Cryptic
//
//  Created by Saverio Negro on 7/29/26.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    @StateObject var homeViewModel: HomeViewModel
    @State var start: Date = Date()
    
    init(dependencyContainer: DependencyContainer) {
        let coinDataService = dependencyContainer.resolve(
            (any CombineCoinDataService).self
        ) as! any CombineCoinDataService
        
        self._homeViewModel = StateObject(
            wrappedValue: HomeViewModel(
                dataService: coinDataService
            )
        )
    }
    
    var body: some View {
        ZStack {
            // Background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // Content layer
            VStack {
                homeHeader
                
                columnTitles
                
                if showPortfolio {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                } else {
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeViewLight_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView(
                dependencyContainer: self.previewService.mockDependencyContainer
            )
        }
        
    }
}

struct HomeViewDark_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView(
                dependencyContainer: self.previewService.mockDependencyContainer
            )
        }
        .preferredColorScheme(.dark)
    }
}

// MARK: - Home Header
extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: showPortfolio)
                .background (
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(.none, value: showPortfolio)
            
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180: 0))
                .onTapGesture {
                    withAnimation(.spring) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(homeViewModel.coins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(
                        .init(
                            top: 10,
                            leading: 0,
                            bottom: 10,
                            trailing: 10
                        )
                    )
            }
        }
        .listStyle(.plain)
    }
    
    private var portfolioCoinsList: some View {
        List {
            ForEach(homeViewModel.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(
                        .init(
                            top: 10,
                            leading: 0,
                            bottom: 10,
                            trailing: 10
                        )
                    )
            }
        }
        .listStyle(.plain)
    }
    
    private var columnTitles: some View {
        GeometryReader { geoProxy in
            HStack {
                Text("Coin")
                Spacer()
                if showPortfolio {
                    Text("Holdings")
                }
                Text("Price")
                    .frame(width: geoProxy.size.width / 3.5, alignment: .trailing)
            }
            .font(.caption)
            .foregroundStyle(Color.theme.secondaryText)
            .padding(.horizontal)
        }
        .frame(height: 20)
        .frame(maxWidth: .infinity)
    }
}
