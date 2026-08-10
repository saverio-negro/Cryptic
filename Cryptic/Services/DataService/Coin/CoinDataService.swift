//
//  CoinDataService.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/10/26.
//

import Foundation
import Combine

protocol CoinDataService: DataService where Datum == Coin {}

typealias CombineCoinDataService = CoinDataService & CombineDataService
