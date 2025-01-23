//
//  RouteProtocol.swift
//  Day002
//
//  Created by admin on 2025/1/23.
//

import SwiftUI

// 路由目标协议
protocol RouteProtocol: Hashable, Identifiable {}

protocol RouterProtocol: ObservableObject {
    associatedtype RouteType: RouteProtocol

    var navigationPath: [RouteType] { get set }
    var presentedRoute: RouteType? { get set }

    func push(_ route: RouteType)
    func pop()
    func present(_ route: RouteType)
    func dismiss()
    func handleDeepLink(_ url: URL)
}
