//
//  Color+Theme.swift
//  Cryptic
//
//  Created by Saverio Negro on 7/26/26.
//

import SwiftUI

extension ShapeStyle where Self == Color {
    @MainActor
    static var theme: ColorTheme {
        return DefaultColorTheme()
    }
}


