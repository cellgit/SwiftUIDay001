//
//  ModuleD.swift
//  Day002
//
//  Created by admin on 2025/1/24.
//

import Combine

protocol Logging {
    func log(_ message: String)
}

extension Logging {
    func log(_ message: String) {
        print("[LOG]: \(message)")
    }
}

class ModuleD: Logging {
    var cancellables = Set<AnyCancellable>()
    
    init() {
        // 订阅事件
        EventBus.shared.subscribe(to: UserProfile.self) { profile in
            self.log("ModuleD: Received user profile: \(profile.name)")
        }.store(in: &cancellables)
    }
}
