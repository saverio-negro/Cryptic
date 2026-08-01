//
//  HomeViewModel.swift
//  Cryptic
//
//  Created by Saverio Negro on 7/31/26.
//

import SwiftUI

@Observable
@MainActor
class HomeViewModel{
    
    private let delegate: HomeViewModelDelegate
    private var _coins: [Coin] = []
    
    var coins: [Coin] {
        get {
            self._coins
        }
        
        set {
            self._coins = newValue
        }
    }
    
    init(delegate: HomeViewModelDelegate) {
        self.delegate = delegate
    }
    
    func loadCoins() async {
        self._coins = await self.delegate.getCoins()
    }
}

