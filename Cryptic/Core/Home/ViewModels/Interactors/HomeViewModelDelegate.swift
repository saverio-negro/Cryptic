//
//  HomeViewModelDelegate.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/1/26.
//

import SwiftUI

// Define the abstract type that the
// HomeViewModel is going to delegate
// its functionalities to
protocol HomeViewModelDelegate: Sendable {
    func getCoins() async -> [Coin]
}

