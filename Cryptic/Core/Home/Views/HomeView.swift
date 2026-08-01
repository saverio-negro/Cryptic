//
//  HomeView.swift
//  Cryptic
//
//  Created by Saverio Negro on 7/29/26.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    @State var homeViewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            // Background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // Content layer
            VStack {
                homeHeader
                List {
                    ForEach(homeViewModel.coins) { coin in
                        CoinRowView(coin: coin, showHoldingsColumn: showPortfolio)
                    }
                }
                .listStyle(.plain)
                
                Spacer(minLength: 0)
            }
        }
        .task {
            await homeViewModel.loadCoins()
        }
    }
}

struct HomeViewLight_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            homeViewModel: HomeViewModel(
                delegate: MockHomeViewModelDelegate(
                    testContainer: previewService.testContainer
                )
            )
        )
    }
}

struct HomeViewDark_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            homeViewModel: HomeViewModel(
                delegate: MockHomeViewModelDelegate(
                    testContainer: previewService.testContainer
                )
            )
        )
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
}
