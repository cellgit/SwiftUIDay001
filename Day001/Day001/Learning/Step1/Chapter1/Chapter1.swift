
/**
 
 第1节

 应用程序结构

 应用程序结构描述了应用程序的内容和行为，每个SwiftUI应用程序都只有一个主要应用程序结构。此示例在MyApp.swift文件中定义了其应用程序结构。让我们看看那个文件的内容。
 
 
 第1步

 要访问SwiftUI的符号和功能，该应用程序使用导入声明来导入SwiftUI框架。

 笔记

 有关更多信息，请参阅Swift编程语言中的导入声明。
 
 
 第2步

 为了指示SwiftUI应用程序的入口点，示例将@main属性应用于应用程序结构。

 入口点负责应用程序的启动。

 重要的
 
 SwiftUI应用程序只包含一个入口点。尝试将@main应用于应用程序中的多个结构会导致编译器错误。
 
 第3步

 MyApp结构符合App协议，并提供应用程序的内容及其行为。
 
 
 
 
 
 第4步

 ContentView包含SwiftUI提供的视图VStack，该视图垂直排列子视图。

 VStack同时渲染其包含的任何屏幕内或屏幕外视图。当您有少量子视图时，使用VStack是理想的选择。但是，如果您的应用程序需要显示更多子视图，请考虑使用LazyVStack，它仅在应用程序需要在屏幕上显示时渲染视图。

 实验

 用HStack或LazyHStack替换VStack，以水平排列子视图。
 
 
 ViewBuilderDemo 可以测试 `LazyVStack` 性能
 
 
 第5步

 VStack中的第一个子视图是Image，这是一个显示图像的视图。

 示例使用初始化器方法init（systemName:）显示地球的图像。此方法创建一个显示系统符号图像的图像视图。像地球仪这样的符号图像来自SF Symbols，这是一个您可以在应用程序中使用的图标库。
 
 第6步

 ContentView将视图修饰符imageScale(_:)应用于图像视图，将视图中的图像缩放为相对大小Image.Scale.large。

 实验

 将Image.Scale.large更改为另一个比例大小。有关尺寸列表，请参阅Image.Scale。
 
 
 第7步
 
 前景颜色（_：）修饰符为图像视图添加颜色。
 注: 这里要学会使用在 `Assets` 里设置颜色

 在此示例中，ContentView应用语义颜色口音颜色，它反映了系统或应用程序的口音颜色。要了解有关颜色表示的更多信息，请参阅颜色。

 实验

 将前景颜色更改为另一种语义颜色，如主色或标准颜色，如蓝绿色。
 
 
 第8步

 VStack的第二个子视图是文本，这是一个显示一行或多行只读文本的视图。

 实验

 替换“你好，世界！”带着“你好，你的名字！”或其他文本。
 
 
 第9步

 ContentView将填充（_:_:）修饰符应用于VStack，将特定于平台的默认填充量（即空间）添加到VStack视图的边缘。

 实验

 您可以通过提供边缘和长度参数值来指定要应用的边缘和填充数量；例如，填充（[.bottom，.trailing]，20）。更改填充边缘和数量，或注释代码行，以查看它对视图的影响。
 
 
 第10步

 当您运行示例应用程序时，它会显示包含ContentView中描述的视图层次结构的场景。

 实验

 使用Xcode构建并运行示例。然后按照前面步骤中提到的建议的实验来玩弄代码。
 
 
 Next: Section2
 紧接着的

 使用场景指定应用程序的视图层次结构

 场景包含应用程序的视图层次结构。
 
 
 */



import SwiftUI

struct ContentView_Step1: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(Color("color_purple"))
            Text("Hello, world!")
                .padding()
            
            
            HStack { Image(systemName: "swift").imageScale(.small); Text("Small") }
            HStack { Image(systemName: "swift").imageScale(.medium); Text("Medium") }
            HStack { Image(systemName: "swift").imageScale(.large); Text("Large") }
        }
        .padding([.bottom, .trailing], 20)
    }
}

#Preview {
    ContentView_Step1()
}
