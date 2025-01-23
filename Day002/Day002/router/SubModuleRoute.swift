//
//  SubModuleRoute.swift
//  Day002
//
//  Created by admin on 2025/1/23.
//

import SwiftUI

// 子模块路由目标
enum SubModuleRoute: RouteProtocol {
    var id: String {
        switch self {
        case .settings:
            return "settings"
        case .profile(let userID):
            return "profile_\(userID)"
        }
    }
    
    case settings
    case profile(userID: String)
}
