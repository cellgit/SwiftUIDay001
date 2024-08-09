//
//  MockAttachment.swift
//  ChatDemo
//
//  Created by admin on 2024/8/9.
//

import Foundation
import ExyteChat

struct MockImage {
    let id: String
    let thumbnail: URL
    let full: URL

    func toChatAttachment() -> Attachment {
        Attachment(
            id: id,
            thumbnail: thumbnail,
            full: full,
            type: .image
        )
    }
}

struct MockVideo {
    let id: String
    let thumbnail: URL
    let full: URL

    func toChatAttachment() -> Attachment {
        Attachment(
            id: id,
            thumbnail: thumbnail,
            full: full,
            type: .video
        )
    }
}
