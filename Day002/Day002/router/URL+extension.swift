//
//  URL+extension.swift
//  Day002
//
//  Created by admin on 2025/1/23.
//

import SwiftUI

extension URL {
    // URL扩展，用于处理查询参数
    var queryParameters: [String: String] {
        var params = [String: String]()
        if let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
           let queryItems = components.queryItems {
            for item in queryItems {
                params[item.name] = item.value
            }
        }
        return params
    }
}
