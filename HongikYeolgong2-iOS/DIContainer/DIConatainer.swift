//
//  DIConatainer.swift
//  HongikYeolgong2-iOS
//
//  Created by 석기권 on 7/16/24.
//

import Foundation

final class DIContainer {
    static let shared = DIContainer()
    
    private init() {}
    
    var dependencies: [String: Any] = [:]
    
    func register<Dependency>(_ dependency: Dependency) {
        let key = String(describing: type(of: Dependency.self))
        #if DEBUG
        print(#function + " \(key) is registered")
        #endif
        dependencies[key] = dependency
    }
    
    func resolve<Dependency>() -> Dependency {
        let key = String(describing: type(of: Dependency.self))
        #if DEBUG
        print(#function + " \(key) is resolved")
        #endif
        return dependencies[key] as! Dependency
    }
}
