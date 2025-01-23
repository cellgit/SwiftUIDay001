//
//  RouteProtocol.swift
//  Day002
//
//  Created by admin on 2025/1/23.
//

import SwiftUI

/// 路由目标协议，每个路由枚举都需要实现 `Hashable, Identifiable`
protocol RouteProtocol: Hashable, Identifiable {}

// 通用路由器协议，用于对外统一各个路由器的行为
protocol RouterProtocol: ObservableObject {
    associatedtype RouteType: RouteProtocol
    
    // 路由栈和模态路由状态
    var navigationPath: [RouteType] { get set }
    var presentedRoute: RouteType? { get set }
    
    // 基础导航操作
    func push(_ route: RouteType)
    func pop()
    func popToRoot()
    func popTo(_ route: RouteType)
    
    // 模态弹出操作
    func present(_ route: RouteType)
    func dismiss()
    
    // 深链处理
    func handleDeepLink(_ url: URL)
    
    // 路由到视图的映射
    func destinationView(for route: RouteType) -> AnyView
    
}


extension RouterProtocol {
    func popToRoot() {
        navigationPath.removeAll()
    }
    
    func popTo(_ route: RouteType) {
        if let index = navigationPath.firstIndex(of: route) {
            let end = navigationPath.index(after: index)
            if end <= navigationPath.count {
                navigationPath = Array(navigationPath.prefix(end))
            }
        }
    }
    
    func replaceCurrent(with route: RouteType) {
        _ = navigationPath.popLast()
        navigationPath.append(route)
    }
}
