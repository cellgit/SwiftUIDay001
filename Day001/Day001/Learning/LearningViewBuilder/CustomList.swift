//
//  CustomList.swift
//  Day001
//
//  Created by admin on 2024/7/26.
//

import SwiftUI

struct CustomList<Content>: View where Content : View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                content
            }
        }
    }
}

#Preview {
    CustomList {
        let items: [String] = [
            "hi, 宝贝", "hi, 宝贝", "hi, 宝贝", "hi, 宝贝", "hi, 宝贝",
            "hi, 宝贝", "hi, 宝贝", "hi, 宝贝", "hi, 宝贝", "hi, 宝贝",
            "hi, 宝贝", "hi, 宝贝", "hi, 宝贝", "hi, 宝贝", "hi, 宝贝",
            "hi, 宝贝", "hi, 宝贝", "hi, 宝贝", "hi, 宝贝", "hi, 宝贝",
            "hi, 宝贝", "hi, 宝贝", "hi, 宝贝", "hi, 宝贝", "hi, 宝贝",
            "hi, 宝贝", "hi, 宝贝", "hi, 宝贝", "hi, 宝贝", "hi, 宝贝",
            "hi, 宝贝", "hi, 宝贝", "hi, 宝贝", "hi, 宝贝", "hi, 宝贝",
            "hi, 宝贝", "hi, 宝贝", "hi, 宝贝", "hi, 宝贝", "hi, 宝贝",
            "hi, 宝贝", "hi, 宝贝", "hi, 宝贝", "hi, 宝贝", "hi, 宝贝"
        ]
        ForEach(Array(items.enumerated()), id: \.offset) { index, item in
            CustomListItem {
                Text(item)
            }
        }
    }
}
