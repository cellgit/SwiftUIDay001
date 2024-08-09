//
//  DocumentDemoApp.swift
//  DocumentDemo
//
//  Created by admin on 2024/8/9.
//

import SwiftUI

@main
struct DocumentDemoApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: DocumentDemoDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
