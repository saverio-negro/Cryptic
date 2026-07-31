//
//  DataService.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/1/26.
//

import Foundation

protocol DataService<Datum> {
    associatedtype Datum
    var data: [Datum] { get set }
}

