//
//  NetworkService.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/1/26.
//

import SwiftUI

protocol NetworkService {
    associatedtype URLString: StringProtocol
    associatedtype Datum: Codable
    
    var urlString: URLString { get }
    func fetchData(_ from: URLString) -> [Datum]
}

