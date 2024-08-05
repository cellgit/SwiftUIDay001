/**
 保持内置视图的可适应大小

 对于应用程序显示的每种类型的内容，在任何设备上保持应用程序的视图布局流畅。

 您使用SwiftUI定义的视图要么直接包含SwiftUI提供的视图，要么使用包含这些内置视图的其他自定义视图。SwiftUI视图决定自己的大小，了解如何修改内置视图的大小，同时保持其适应性，是在不使代码复杂化的情况下创建流畅布局的最佳方式。
 
 
 文本和符号

 在定义应用程序的布局时，文本和符号在向人们传达信息方面发挥着核心作用——在导航链接、按钮标签、表格等中。显示信息或标记其他元素的文本和符号需要有足够的空间来显示其内容。

 文本

 文本视图显示只读文本。它的内容可以是一个简短的字符串，如戏剧的标题或部分的标题。文本视图也可以显示更长的字符串，就像剧中场景的所有演员台词一样。

 当您在布局中声明文本视图时，使用字体属性提供有关文本的系统语义信息。系统选择字体面和大小，例如，带有标题字体的文本比带有正文或标题的文本更突出。
 
 
 文本视图可以通过换行或截断来调整某些空间限制，但它不会更改字体大小，以适应其理想大小小于或大于可用空间的情况。

 有关本地化的更多信息，请参阅准备本地化视图。有关支持动态类型的指导，请参阅将自定义字体应用于文本。

 
 符号

 符号，如SF Symbols提供的图标，可以表示常见的应用程序功能，如文件夹、收藏夹的心形或访问相机的相机图标。有效的符号简化了应用程序的用户界面，并且很容易被使用您应用程序的人识别。您可以使用SwiftUI中提供的标准视图修饰符自定义其颜色和大小。即使您在图像中指定了系统或自定义符号，也要将SF符号更像文本一样对待。要调整符号的大小和重量，请指定语义字体，如标题，就像文本视图一样。

 以下示例使用HStack创建一行三个图像视图，从SF符号中显示图标。
 
 
 标签

 要同时使用文本和符号来表示应用程序中的单个元素，请使用标签。标签负责匹配其标题和图标大小及其对齐。以下代码定义了一个标签，该标签结合了一些书籍的SF符号，以及一些标题的文本。标签将大标题字体应用于图标和标题。titleAndIcon样式告诉视图同时显示其标题和图标，覆盖包含视图可能指定的任何内置或自定义LabelStyle。
 
 
 控制

 人们交互的视图有离散的大小，以便在多个相同类型的元素一起出现时保持一致性，例如在设置窗格中。控件也需要足够大，以便人们能够准确地点击或点击。您可以使用视图修饰符在这些尺寸中进行选择。例如，您可以使用controlSize(_:)修饰符使控件变小或变大，或者您可以使用progressViewStyle(_:)修饰符为进度条选择线性或圆形外观。

 以下示例显示了具有不同ControlSize值的选择器和按钮。
 
 //        VStack {
 //            HStack {
 //                Picker("Choice", selection: $choice) {
 //                    choiceList()
 //                }
 //                Button("OK") {
 //                    applyChanges()
 //                }
 //            }
 //            .controlSize(.mini)
 //            HStack {
 //                Picker("Choice", selection: $choice) {
 //                    choiceList()
 //                }
 //                Button("OK") {
 //                    applyChanges()
 //                }
 //            }
 //            .controlSize(.large)
 //        }
 
 有菜单和链接等通用控件，以及EditButton和ColorPicker等专用视图。使用这些视图来提供熟悉的UI元素，而不是创建您需要维护的自定义控件。要探索更多这些内置视图，请参阅控制和指标。
 
 
 图像和形状

 图形元素，如图像和形状，可以为您的应用程序添加视觉增强级别。这些可以从购物应用程序的产品图像、游戏的成就或通过分层和对齐各种形状创建的动态背景模式不等。
 
 图像

 在图像中显示照片和其他丰富的图形。默认情况下，图像以资产的原始大小显示。您可以添加可调整（capInsets:resizingMode:）和scaledToFit（）或scaledToFill（）等修饰符，以将其缩放到可用空间。
 
 如果您从服务器访问图像资产，请使用AsyncImage处理下载，同时保持应用程序的响应。

 有关处理图像的更多信息，请参阅将图像拟合到可用空间。
 
 
 形状

 SwiftUI提供了几种常见的形状和修饰符，以更改其大小、颜色或外观的其他方面。使用单个形状或多个形状的组合来创建背景、边框或其他视觉元素。您可以使用框架（minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:imach等修饰符定义形状的大小，或允许它填充所有可用空间。

 以下示例显示了三种不同的形状。每个形状上的foregroundColor(_:)自定义该形状的填充颜色。RoundedRectangle包括角半径的值和样式参数来定义圆角。HStack在每个形状之间提供一些默认间距，为了给每个形状一个要填充的正方形空间， aspectRatio(_:contentMode:)修饰符使HStack的宽度是它的三倍。
 
 有关组成形状的丰富可能性的示例，请参阅绘制路径和形状:
 https://developer.apple.com/tutorials/SwiftUI/drawing-paths-and-shapes?changes=latest_minor
 
 
 紧接着的

 缩放视图以补充文本

 构建适应字体样式、动态类型和不同字符串长度的布局。
 
 
 */

import SwiftUI

struct TextAndSymbols: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                Text("Hamlet")
                    .font(.largeTitle)
                Text("by William Shakespeare")
                    .font(.caption)
                    .italic()
                    .padding(.bottom)
                
                HStack {
                    Image(systemName: "folder.badge.plus")
                    Image(systemName: "heart.circle.fill")
                    Image(systemName: "alarm")
                    Image(systemName: "bolt")
                }
                .symbolRenderingMode(.multicolor)
                .font(.largeTitle)
                .padding(.bottom)
                
                
                Label("Favorite Books", systemImage: "books.vertical")
                    .labelStyle(.titleAndIcon)
                    .font(.largeTitle)
                    .padding(.bottom)
                
                
                VStack(alignment: .center, spacing: 10, content: {
                    EditButton()
                        .padding(.bottom)
                    // 颜色选择器
                    ColorPicker(selection: .constant(.red), label: {
                        Text("Label")
                    })
                    .padding(.horizontal)
                    .frame(width: 120, alignment: .center)
                })
                .padding(.bottom)
                
                
                Image("Yellow_Daisy")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                
                HStack {
                    Rectangle()
                        .foregroundColor(.blue)
                    Circle()
                        .foregroundColor(.orange)
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .foregroundColor(.green)
                }
                .aspectRatio(3.0, contentMode: .fit)
                .padding()
                
                
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.blue.opacity(0.2))
                        .frame(width: 200, height: 200,alignment: .leading)
                    Circle()
                        .foregroundColor(Color.orange.opacity(0.1))
                        .frame(width: 300, height: 300,alignment: .center)
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .foregroundColor(Color.green.opacity(0.1))
                        .frame(width: 150, height: 150,alignment: .trailing)
                }
                .aspectRatio(3.0, contentMode: .fit)
                .padding()
                
                
                
                
                
                
                
                
            }
        }
        
        
        
        
        
        
        
        
    }
}

#Preview {
    TextAndSymbols()
}
