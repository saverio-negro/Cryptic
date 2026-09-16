//
//  UIApplication+EndEditing.swift
//  Cryptic
//
//  Created by Saverio Negro on 9/17/26.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
