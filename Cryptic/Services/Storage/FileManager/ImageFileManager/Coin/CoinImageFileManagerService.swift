//
//  CoinImageFileManagerService.swift
//  Cryptic
//
//  Created by Saverio Negro on 9/9/26.
//

import SwiftUI

class CoinImageFileManagerService: ImageFileManagerService {
    
    override init(imageFolderName: String) {
        super.init(imageFolderName: "coin-images")
    }
}

