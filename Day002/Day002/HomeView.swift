//
//  ContentView.swift
//  Day002
//
//  Created by admin on 2025/1/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var router: AppRouter
    
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            // 显示主模块的首页
            List {
                NavigationLink(
                    "去详情页",
                    value: AppRoute.main(.detail(message: "Hello SwiftUI!"))
                )
                NavigationLink(
                    "去设置页",
                    value: AppRoute.sub(.settings)
                )
                NavigationLink(
                    "个人资料",
                    value: AppRoute.sub(.profile(userID: "12345"))
                )
            }
            .navigationTitle("首页")
            .navigationDestination(for: AppRoute.self) { route in
                router.destinationView(for: route)
            }
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
