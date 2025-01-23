//
//  ContentView.swift
//  Day002
//
//  Created by admin on 2025/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var router: AppRouter
    
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            // 显示主模块的首页
            HomeView()
                .navigationTitle("首页")
                .toolbar {
                    ToolbarItemGroup(placement: .automatic) {
                        Button("去详情页") {
                            router.push(.main(.detail(message: "Hello SwiftUI!")))
                        }
                        Button("去设置页") {
                            router.present(.sub(.settings))
                        }
                        
                        Button("去个人资料") {
                            router.push(.sub(.profile(userID: "12345")))
                        }
                    }
                }
            // 绑定 navigationDestination
                .navigationDestination(for: AppRoute.self) { route in
                    router.destinationView(for: route)
                }
            // 使用 sheet 演示 presentedRoute
                .sheet(item: $router.presentedRoute) { route in
                    // 也用同一个方法构造
                    router.destinationView(for: route)
                }
                
                
        }
        .onOpenURL { url in
            router.handleDeepLink(url)
        }
        
    }
}
