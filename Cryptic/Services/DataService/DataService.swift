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
}

protocol SingleDataService: DataService {
    var data: Datum? { get set }
}

protocol MultipleDataService: DataService {
    var data: [Datum] { get set }
}

protocol CombineSingleDataService: SingleDataService {
    var publisher: Published<Datum?>.Publisher { get }
}

protocol CombineMultipleDataService: MultipleDataService {
    var publisher: Published<[Datum]>.Publisher { get }
}
