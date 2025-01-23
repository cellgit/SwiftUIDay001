//
//  Day002App.swift
//  Day002
//
//  Created by admin on 2025/1/23.
//

import SwiftUI

@main
struct Day002App: App {
    
    @StateObject private var router = AppRouter()
    
    var body: some Scene {
        WindowGroup {
            // 你的入口视图
            ContentView()
            // 如果在内部想通过 .environmentObject 获取 router，可以写这一行
                .environmentObject(router)
        }
        
//        // 监听外部深链
//        .onOpenURL { url in
//            router.handleDeepLink(url)
//        }
    }
}
