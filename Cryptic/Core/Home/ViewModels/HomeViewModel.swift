//
//  HomeViewModel.swift
//  Cryptic
//
//  Created by Saverio Negro on 7/31/26.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    private let delegate: HomeViewModelDelegate
    @Published private var _coins: [Coin] = []
    
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
    
    func getCoins() {
        self.coins = self.delegate.getCoins()
    }
}

