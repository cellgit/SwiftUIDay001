//
//  VerticalScrollView.swift
//  Day001
//
//  Created by admin on 2024/7/26.
//

import SwiftUI

public struct VerticalScrollView<Content>: View where Content : View {
    public let content: Content
    
    /// 使用 @ViewBuilder 使得 content 参数可以包含多个视图
    /// - Parameter content: 视图参数
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                content
            }
            .padding()
        }
    }
}

#Preview {
    VerticalScrollView {
        ForEach(0..<50) { index in
            Text("Item \(index)")
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
        }
    }
}
