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
    
    func set<T>(_ key: T.Type, dependency: T) {
        let keyStr = String("\(key)")
        self.dependencies[keyStr] = dependency
    }
    
    func set<T>(_ key: T.Type, dependency: () -> T) {
        let keyStr = String("\(key)")
        self.dependencies[keyStr] = dependency()
    }
}

