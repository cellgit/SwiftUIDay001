//
//  ViewBuilderDemo.swift
//  Day001
//
//  Created by admin on 2024/7/26.
//

import SwiftUI

struct ViewBuilderDemo: View {
    
    // 性能已通过iPhone14 Pro 真机测试: 结果性能稳定且良好
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
    
    var body: some View {
    
        CustomList {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                CustomListItem {
                    Text(item)
                }
            }
        }
        
    }
}

#Preview {
    ViewBuilderDemo()
}
