//
//  ContentView.swift
//  DocumentDemo
//
//  Created by admin on 2024/8/9.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: DocumentDemoDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(DocumentDemoDocument()))
}
