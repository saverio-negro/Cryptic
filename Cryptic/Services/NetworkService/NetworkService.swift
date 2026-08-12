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
    var urlString: URLString { get }
}

