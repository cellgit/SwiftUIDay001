//
//  Views.swift
//  Day002
//
//  Created by admin on 2025/1/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("这是主模块的 Home 页面")
                .font(.title)
        }
    }
}

struct DetailView: View {
    let message: String
    var body: some View {
        Text("详情页面，message = \(message)")
            .font(.title3)
    }
}

struct SettingsView: View {
    var body: some View {
        Text("子模块的 设置 页面")
            .font(.title3)
    }
}

struct ProfileView: View {
    let userID: String
    var body: some View {
        Text("子模块的 个人资料，userID = \(userID)")
            .font(.title3)
    }
}
