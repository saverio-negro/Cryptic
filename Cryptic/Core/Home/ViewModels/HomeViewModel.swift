//
//  HomeViewModel.swift
//  Cryptic
//
//  Created by Saverio Negro on 7/31/26.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    private let delegate: HomeViewModelDelegate
    
    init(delegate: HomeViewModelDelegate) {
        self.delegate = delegate
    }
}

