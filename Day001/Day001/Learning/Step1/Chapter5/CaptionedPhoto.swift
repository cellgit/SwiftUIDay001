//
//  CaptionedPhoto.swift
//  Day001
//
//  Created by admin on 2024/8/7.
//

import SwiftUI

struct CaptionedPhoto: View {
    
    let assetName: String
    let captionText: String
    
    var body: some View {
        Image(assetName)
            .resizable()
            .scaledToFit()
            .overlay(alignment: .bottom, content: {
                Caption(text: "This photo is wider than it is tall !")
            })
            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            .padding()
    }
}

#Preview {
    CaptionedPhoto(assetName: "Pink_Peony", captionText: "This photo is wider than it is tall.")
}
