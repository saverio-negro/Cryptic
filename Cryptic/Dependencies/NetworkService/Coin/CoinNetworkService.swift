//
//  CoinNetworkService.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/1/26.
//

import SwiftUI

protocol CoinNetworkService: NetworkService where URLString == String, Datum == Coin {}

