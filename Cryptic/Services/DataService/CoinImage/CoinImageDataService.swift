//
//  CoinImageDataService.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/13/26.
//

import SwiftUI

protocol CoinImageDataService: DataService where Datum == UIImage {}

typealias CombineCoinImageDataService = CoinImageDataService & CombineSingleDataService

