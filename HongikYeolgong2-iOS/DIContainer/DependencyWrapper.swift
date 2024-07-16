//
//  DependencyWrapper.swift
//  HongikYeolgong2-iOS
//
//  Created by 석기권 on 7/16/24.
//

import Foundation

@propertyWrapper
class Inject<Dependency> {
    var wrappedValue: Dependency
    
    init() {
        self.wrappedValue = DIContainer.shared.resolve()
    }
}
