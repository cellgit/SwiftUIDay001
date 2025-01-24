//
//  ModuleB.swift
//  Day002
//
//  Created by admin on 2025/1/24.
//

import Foundation

class ViewModelB {
    func publishEvent() {
        let profile = UserProfile(name: "Alice", age: 28)
        print("ModuleB: Publishing userLoggedIn event")
        EventBus.shared.publish(profile)
    }
}
