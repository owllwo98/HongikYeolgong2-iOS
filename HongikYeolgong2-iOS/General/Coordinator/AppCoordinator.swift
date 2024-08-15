//
//  AppCoordinator.swift
//  HongikYeolgong2-iOS
//
//  Created by 권석기 on 8/8/24.
//

import SwiftUI

protocol AppCoordinatorType: Coordinator, ObservableObject {}

final class AppCoordinator: AppCoordinatorType {
    
    enum Scene: Hashable {
        case home
        case menu
        case webView(url: String)
    }
    
    @Published var paths: [Scene] = []
    
    @ViewBuilder
    func buildScreen(scene: Scene) -> some View {
        switch scene {
        case .home:
            HomeView()
        case .menu:
            MenuView()
        case .webView(let url):
            VStack {
                MyWebView(url: url)
                    .customNavigation(center: {
                        CustomText(font: .pretendard, title: "좌석", textColor: .customGray100, textWeight: .bold, textSize: 18)
                    }, right: {
                        Button(action: {
                            self.pop()
                        }, label: {
                            Image(.icClose)
                        })
                    })                    
            }
        }
    }
}
