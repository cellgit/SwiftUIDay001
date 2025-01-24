//
//  RouteProtocol.swift
//  Day002
//
//  Created by admin on 2025/1/23.
//

import SwiftUI

/// 路由目标协议，每个路由枚举都需要实现 `Hashable, Identifiable`
protocol RouteProtocol: Hashable, Identifiable {
    var id: String { get }
}

// 通用路由器协议，用于对外统一各个路由器的行为
protocol RouterProtocol: ObservableObject {
    associatedtype RouteType: RouteProtocol
    
    // 路由栈和模态路由状态
    var navigationPath: [RouteType] { get set }
    var presentedRoute: RouteType? { get set }
    
    // 基础导航操作
//    func push(_ route: RouteType)
    
    // push, 支持回调数据
    func push(_ route: RouteType, completion: ((Any?) -> Void)?)
    
    func pop(_ data: Any?)
    
    func popToRoot(_ data: Any?)
    
    func popTo(_ route: RouteType, _ data: Any?)
    
    // 模态弹出操作
//    func present(_ route: RouteType)
    func present(_ route: RouteType, completion: ((Any?) -> Void)?)
    
    func dismiss(_ data: Any?)
    
    // 深链处理
    func handleDeepLink(_ url: URL)
    
    // 路由到视图的映射
    func destinationView(for route: RouteType) -> AnyView
    
}


extension RouteProtocol {
    
}






//// 通用路由器协议，用于对外统一各个路由器的行为
//protocol RouterProtocol: ObservableObject {
//    associatedtype RouteType: RouteProtocol
//    
//    // 路由栈和模态路由状态
//    var navigationPath: [RouteType] { get set }
//    var presentedRoute: RouteType? { get set }
//    
//    // 基础导航操作
//    func push(_ route: RouteType)
//    
//    func popToRoot()
//    
//    func popTo(_ route: RouteType)
//    
//    // 模态弹出操作
//    func present(_ route: RouteType)
//    func dismiss()
//    
//    // 深链处理
//    func handleDeepLink(_ url: URL)
//    
//    // 路由到视图的映射
//    func destinationView(for route: RouteType) -> AnyView
//    
//}
