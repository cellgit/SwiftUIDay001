//
//  Sequence+asyncMap.swift
//  ChatDemo
//
//  Created by admin on 2024/8/9.
//

import Foundation

extension Sequence {
    func asyncMap<T>(
        _ transform: (Element) async throws -> T
    ) async rethrows -> [T] {
        var values = [T]()

        for element in self {
            try await values.append(transform(element))
        }

        return values
    }
}
