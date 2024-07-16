//
//  HongikYeolgong2_iOSApp.swift
//  HongikYeolgong2-iOS
//
//  Created by 석기권 on 7/1/24.
//

import SwiftUI

@main
struct HongikYeolgong2_iOSApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var coordinator = SceneCoordinator()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(coordinator)
                .environmentObject(HomeViewModel())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        registerDependency()
        
        return true
    }
}

func registerDependency() {
    DIContainer.shared.register(CalendarRepositoryImpl() as CalendarRepositoryProtocol)
}
