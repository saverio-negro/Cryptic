//
//  CoinNetworkService.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/1/26.
//

import SwiftUI

class CoinNetworkService: NetworkService {
    
    let urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func fetchData(_ from: String) -> [Coin] {
        return []
    }
}

