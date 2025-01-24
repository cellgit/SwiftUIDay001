//
//  EventSubscribing.swift
//  Day002
//
//  Created by admin on 2025/1/24.
//

//import Foundation
//import Combine
//
//protocol EventSubscribing: AnyObject {
//    var cancellables: Set<AnyCancellable> { get set }
//    
//    /// 存储订阅
//    func store(_ cancellable: AnyCancellable)
//    
//    /// 清理所有订阅
//    func clearSubscriptions()
//}
//
//extension EventSubscribing {
//    func store(_ cancellable: AnyCancellable) {
//        cancellables.insert(cancellable)
//    }
//    
//    func clearSubscriptions() {
//        cancellables.removeAll()
//    }
//}
