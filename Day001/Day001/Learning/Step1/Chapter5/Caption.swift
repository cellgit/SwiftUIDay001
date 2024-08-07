//
//  Caption.swift
//  Day001
//
//  Created by admin on 2024/8/7.
//

import SwiftUI

struct Caption: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .padding()
            .background(Color(.textContrast).opacity(0.75), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
            .padding()
    }
}

#Preview {
    Caption(text: "This photo is wider than it is tall.")
}
