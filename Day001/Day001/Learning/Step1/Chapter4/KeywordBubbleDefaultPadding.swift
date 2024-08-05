//
//  KeywordBubbleDefaultPadding.swift
//  Day001
//
//  Created by admin on 2024/8/5.
//

import SwiftUI

struct KeywordBubbleDefaultPadding: View {
    let keyword: String
    let symbol: String
    var body: some View {
        Label(keyword, systemImage: symbol)
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .background(.purple.opacity(0.75), in: Capsule())
    }
}

#Preview {
    let keywords = ["chives", "fern-leaf lavender"]
    return VStack {
        ForEach(keywords, id: \.self) { word in
            KeywordBubbleDefaultPadding(keyword: word, symbol: "leaf")
        }
    }
}
