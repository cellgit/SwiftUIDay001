//
//  ModuleC.swift
//  Day002
//
//  Created by admin on 2025/1/24.
//

import Combine

class ViewModelC {
    var cancellables = Set<AnyCancellable>()
    
    init() {
        // 订阅 UserProfile 类型的事件
        EventBus.shared.subscribe(to: UserProfile.self) { profile in
            print("ModuleC: Received user profile: \(profile.name), \(profile.age)")
        }.store(in: &cancellables) // 存储订阅
    }
}
