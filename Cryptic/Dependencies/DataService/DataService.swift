//
//  DataService.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/1/26.
//

import Foundation

protocol DataService {
    associatedtype Datum
    func getData() -> [Datum]
}

