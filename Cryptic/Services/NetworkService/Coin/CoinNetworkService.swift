//
//  CoinNetworkService.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/10/26.
//

import Foundation

protocol CoinNetworkService: NetworkService where URLString == String, Datum == Coin {}

protocol CombineCoinNetworkService: CoinNetworkService, CombineNetworkService {}

