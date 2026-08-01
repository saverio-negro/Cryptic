//
//  DependencyContainer.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/1/26.
//

import SwiftUI

class DependencyContainer {
    
    private var dependencies: [String : Any] = [:]
    
    func get<T>(_ key: T.Type) -> Any {
        let keyStr = String("\(key)")
        return self.dependencies[keyStr]!
    }
    
    func add<T>(_ dependency: T) {
        let keyStr = String("\(T.self)")
        self.dependencies[keyStr] = dependency
    }
    
    func add<T>(_ dependency: () -> T) {
        let keyStr = String("\(T.self)")
        self.dependencies[keyStr] = dependency()
    }
}

