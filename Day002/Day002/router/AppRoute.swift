//
//  AppRoute.swift
//  Day002
//
//  Created by admin on 2025/1/23.
//

import Foundation

/// 将应用内所有路由统一到一个枚举里
enum AppRoute: RouteProtocol {
    case main(MainRoute)
    case sub(SubModuleRoute)
    
    var id: String {
        switch self {
        case let .main(m):
            return "AppRoute_main_\(m.id)"
        case let .sub(s):
            return "AppRoute_sub_\(s.id)"
        }
    }
}
