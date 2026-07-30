//
//  Coin.swift
//  Cryptic
//
//  Created by Saverio Negro on 7/29/26.
//

import Foundation

// CoinGecko API Info
/*
 
 # CoinGecko API Info
 
 URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 
 JSON Response:
 
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
     "current_price": 63744,
     "market_cap": 1278993517188,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 1278993517188,
     "total_volume": 23731891606,
     "high_24h": 64660,
     "low_24h": 63519,
     "price_change_24h": 96.9,
     "price_change_percentage_24h": -0.2,
     "market_cap_change_24h": 2066821009,
     "market_cap_change_percentage_24h": 0.16186,
     "circulating_supply": 20062875,
     "total_supply": 20062875,
     "max_supply": 21000000,
     "ath": 126080,
     "ath_change_percentage": -49.44127,
     "ath_date": "2025-10-06T10:57:42.000Z",
     "atl": 67.81,
     "atl_change_percentage": 93905.7957,
     "atl_date": "2013-07-05T16:00:00.000Z",
     "roi": null,
     "last_updated": "2026-07-29T17:27:30.000Z",
     "sparkline_in_7d": {
       "price": [66196.1719299869, 65992.2886084402, 65865.878374873, 65886.78165545, 65888.6742129785, 66030.1126248511, 66004.1843502608, 66077.0564651421, 66029.6786023887, 65794.5519441074, 65772.2835631355, 65626.221659138, 65575.3184513299, 65659.1423480052, 65744.9214787412, 65398.2089296455, 65612.7177553088, 65610.5447466541, 65693.0579607136, 65529.112191747, 65113.6645745002, 64867.5378902544, 64862.9991100128, 64914.0465989539, 64748.2697214398, 64623.5973083659, 64821.7238066609, 64804.7830755446, 65101.4906116264, 65109.6531133738, 65155.9941512057, 65033.0220621546, 64937.1788221667, 65059.4340269494, 65093.0916516918, 65393.8464777128, 65218.0012929639, 65237.1550651922, 65512.8954796978, 65423.6379136614, 65260.1678735783, 65051.3224320214, 64929.3588841226, 64989.7360381446, 64669.0579300307, 64058.6438529816, 63931.9341915464, 63998.3398789916, 63912.9844012384, 64117.7552184026, 64198.3188748595, 64186.584640176, 64155.2483044947, 64082.4699958173, 64105.6329385328, 64099.0041564236, 64088.4116302834, 64022.4426701612, 63969.509215439, 64041.2160538179, 64136.4638544191, 63976.0814616046, 63957.8599068132, 63926.0489724703, 63829.413086004, 63958.6129696267, 64010.3627684204, 64012.5088549311, 64063.0547701154, 64081.0542690852, 64137.5736325097, 64151.0174987389, 64158.5905883896, 64338.8135800488, 64373.2418791481, 64321.1710630823, 64273.9381561514, 64325.0286707388, 64358.5313090242, 64316.3642062824, 64452.8596582979, 64418.1133142472, 64453.9338508113, 64484.4939826941, 64446.504342123, 64366.4401496558, 64404.1379558845, 64307.3356508652, 64451.9318797235, 64468.0902789829, 64467.7637694103, 64488.5773797803, 64404.9009866745, 64494.5666320759, 64673.185937901, 64738.9612558026, 64648.8824517413, 64639.068024413, 64676.5436588763, 64637.6695857612, 64621.8594719744, 65048.7038221728, 65378.235731677, 65310.3934288922, 65116.2599005034, 65143.0423961332, 65199.8782572154, 65241.1943845886, 65257.657718724, 65438.5489418222, 65374.7485001261, 65160.0793183571, 65060.5141462842, 65207.5348318121, 65248.6759448702, 65106.2280412471, 65041.9322660839, 65293.4889425699, 64597.4665538794, 64483.657582085, 64795.0513641222, 64964.8031267652, 64774.2752473243, 64986.8017662056, 64884.8695895999, 64629.2337401121, 63688.8300767998, 63673.7058372707, 63430.3398101666, 63160.990115533, 63150.2548348796, 63263.2547044658, 63352.0205353653, 63379.8297801616, 63567.4785337761, 63453.8527236132, 63369.6986493846, 63339.9964824454, 63395.9915954473, 63382.5651688108, 63466.0854670452, 63108.0191161095, 63339.296488306, 63851.4430702415, 63950.7603536521, 63706.066184634, 63755.7610226218, 63824.7392637054, 63880.6646045521, 63881.9947126067, 63687.6554388002, 63957.0445311038, 63917.7979451819, 63662.3884818742, 63856.1845109104, 63644.8200930712, 63908.8497496384, 64028.3038809182, 64360.2059712367, 64472.3800523949, 64386.365412585, 64634.9272289654, 64417.2988735784, 64419.3729846124, 64217.5028380744, 64551.7919006582, 64070.5646600841, 63905.2497307005]
     },
     "price_change_percentage_24h_in_currency": -0.2
   }
*/

struct Coin: Identifiable, Codable {
    
    let id: String
    let symbol: String
    let name: String
    let image: String
    let currentPrice: Double
    let marketCap: Double?
    let marketCapRank: Double?
    let fullyDilutedValuation: Double?
    let totalVolume: Double?
    let high24H: Double?
    let low24H: Double?
    let priceChange24H: Double?
    let priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply: Double?
    let totalSupply: Double?
    let maxSupply: Double?
    let ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl: Double?
    let atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }
    
    func updateHoldings(amount: Double) -> Coin {
        return Coin(
            id: self.id,
            symbol: self.symbol,
            name: self.name,
            image: self.image,
            currentPrice: self.currentPrice,
            marketCap: self.marketCap,
            marketCapRank: self.marketCapRank,
            fullyDilutedValuation: self.fullyDilutedValuation,
            totalVolume: self.totalVolume,
            high24H: self.high24H,
            low24H: self.low24H,
            priceChange24H: self.priceChange24H,
            priceChangePercentage24H: self.priceChangePercentage24H,
            marketCapChange24H: self.marketCapChange24H,
            marketCapChangePercentage24H: self.marketCapChangePercentage24H,
            circulatingSupply: self.circulatingSupply,
            totalSupply: self.totalSupply,
            maxSupply: self.maxSupply,
            ath: self.ath,
            athChangePercentage: self.athChangePercentage,
            athDate: self.athDate,
            atl: self.atl,
            atlChangePercentage: self.atlChangePercentage,
            atlDate: self.atlDate,
            lastUpdated: self.lastUpdated,
            sparklineIn7D: self.sparklineIn7D,
            priceChangePercentage24HInCurrency: self.priceChangePercentage24HInCurrency,
            currentHoldings: amount
        )
    }
    
    var currentHoldingsValue: Double {
        return (self.currentHoldings ?? 0.0) * self.currentPrice
    }
    
    var rank: Int {
        return Int(self.marketCapRank ?? 0.0)
    }
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}
