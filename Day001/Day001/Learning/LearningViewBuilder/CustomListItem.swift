//
//  CustomListItem.swift
//  Day001
//
//  Created by admin on 2024/7/26.
//

import SwiftUI

struct CustomListItem<Content>: View where Content : View {
    
    let content: Content
    
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    
    var body: some View {
        
        HStack {
            content
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
        
    }
}

#Preview {
    CustomListItem {
        Text("Hi, 宝贝, 也许你能看到, 今天是2024年7月26号")
    }
}
