//
//  NetworkService.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/10/26.
//

import Foundation
import Combine

protocol NetworkService {
    
    associatedtype URLString: StringProtocol
    associatedtype Datum: Decodable
    var urlString: URLString { get }
}

protocol CombineNetworkService: NetworkService {
    func fetchData() throws -> AnyPublisher<[Datum], Error>
}

