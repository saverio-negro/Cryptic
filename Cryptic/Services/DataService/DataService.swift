//
//  DataService.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/10/26.
//

import Foundation
import Combine

protocol DataService: Actor {
    associatedtype Datum
    var data: [Datum] { get set }
}

protocol CombineDataService: DataService {
    var publisher: Published<[Datum]>.Publisher { get }
}
