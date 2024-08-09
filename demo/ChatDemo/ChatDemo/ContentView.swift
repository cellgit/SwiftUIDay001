//
//  ContentView.swift
//  ChatDemo
//
//  Created by admin on 2024/8/9.
//

import SwiftUI
import ExyteChat


struct ContentView: View {
    
    @StateObject private var viewModel: ChatExampleViewModel
    
    private let title: String

    init(viewModel: ChatExampleViewModel = ChatExampleViewModel(), title: String) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.title = title
    }
    
    var body: some View {
        ChatView(messages: viewModel.messages, chatType: .conversation) { draft in
            viewModel.send(draft: draft)
        }
        .enableLoadMore(pageSize: 3) { message in
            viewModel.loadMoreMessage(before: message)
        }
        .messageUseMarkdown(messageUseMarkdown: true)
        .chatNavigation(
            title: viewModel.chatTitle,
            status: viewModel.chatStatus,
            cover: viewModel.chatCover
        )
        .onAppear(perform: viewModel.onStart)
        .onDisappear(perform: viewModel.onStop)
    }
}

//#Preview {
//    ContentView()
//}
