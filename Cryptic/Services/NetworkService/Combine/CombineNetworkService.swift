//
//  CombineNetworkService.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/12/26.
//

import Foundation
import Combine

protocol CombineNetworkService {
    func fetchData() throws -> AnyPublisher<Data, Error>
}

// MARK: Handle Completion
extension CombineNetworkService {
    func handleCompletion(completion: Subscribers.Completion<any Error>) -> Void {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
