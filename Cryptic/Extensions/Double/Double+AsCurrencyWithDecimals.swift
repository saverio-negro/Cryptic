//
//  Double+AsCurrencyWithDecimals.swift
//  Cryptic
//
//  Created by Saverio Negro on 7/30/26.
//

import Foundation

extension Double {
    
    enum Region: String {
        case argentina = "es-AR"
        case australia = "en-AU"
        case austria = "de-AT"
        case bangladesh = "bn-BD"
        case belgium = "fr-BE"
        case brazil = "pt-BR"
        case canada = "en-CA"
        case chile = "es-CL"
        case china = "zh-CN"
        case colombia = "es-CO"
        case czechRepublic = "cs-CZ"
        case denmark = "da-DK"
        case finland = "fi-FI"
        case france = "fr-FR"
        case germany = "de-DE"
        case greece = "el-GR"
        case hongKong = "zh-HK"
        case hungary = "hu-HU"
        case india = "bn-IN"
        case indonesia = "id-ID"
        case ireland = "en-IE"
        case israel = "he-IL"
        case italy = "it-IT"
        case japan = "ja-JP"
        case mexico = "es-MX"
        case newZealand = "en-NZ"
        case norway = "no-NO"
        case poland = "pl-PL"
        case portugal = "pt-PT"
        case republicOfKorea = "ko-KR"
        case romania = "ro-RO"
        case russianFederation = "ru-RU"
        case saudiArabia = "ar-SA"
        case slovakia = "sk-SK"
        case southAfrica = "en-ZA"
        case spain = "es-ES"
        case sriLanka = "ta-LK"
        case sweden = "sv-SE"
        case switzerland = "de-CH"
        case taiwan = "zh-TW"
        case thailand = "th-TH"
        case theNetherlands = "nl-NL"
        case turkey = "tr-TR"
        case unitedKingdom = "en-GB"
        case unitedStates = "en-US"
    }
    
    private var currencyFormatter: NumberFormatter {
        
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .currency
        formatter.usesGroupingSeparator = true
//        formatter.locale = .current // <- default locale value
//        formatter.currencyCode = "USD" // <- change currency
//        formatter.currencySymbol = "$" // <- change currency symbol
        formatter.maximumFractionDigits = 2
        
        return formatter
    }

    /// Converts a `Double` into a currency as a `String` with 2-n decimal places.
    /// - `n`: maximum number of decimal places (default to 6)
    /// - `localeAsRegion`: The locale for the currency formatting given a region (default to `Region.unitedStates`)
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.3456 to $12.3456
    /// Convert 0.123456 to $0.123456
    /// ```
    func asCurrencyWithDecimals(_ n: Int = 6, localeAsRegion: Region = .unitedStates) -> String {
        currencyFormatter.maximumFractionDigits = n
        currencyFormatter.locale = .init(identifier: localeAsRegion.rawValue)
        let number = NSNumber(value: self)
        return currencyFormatter.string(from: number) ?? "$0.00"
    }
}

