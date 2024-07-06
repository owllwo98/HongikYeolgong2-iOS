//
//  HongikYeolgong2_iOSApp.swift
//  HongikYeolgong2-iOS
//
//  Created by 석기권 on 7/1/24.
//

import SwiftUI

@main
struct HongikYeolgong2_iOSApp: App {
    @StateObject private var coordinator = SceneCoordinator()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(coordinator)                
        }
    }
}
