//
//  MainRoute.swift
//  Day002
//
//  Created by admin on 2025/1/23.
//

import SwiftUI

/// 主模块的路由
enum MainRoute: RouteProtocol {
    case home
    case detail(message: String)

    var id: String {
        switch self {
        case .home:
            return "main_home"
        case let .detail(msg):
            return "main_detail_\(msg)"
        }
    }
}


// 路由到视图的映射扩展
extension MainRoute {
    func destinationView() -> AnyView {
        switch self {
        case .home:
            return AnyView(HomeView())
        case let .detail(msg):
            return AnyView(DetailView(message: msg))
        }
    }
}
