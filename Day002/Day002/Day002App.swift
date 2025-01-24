//
//  Day002App.swift
//  Day002
//
//  Created by admin on 2025/1/23.
//

import SwiftUI

#if os(iOS)
import UIKit
let isPad = UIDevice.current.userInterfaceIdiom == .pad
#endif


@main
struct Day002App: App {
    
    @StateObject private var router = AppRouter()
    
    var body: some Scene {
        WindowGroup {
            
            #if os(macOS)
            
            NavigationSplitView {
                // 左侧的导航区域
                List {
                    NavigationLink(destination: ContentView()
                                    .environmentObject(router)) {
                        Text("个人资料")
                    }
                    
                    NavigationLink(destination: DetailView(message: "Hello from Detail")
                                    .environmentObject(router)) {
                        Text("详情")
                    }
                }
                .frame(minWidth: 200)  // 左侧导航区域的最小宽度
                .navigationTitle("导航")
            } detail: {
                // 详情区域，默认显示一个视图
                Text("请选择左侧的项")
            }
            
            #else
            if isPad {
                NavigationSplitView {
                    // 左侧的导航区域
                    List {
                        NavigationLink(destination: HomeView()
                                        .environmentObject(router)) {
                            Text("个人资料")
                        }
                        
                        NavigationLink(destination: DetailView(message: "Hello from Detail")
                                        .environmentObject(router)) {
                            Text("详情")
                        }
                    }
                    .frame(minWidth: 200)  // 左侧导航区域的最小宽度
                    .navigationTitle("导航")
                } detail: {
                    // 详情区域，默认显示一个视图
                    Text("请选择左侧的项")
                }
            }
            else {
                // 右侧的内容区域，包含 TabView
                TabView {
                    // Tab 1: 个人资料视图
                    HomeView()
                        .tabItem {
                            Label("主页", systemImage: "person.circle")
                        }
                        .environmentObject(router)  // 让 router 可以在 ProfileView 中访问
                    
                    // Tab 2: 详情视图
                    DetailView(message: "Hello from Detail")
                        .tabItem {
                            Label("详情", systemImage: "doc.text")
                        }
                        .environmentObject(router)  // 让 router 可以在 DetailView 中访问
                }
                .environmentObject(router)  // 在整个 TabView 中共享 router
                
            }
            
            #endif
            
            
        }
    }
}
