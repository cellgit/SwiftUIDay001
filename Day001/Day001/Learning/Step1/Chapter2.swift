/**
 应用程序原则

 使用场景指定应用程序的视图层次结构

 场景包含应用程序的视图层次结构。

 SwiftUI提供构建块，帮助您创建应用程序的用户界面。其中一个构建块是场景，它包含定义应用程序用户界面的视图层次结构。您可以在SwiftUI提供的场景中指定应用程序的视图层次结构，也可以创建自定义场景。本教程将引导您完成这两种方法。
 
 第1节

 向应用程序添加场景

 此示例使用日志应用程序作为示例。为了描述应用程序用户界面的视图层次结构，MyApp结构声明场景及其内容。让我们来看看结构和它的场景。
 
 第1步

 该示例使用@main属性和符合App协议的结构MyApp定义了一个入口点。

 笔记

 入口点和MyApp结构负责应用程序的启动。每个SwiftUI应用程序只有一个入口点和主应用程序结构。
 
 注: 这里和视图结构一样,只需要将 View -> App, 再添加上main入口, 确保整个工程中@main只使用一次
 
 
 第2步

 MyApp结构实现了计算的属性主体，它返回一个场景。

 计算的身体属性可以返回一个或多个主要和次要场景。
 
 
 第3步

 在此示例中，主体返回主场景WindowGroup，该场景描述了示例主窗口的视图层次结构。

 WindowGroup场景是最常用的场景之一。它为您的应用程序提供特定于平台的行为，例如支持macOS和iPadOS中的多个窗口。有关此场景以及SwiftUI提供的其他场景的更多信息，请参阅场景。
 
 
 第4步

 视图层次结构的根节点是TabView，这是一个容器视图，提供人们可用于在不同子视图之间切换的选项卡。
 
 
 第5步

 TabView包含两个子视图，ContentView和SettingsView。

 两者都是自定义视图。ContentView显示日志条目列表，SettingsView显示其他视图，允许人们编辑应用程序的设置，例如与日志关联的帐户。
 
 
 第6步

 每个视图都应用tabItem(_:)修饰符，该修饰符告诉TabView在每个选项卡中显示的图像和文本。
 
 注: 这里要学会`modifier`修饰符的使用
 
 
 
 
 
 */

import SwiftUI

@main
struct Section2: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Journal", systemImage: "book")
                    }
                ViewBuilderDemo()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }
}



////@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 7.0, *)
//extension View {
//    public func tabItem2dddd<V>(@ViewBuilder _ label: () -> V) -> some View where V : View
//}






struct TabItemModifier<V: View>: ViewModifier {
    let label: V
    
    func body(content: Content) -> some View {
        // 实际上，SwiftUI会将这个修饰器转换为与TabView的交互
        content
            .overlay(label, alignment: .bottom) // 这是一个简化的示例
    }
}

extension View {
    public func tabItem2<V>(@ViewBuilder _ label: () -> V) -> some View where V: View {
        
        ViewModifier
        
        self.modifier(TabItemModifier(label: label()))
    }
}

// 示例用法
struct View1: View {
    var body: some View {
        Text("View 1")
    }
}

struct View2: View {
    var body: some View {
        Text("View 2")
    }
}

struct TabItemExample: View {
    var body: some View {
        TabView {
            View1()
                .tabItem2 {
                    Label("Menu", systemImage: "list.dash")
                }
            
            View2()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}
