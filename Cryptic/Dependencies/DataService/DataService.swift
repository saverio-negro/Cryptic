//
//  DataService.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/1/26.
//

import Foundation

/*
 Since any concrete type of `DataService` will hold mutable state (stateful), this
 state will likely be accessed and modified asynchronously; as a result,
 any concrete type of `DataService` should be an actor.
 
 Actors are reference types that isolate their state, guaranteeing thread safety
 and preventing data races. This is the modern Swift way to handle stateful data layers.
 */
protocol DataService<Datum>: Actor {
    associatedtype Datum
    var data: [Datum] { get set }
    func getData() async -> [Datum]
}

