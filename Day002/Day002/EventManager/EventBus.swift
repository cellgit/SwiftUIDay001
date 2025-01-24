//
//  EventBus.swift
//  Day002
//
//  Created by admin on 2025/1/24.
//

import Foundation
import Combine

final class EventBus {
    static let shared = EventBus()
    
    // 保存所有事件类型的发布者
    private var subjects: [String: Any] = [:]
    
    private init() {} // 确保单例
    
    /// 获取或创建事件发布者
    func publisher<T>(for type: T.Type) -> PassthroughSubject<T, Never> {
        let key = String(describing: type)
        if let subject = subjects[key] as? PassthroughSubject<T, Never> {
            return subject
        } else {
            let subject = PassthroughSubject<T, Never>()
            subjects[key] = subject
            return subject
        }
    }
    
    /// 发布事件
    func publish<T>(_ value: T) {
        let key = String(describing: T.self)
        (subjects[key] as? PassthroughSubject<T, Never>)?.send(value)
    }
    
    /// 订阅事件（辅助方法，返回 AnyCancellable）
    func subscribe<T>(to type: T.Type, handler: @escaping (T) -> Void) -> AnyCancellable {
        return publisher(for: type).sink(receiveValue: handler)
    }
}
