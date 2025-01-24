//
//  ModuleA.swift
//  Day002
//
//  Created by admin on 2025/1/24.
//

import Combine

class ViewModelA {
    var cancellables = Set<AnyCancellable>() // 存储订阅
    
    init() {
        // 订阅 UserProfile 类型的事件
        EventBus.shared.subscribe(to: UserProfile.self) { profile in
            print("ModuleA: Received user profile: \(profile.name), \(profile.age)")
        }.store(in: &cancellables) // 使用协议的 store 方法
    }
}
