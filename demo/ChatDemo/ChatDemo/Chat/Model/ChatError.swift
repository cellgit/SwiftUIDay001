//
//  ChatError.swift
//  ChatDemo
//
//  Created by admin on 2024/8/9.
//

import Foundation

enum ChatError: Error {
    case unknown(source: Error?)
}
