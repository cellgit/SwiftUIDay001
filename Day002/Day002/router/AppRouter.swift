//
//  AppRouter.swift
//  Day002
//
//  Created by admin on 2025/1/23.
//

import SwiftUI

// 应用路由的实现
class AppRouter: RouterProtocol {
    typealias RouteType = AppRoute
//    typealias AssociatedView = View  // 使用 `some View` 而非 `AnyView`
    
    @Published var navigationPath: [AppRoute] = []
    @Published var presentedRoute: AppRoute? = nil
    
    // 基础导航操作
    func push(_ route: AppRoute) {
        navigationPath.append(route)
    }
    
    func pop() {
        _ = navigationPath.popLast()
    }
    
    func present(_ route: AppRoute) {
        presentedRoute = route
    }
    
    func dismiss() {
        presentedRoute = nil
    }
    
    // 深链处理
    func handleDeepLink(_ url: URL) {
        let params = url.queryParameters
        
        // 根据URL路径处理不同的路由
        if url.pathComponents.contains("detail"),
           let msg = params["message"] {
            push(.main(.detail(message: msg)))
        } else if url.pathComponents.contains("profile"),
                  let userID = params["userID"] {
            push(.sub(.profile(userID: userID)))
        } else if url.pathComponents.contains("settings") {
            push(.sub(.settings))
        }
    }
    
    // 路由到视图的映射
    func destinationView(for route: AppRoute) -> AnyView {
        switch route {
        case let .main(mainRoute):
            return mainRoute.destinationView()
        case let .sub(subRoute):
            return subRoute.destinationView()
        }
    }
}
