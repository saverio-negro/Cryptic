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
    
    private var _coins: [Coin] = []
    private var _portfolioCoins: [Coin] = []
    
    var coins: [Coin] {
        get {
            self._coins
        }
        
        set {
            self._coins = newValue
        }
    }
    
    var portfolioCoins: [Coin] {
        get {
            self._coins
        }
        
        set {
            self._coins = newValue
        }
    }
    
    init() {
        
    }
}

