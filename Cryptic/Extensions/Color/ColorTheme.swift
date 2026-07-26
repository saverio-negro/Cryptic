//
//  ColorTheme.swift
//  Cryptic
//
//  Created by Saverio Negro on 7/26/26.
//

import SwiftUI

protocol ColorTheme {
    var accent: Color { get }
    var background: Color { get }
    var green: Color { get }
    var red: Color { get }
    var secondaryText: Color { get }
}

extension ColorTheme where Self == DefaultColorTheme {
    static var defaultTheme: Self {
        return DefaultColorTheme()
    }
}

