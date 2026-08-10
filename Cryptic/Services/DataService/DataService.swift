//
//  DataService.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/10/26.
//

import Foundation

protocol DataService: Actor {
    associatedtype Datum
    var data: [Datum] { get set }
}
