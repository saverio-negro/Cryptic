//
//  ProductionHomeViewModelDelegate.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/1/26.
//

import SwiftUI

class ProductionHomeViewModelDelegate: HomeViewModelDelegate {
    
    let coinManager: any DataService
    
    init(container: DependencyContainer) {
        self.coinManager = container.get(CoinManager.self) as! any DataService
    }
}
