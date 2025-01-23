//
//  MainRoute.swift
//  Day002
//
//  Created by admin on 2025/1/23.
//

import SwiftUI

// 主模块路由目标
enum MainRoute: RouteProtocol {
    var id: String {
        switch self {
        case .home:
            return "home"
        case .detail(let message):
            return "detail_\(message)"
        }
    }
    
    case home
    case detail(message: String)
}

class MainRouter: RouterProtocol {
    typealias RouteType = MainRoute
    
    @Published var navigationPath: [MainRoute] = []
    @Published var presentedRoute: MainRoute? = nil
    
    func push(_ route: MainRoute) {
        navigationPath.append(route)
    }
    
    func pop() {
        _ = navigationPath.popLast()
    }
    
    func present(_ route: MainRoute) {
        presentedRoute = route
    }
    
    func dismiss() {
        presentedRoute = nil
    }
    
    func handleDeepLink(_ url: URL) {
        if url.pathComponents.contains("detail"), let message = url.queryParameters["message"] {
            push(.detail(message: message))
        }
    }
}
