//
//  Double+AsPercentString.swift
//  Cryptic
//
//  Created by Saverio Negro on 7/31/26.
//

import Foundation

extension Double {
    
    /// Convert `Double` to `String` with a specified number of decimals
    /// - `n`: Number of decimals to format the current `Double` into
    /// ```
    /// 1.23456 to "1.23
    /// ```
    func toStringWithDecimals(_ n: Int = 2) -> String {
        return String(format: "%.\(n)f", self)
    }
    
    /// Convert `Double` to `String` with percent symbol
    /// ```
    /// 1.23456 to "1.23%"
    /// ```
    func asPercentString() -> String {
        return self.toStringWithDecimals() + "%"
    }
    
    /// Convert `Double` to `String` with percent symbol, using a specified number of decimals
    /// - `n`: Number of decimals to format the current `Double` into
    /// ```
    /// 1.23456 to "1.234%", when n = 3
    /// ```
    func asPercentStringWithDecimals(_ n: Int = 2) -> String {
        return self.toStringWithDecimals(n) + "%"
    }
}

