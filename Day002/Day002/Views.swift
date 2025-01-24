//
//  Views.swift
//  Day002
//
//  Created by admin on 2025/1/23.
//

import SwiftUI

struct DetailView: View {
    
    let message: String
    
    @EnvironmentObject var router: AppRouter  // 注入 Router 实例
    
    var body: some View {
        
        NavigationStack(path: $router.navigationPath) {
            
            VStack(spacing: 16) {
                Text("参数 message: \(message)")
                    .font(.title3)
                
                Button("返回根视图") {
                    router.popToRoot()
                }
                .padding()
                .frame(width: 120)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                Button("去设置页") {
                    router.push(.sub(.settings)) { data in
                        print("传递的数据: \(String(describing: data))")
                    }
                }
                .padding()
                .frame(width: 120)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .navigationTitle("详情")
            .navigationDestination(for: AppRoute.self) { route in
                router.destinationView(for: route)
            }
        }
        
        
        
    }
}

struct SettingsView: View {
    
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        
        Button("返回上一页") {
//            router.pop()
            
            let json = ["name": "张三", "age": 18] as [String : Any]
            router.pop(json)
        }
        .padding()
        .frame(width: 120)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(8)
        .navigationTitle("设置")
        
        Button("返回根视图") {
            router.popToRoot()
        }
        .padding()
        .frame(width: 120)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(8)
    }
}

struct ProfileView: View {
    
    let userID: String
    
    @State private var navigateToDetail = false
    
    
    var body: some View {
        
        VStack {
            Text("子模块的 个人资料，userID = \(userID)")
                .font(.title3)
            
            // 点击按钮跳转到详情页面
            NavigationLink(destination: DetailView(message:  userID)) {
                Text("查看详情")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
            
            // 点击按钮触发跳转
            Button("查看详情") {
                navigateToDetail = true  // 改变状态，触发跳转
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding()
            
        }
        .navigationTitle("个人资料")
        .navigationDestination(isPresented: $navigateToDetail) {
            DetailView(message: userID)  // 跳转到 DetailView
        }
        
    }
    
}
