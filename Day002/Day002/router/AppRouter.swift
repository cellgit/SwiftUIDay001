//
//  AppRouter.swift
//  Day002
//
//  Created by admin on 2025/1/23.
//

import SwiftUI

/**
 
 如何处理深度链接:
 1. 在info.plist添加URL Types，设置URL Schemes
 2. 在首页视图添加onOpenURL中处理深链接,如下:
 NavigationStack(path: $router.navigationPath) {
     
 }
 .onOpenURL { url in
     router.handleDeepLink(url)
 }
 
 
 深度链接如:
 myapp://detail?message=HelloWorld — 展示一个详情页
 myapp://profile?userID=12345
 myapp://settings — 展示设置页面
 
 
 */


// 应用路由的实现
class AppRouter: RouterProtocol {
    typealias RouteType = AppRoute
    
    @Published var navigationPath: [AppRoute] = []
    @Published var presentedRoute: AppRoute? = nil
    
    // 导航到下一页
    func push(_ route: AppRoute) {
        navigationPath.append(route)
    }
    
    /// 返回上一页
    func pop() {
        _ = navigationPath.popLast()
    }
    
    /// 模态弹出
    func present(_ route: AppRoute) {
        presentedRoute = route
    }
    
    /// 关闭模态
    func dismiss() {
        presentedRoute = nil
    }
    
    /// 返回到根视图
    func popToRoot() {
        navigationPath.removeAll()
    }
    
    /// 返回到指定路由
    func popTo(_ route: RouteType) {
        if let index = navigationPath.firstIndex(of: route) {
            let end = navigationPath.index(after: index)
            if end <= navigationPath.count {
                navigationPath = Array(navigationPath.prefix(end))
            }
        }
    }
    
    /// 替换当前路由
    func replaceCurrent(with route: RouteType) {
        _ = navigationPath.popLast()
        navigationPath.append(route)
    }
    
    // 深链处理
    func handleDeepLink(_ url: URL) {
        // 修正路径部分的解析，避免 pathComponents 为空
        guard let routerPath = url.routerPath, !routerPath.isEmpty else {
            print("Invalid deep link URL: \(url)")
            return
        }
        print("routerPath: \(routerPath)")  // 打印路径部分
        let params = url.queryParameters
        debugPrint("params====: \(params)")
        switch routerPath {
        case "detail":
            if let msg = params["message"] {
                push(.main(.detail(message: msg)))
            }
        case "profile":
            if let userID = params["userID"] {
                push(.sub(.profile(userID: userID)))
            }
        case "settings":
            push(.sub(.settings))
        default:
            print("Unhandled deep link: \(routerPath)")
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
