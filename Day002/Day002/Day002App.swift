//
//  Day002App.swift
//  Day002
//
//  Created by admin on 2025/1/23.
//

import SwiftUI

@main
struct Day002App: App {
    
    @StateObject private var router = MainRouter()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navigationPath) {
                MainView()
                    .environmentObject(router)
                    .sheet(item: $router.presentedRoute) { route in
                        switch route {
                        case .home:
                            EmptyView()
                        case .detail(let message):
                            DetailView(message: message)
                        }
                    }
            }
            .onOpenURL { url in
                router.handleDeepLink(url)
            }
        }
    }
}
