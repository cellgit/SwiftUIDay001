//
//  MainView.swift
//  Day002
//
//  Created by admin on 2025/1/23.
//

//import SwiftUI

//struct MainView: View {
//    @EnvironmentObject var router: MainRouter
//
//    var body: some View {
//        VStack {
//            Text("Home View")
//                .font(.largeTitle)
//
//            Button("Go to Detail") {
//                router.push(.detail(message: "Hello from Home!"))
//            }
//            .padding()
//
//            Button("Present Modal") {
//                router.present(.detail(message: "Modal Message"))
//            }
//            .padding()
//        }
//        .navigationDestination(for: MainRoute.self) { route in
//            switch route {
//            case .home:
//                EmptyView() // 已在主界面显示，无需处理
//            case .detail(let message):
//                DetailView(message: message)
//            }
//        }
//    }
//}

//struct DetailView: View {
//    let message: String
//
//    var body: some View {
//        Text("Detail View: \(message)")
//    }
//}
//
//
//
//struct SettingsView: View {
//    var body: some View {
//        Text("Settings View")
//    }
//}
//
//struct ProfileView: View {
//    let userID: String
//
//    var body: some View {
//        Text("Profile View for User ID: \(userID)")
//    }
//}
