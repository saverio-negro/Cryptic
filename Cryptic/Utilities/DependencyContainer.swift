//
//  DependencyContainer.swift
//  Cryptic
//
//  Created by Saverio Negro on 8/14/26.
//

import Foundation

class DependencyContainer {
    
    private var dependencies: [String : Any] = [:]
    
    func resolve<T>(_ key: T.Type) -> Any {
        let keyStr = "\(key)"
        return self.dependencies[keyStr]!
    }
    
    func set<T>(_ key: T.Type, value: Any) {
        let keyStr = "\(key)"
        self.dependencies[keyStr] = value
    }
}
