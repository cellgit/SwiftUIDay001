//
//  URL+extension.swift
//  Day002
//
//  Created by admin on 2025/1/23.
//

import SwiftUI

extension URL {
    var queryParameters: [String: String] {
        var params = [String: String]()
        URLComponents(url: self, resolvingAgainstBaseURL: true)?.queryItems?.forEach {
            params[$0.name] = $0.value
        }
        return params
    }
}
